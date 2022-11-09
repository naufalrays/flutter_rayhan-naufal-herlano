// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NotesCard extends StatelessWidget {
  NotesCard({
    Key? key,
    required this.name,
    this.icon,
    required this.color,
  }) : super(key: key);
  final String name;
  IconData? icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            color: color,
            width: 70,
            height: 70,
            child: Icon(
              icon ?? Icons.folder_outlined,
              size: 35,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(name),
          ),
          Visibility(
            visible: icon != null,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.info),
            ),
          )
        ],
      ),
    );
  }
}
