// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:notula_notes/models/notes_model.dart';

class TestPage extends StatelessWidget {
  const TestPage({
    Key? key,
    required this.notesModel,
  }) : super(key: key);
  final NotesModel notesModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(notesModel.fileName!),
      ),
      body: Center(
        child: Text(notesModel.notes!),
      ),
    );
  }
}
