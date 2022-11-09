import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notula_notes/pages/admin/admin_page.dart';
import 'package:notula_notes/pages/settings/settings_page.dart';

import '../components/bottom_navigation.dart';
import 'home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  bool? _isAdmin;
  @override
  void initState() {
    route(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      _isAdmin != null
          ? _isAdmin!
              ? AdminPage()
              : const HomePage()
          : const Center(child: CircularProgressIndicator()),
      const SettingPage(),
    ];

    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigation(
        onItemSelected: onItemSelected,
      ),
    );
  }

  onItemSelected(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void route(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "admin") {
          _isAdmin = true;
          setState(() {});
        } else {
          _isAdmin = false;
          setState(() {});
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }
}
