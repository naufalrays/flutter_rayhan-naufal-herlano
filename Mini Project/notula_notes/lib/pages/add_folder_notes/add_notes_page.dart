// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:notula_notes/models/notes_view_model.dart';
import 'package:notula_notes/models/notes_model.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddNotesPage extends StatelessWidget {
  const AddNotesPage({
    Key? key,
    required this.notesModel,
  }) : super(key: key);
  final NotesModel notesModel;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController titleController = TextEditingController();
    TextEditingController noteController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check_rounded),
            onPressed: () {
              print('ini folder model id :${notesModel.id}');

              final isValidForm = formKey.currentState!.validate();
              if (isValidForm) {
                Provider.of<NotesViewModel>(context, listen: false).addNotes(
                  NotesModel(
                    id: const Uuid().v1(),
                    fileName: titleController.text,
                    rootId: notesModel.id,
                    notes: noteController.text,
                    type: 2,
                    createdTime: DateTime.now(),
                    isFavorite: false,
                  ),

                  // NoteModel(
                  //     noteHeader: titleController.text,
                  //     note: noteController.text,
                  //     noteCreatedTime: DateTime.now(),
                  //     noteIsFavorite: false,
                  //     folderId: notesModel.id)
                );
                Navigator.pop(context);
              }

              // notesModel(
              //     title: titleController.text,
              //     createdTime: DateTime.now()));
              // Provider.of<FolderViewModel>(context, listen: false).addNotes({
              //   "header": headerController,
              //   "note": noteController,
              //   "time": DateTime.now().toString(),
              //   "isFavorite": false
              // });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Ketik Judul Di sini..',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Judul tidak boleh kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: noteController,
                maxLines: 9,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Ketik Catatan Di sini..',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Catatan tidak boleh kosong";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
