import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:list_view/user_data.dart';
import 'package:flutter/services.dart' as rootBundle;

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  Future<List<UserData>> readJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('json/users.json');
    final list = json.decode(jsondata) as List<dynamic>;

    // return list.map((e) => UserData.fromJson(e)).toList();
    return list.map<UserData>(UserData.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('JSON ListView in Flutter'),
        ),
        body: FutureBuilder(
            future: readJsonData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              } else if (snapshot.hasData) {
                var user = snapshot.data as List<UserData>;
                return buildUsers(user);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }

  Widget buildUsers(List<UserData> user) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: List.generate(
              user.length,
              (index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                              child: Text(
                            user[index].name.toString()[0],
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          )),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(user[index].name.toString()),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              user[index].phone.toString(),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.3)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
