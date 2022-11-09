// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PriorityCard extends StatelessWidget {
  const PriorityCard({
    Key? key,
    required this.priorityFolder,
    required this.time,
    required this.color,
  }) : super(key: key);
  final String priorityFolder;
  final DateTime time;
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
        children: [
          Container(
            color: color,
            width: 70,
            height: 70,
            child: const Icon(
              Icons.folder_outlined,
              size: 35,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  priorityFolder,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${DateFormat('yMd').format(time)} - ${DateFormat.Hms().format(time)}',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
