import 'package:flutter/material.dart';

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
        children: List.generate(
          icon.length,
          (index) {
            return Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue[400]),
                child: icon[index]);
          },
        ),
      ),
    );
  }
}

List icon = [
  const Icon(Icons.pets, color: Colors.white),
  const Icon(Icons.pregnant_woman, color: Colors.white),
  const Icon(Icons.record_voice_over, color: Colors.white),
  const Icon(Icons.rounded_corner, color: Colors.white),
  const Icon(Icons.rowing, color: Colors.white),
  const Icon(Icons.timeline, color: Colors.white),
  const Icon(Icons.update, color: Colors.white),
  const Icon(Icons.access_time_filled, color: Colors.white),
  const Icon(Icons.back_hand, color: Colors.white),
  const Icon(Icons.euro, color: Colors.white),
  const Icon(Icons.g_translate, color: Colors.white),
  const Icon(Icons.remove_shopping_cart, color: Colors.white),
  const Icon(Icons.restore_page, color: Colors.white),
  const Icon(Icons.comments_disabled, color: Colors.white),
  const Icon(Icons.delete_forever, color: Colors.white),
  const Icon(Icons.accessibility, color: Colors.white),
  const Icon(Icons.check_circle_outline, color: Colors.white),
  const Icon(Icons.delete_outline, color: Colors.white),
  const Icon(Icons.done_outline, color: Colors.white),
  const Icon(Icons.maximize, color: Colors.white),
  const Icon(Icons.minimize, color: Colors.white),
  const Icon(Icons.offline_bolt, color: Colors.white),
  const Icon(Icons.swap_horizontal_circle, color: Colors.white),
  const Icon(Icons.accessible_forward, color: Colors.white),
];
