import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notula_notes/models/ads_model.dart';

import '../home/components/ads.dart';

class AdminPage extends StatelessWidget {
  AdminPage({super.key});

  final ref = FirebaseDatabase.instance.ref('ads');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.onValue,
        builder: (context, snapshot) {
          // print('data nya ada${snapshot.data!.snapshot.value}');

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            print('Error');
          } else {
            List list = snapshot.data!.snapshot.value as List;
            print(snapshot.data!.snapshot.value);
            List<AdsModel> adsData = list
                .map(
                  (e) => AdsModel.fromJson(e),
                )
                .toList();
            return Scaffold(
                appBar: AppBar(
                  centerTitle: false,
                  title: Image.asset(
                    'assets/images/Notula_Logo.png',
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Ads Name'),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Rating'),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          // ThousandsSeparator(),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Link'),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Column(
                        children: List.generate(
                            snapshot.data!.snapshot.children.length, (index) {
                          return Ads(adsModel: adsData[index]);
                        }),
                      ),
                    ],
                  ),
                ));
          }
          return const Text('data');
        });
  }
}
