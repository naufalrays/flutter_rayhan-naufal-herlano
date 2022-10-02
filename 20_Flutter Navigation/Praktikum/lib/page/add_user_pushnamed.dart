import 'package:contact/models/user.dart';
import 'package:flutter/material.dart';

class AddUserPushnamed extends StatefulWidget {
  const AddUserPushnamed({super.key});

  @override
  State<AddUserPushnamed> createState() => _AddUserPushnamedState();
}

class _AddUserPushnamedState extends State<AddUserPushnamed> {
  final TextEditingController _name = TextEditingController();

  final TextEditingController _phone = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final addContact =
        ModalRoute.of(context)!.settings.arguments as Function(User);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Contact'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Name'),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Phone'),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nomor tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  formKey.currentState!.validate();
                });
                if (_name.text.isNotEmpty && _phone.text.isNotEmpty) {
                  final user = User(_name.text, _phone.text);

                  addContact(user);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
