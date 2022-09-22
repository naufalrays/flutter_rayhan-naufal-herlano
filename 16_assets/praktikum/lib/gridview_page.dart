import 'package:flutter/material.dart';
import 'package:practice_assets/pages/beach.dart';
import 'package:practice_assets/pages/chill.dart';
import 'package:practice_assets/pages/mount_view.dart';
import 'package:practice_assets/pages/venice_beach.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          InkWell(
              child: const Image(image: AssetImage('assets/beach.jpg')),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ChillPage()));
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const BeachPage()));
              }),
          InkWell(
            child: const Image(image: AssetImage('assets/chill.jpg')),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const ChillPage())));
            },
          ),
          InkWell(
            child: const Image(image: AssetImage('assets/mount_view.jpg')),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const MountViewPage())));
            },
          ),
          InkWell(
            child: const Image(image: AssetImage('assets/venice_beach.jpg')),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const VeniceBeachPage())));
            },
          )
        ],
      ),
    );
  }
}
