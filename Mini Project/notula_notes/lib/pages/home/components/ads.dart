// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/ads_model.dart';

class Ads extends StatelessWidget {
  const Ads({
    Key? key,
    required this.adsModel,
  }) : super(key: key);
  final AdsModel adsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(height: 50, child: Image.network(adsModel.images!)),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(adsModel.adsName!),
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                        ),
                        child: const Text('Ad'),
                      ),
                      RatingBar.builder(
                        ignoreGestures: true,
                        initialRating: adsModel.rating!.toDouble(),
                        itemSize: 16,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const Icon(Icons.star);
                        },
                        onRatingUpdate: (value) {},
                      )
                    ],
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _launchUrl();
              },
              child: const Text('UNDUH SEKARANG'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    Uri ioS = Uri.parse(adsModel.linkAppStore!);
    Uri android = Uri.parse(adsModel.linkPlayStore!);

    if (Platform.isIOS) {
      if (!await launchUrl(ioS)) {
        throw 'Could not launch $ioS';
      }
    } else {
      if (!await launchUrl(android)) {
        throw 'Could not launch $android';
      }
    }
  }
}
