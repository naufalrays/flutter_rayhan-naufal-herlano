import 'package:flutter/material.dart';
import 'package:notula_notes/pages/auth/auth_view_model.dart';
import 'package:provider/provider.dart';

import 'components/custom_login_button.dart';
import 'components/google_button.dart';
import 'components/text_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final prof = Provider.of<AuthViewModel>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
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
                  const Spacer(
                    flex: 2,
                  ),
                  TextFieldLogin(
                    controller: _nameController,
                    hintText: "Enter Name",
                    isPassword: false,
                    isEmail: false,
                    message: "Add Name Properly",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldLogin(
                    controller: _emailController,
                    hintText: "Enter Email",
                    isPassword: false,
                    isEmail: true,
                    message: "Add Email Properly",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldLogin(
                    controller: _passwordController,
                    hintText: "Enter Password",
                    isPassword: true,
                    isEmail: false,
                    message: "Add Password Properly",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Spacer(),
                  CustomLoginButton(
                    buttonName: "Sign Up",
                    onTap: () {
                      final isValidForm = _formKey.currentState!.validate();
                      if (isValidForm) {
                        Provider.of<AuthViewModel>(context, listen: false)
                            .signup(
                          context,
                          _nameController.text,
                          _emailController.text,
                          _passwordController.text,
                        );
                        // Future.delayed(const Duration(seconds: 1));
                        // if (prof.message != null) {
                        // Navigator.pop(context);
                        // }
                        // Navigator.pop(context);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('OR'),
                  const SizedBox(
                    height: 30,
                  ),
                  GoogleButton(
                    buttonName: 'Sign Up',
                    onTap: () {},
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: const Text('asdasd'),
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
}
