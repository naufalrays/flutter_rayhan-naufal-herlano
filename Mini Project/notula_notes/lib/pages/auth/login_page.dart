import 'package:flutter/material.dart';
import 'package:notula_notes/pages/auth/auth_view_model.dart';
import 'package:notula_notes/pages/auth/components/custom_login_button.dart';
import 'package:notula_notes/pages/auth/components/google_button.dart';
import 'package:notula_notes/pages/auth/components/text_field.dart';
import 'package:notula_notes/pages/auth/reset_password_page.dart';
import 'package:notula_notes/pages/auth/sign_up_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final prof = Provider.of<AuthViewModel>(context);
    // String message = '';
    bool buttonClicked = true;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: SafeArea(
            child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 2,
                ),
                Text(
                  "Notula Notes",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Notula made easy",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                TextFieldLogin(
                  controller: emailController,
                  hintText: "Enter Email",
                  isPassword: false,
                  message: "Please enter a valid email",
                  isEmail: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFieldLogin(
                  controller: passwordController,
                  hintText: "Enter Password",
                  isPassword: true,
                  message: "Add password properly",
                  isEmail: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ResetPasswordPage(),
                            ));
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: const Text(
                          'Forgot Password ?',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CustomLoginButton(
                  buttonName: "Login",
                  onTap: () async {
                    if (buttonClicked) {
                      final isValidForm = formKey.currentState!.validate();

                      if (isValidForm) {
                        Provider.of<AuthViewModel>(context, listen: false)
                            .login(emailController.text,
                                passwordController.text, context);
                        buttonClicked = false;
                        await Future.delayed(const Duration(seconds: 1));
                        if (prof.message != null) {
                          showAlertDialog(prof.message ?? '');
                        }
                        buttonClicked = true;
                      }
                    }
                  },
                ),
                // Visibility(
                //     visible: prof.message != null,
                //     child: Text(prof.message ?? '')),
                const SizedBox(
                  height: 30,
                ),
                const Text('OR'),
                const SizedBox(
                  height: 30,
                ),
                GoogleButton(
                  buttonName: 'Login',
                  onTap: () {},
                ),
                const Spacer(
                  flex: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Do not have an account?"),
                    TextButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      ),
                      child: Text(
                        "Create One",
                        style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        )),
      ),
    );
  }

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).primaryColor,
        content: Text(
          message.toString(),
        ),
      ),
    );
  }

  void showAlertDialog(String text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: Text(text),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            Consumer<AuthViewModel>(
              builder: (context, value, child) {
                if (value.message == 'You must verify your email first!') {
                  return ElevatedButton(
                    onPressed: () async {
                      await value.userCredential.user!.sendEmailVerification();
                      Navigator.pop(context);
                      print('Send Email');
                    },
                    child: const Text('Send'),
                  );
                } else {
                  return ElevatedButton(
                    onPressed: () async {},
                    child: const Text('Yes'),
                  );
                }
              },
              child: ElevatedButton(
                onPressed: () async {},
                child: const Text('Yes'),
              ),
            ),
          ],
        );
      },
    );
  }
}
