import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'GridView',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.pets, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.pregnant_woman, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.record_voice_over, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.rounded_corner, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.rowing, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.timeline, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.update, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.access_time_filled, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.back_hand, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.euro, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.g_translate, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.remove_shopping_cart, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.restore_page, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.comments_disabled, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.delete_forever, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.accessibility, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.check_circle_outline, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.delete_outline, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.done_outline, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.maximize, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.minimize, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.offline_bolt, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child:
                const Icon(Icons.swap_horizontal_circle, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 30,
            width: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
            child: const Icon(Icons.accessible_forward, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
