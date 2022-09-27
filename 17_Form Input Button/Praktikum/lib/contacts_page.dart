import 'package:contact/add_user.dart';
import 'package:flutter/material.dart';
import 'models/user.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<User> userList = [
    User('Rayhan', '08232312312'),
    User('Naufal', '08231231312'),
    User('Herlano', '0892323233'),
    User('Asep', '08123123123'),
    User('Udin', '08123123123'),
  ];

  // void showUserDialog() {
  //   showDialog(
  //       context: context,
  //       builder: (_) {
  //         return AlertDialog(
  //           content: AddContact(addContact),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //         );
  //       });
  // }

  // void showUsers() {
  //   showDialog(
  //       context: context,
  //       builder: (_) {
  //         return AddUser(addContact);
  //       });
  // }

  void addContact(User user) {
    setState(() {
      userList.add(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: userList.length,
        itemBuilder: ((context, index) {
          return Container(
            margin: const EdgeInsets.all(6),
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                  child: Center(
                    child: Text(
                      userList[index].name[0].toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(userList[index].name),
                      const SizedBox(height: 3),
                      Text(
                        userList[index].phone,
                        style: TextStyle(color: Colors.black.withOpacity(0.4)),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: showUserDialog,
      //   child: const Icon(Icons.add),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddUser(addContact)));
          // AddUser(addContact);
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
