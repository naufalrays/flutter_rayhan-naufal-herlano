import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  late UserCredential _userCredential;
  bool? _isAdmin;
  UserCredential get userCredential => _userCredential;
  bool? get isAdmin => _isAdmin;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  String? message;

  void login(String email, String password, BuildContext context) async {
    message = null;
    try {
      _userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user!.emailVerified) {
        message = null;
        route;
        notifyListeners();
      } else {
        message = 'Ada';
        message = "You must verify your email first!";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }
    } catch (e) {
      message = "Can't Login";
    }
    // notifyListeners();
  }

  void signup(
    BuildContext context,
    String username,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // print('We have sent a verification link to $email');
      Navigator.pop(context);

      postDetailsToFirestore(username, email);
      await userCredential.user!.sendEmailVerification();
      message = 'We have sent a verification link to $email';
      // showAlertDialog(context, message!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exist for that email.';
        // print('The account already exist for that email.');
      }
    } catch (e) {
      // print(e);
      // print('ERROR APAAN GATAU');
      message = "Can't register this account";
    }
    // notifyListeners();
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  void resetPassword(String email) async {
    if (email != "" && EmailValidator.validate(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);

        message = "We have sent a verification reset password to $email ";
      } catch (e) {
        // Get.defaultDialog(
        //   title: "Something went wrong",
        //   middleText: "Can't sent reset password",
        // );
      }
    } else {
      // Get.defaultDialog(
      //   title: "Something went wrong",
      //   middleText: "Invalid Email",
      // );
    }
  }

  void showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // title: const Text('Confirm'),
          content: Text('We have sent a verification link to $message'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void postDetailsToFirestore(String username, String email) async {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore db = FirebaseFirestore.instance;
    final userData = <String, dynamic>{
      "username": username,
      "email": email,
      "role": "user",
    };

    db.collection("users").doc(user!.uid).set(userData);
  }

  void route() {
    // print('ada data');

    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "admin") {
          _isAdmin = true;
        } else {
          _isAdmin = false;
          notifyListeners();
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }
}
