// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:notula_notes/constant.dart';
import 'package:provider/provider.dart';

import 'package:notula_notes/models/notes_view_model.dart';
import 'package:notula_notes/models/notes_model.dart';
import 'package:uuid/uuid.dart';

class AddSubFolderPage extends StatefulWidget {
  AddSubFolderPage({
    Key? key,
    this.id,
    this.notesModel,
  }) : super(key: key);
  NotesModel? notesModel;
  String? id;

  @override
  State<AddSubFolderPage> createState() => _AddSubFolderPageState();
}

class _AddSubFolderPageState extends State<AddSubFolderPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  // TextEditingController noteController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  final bool _validateColor = false;
  Color currentColor = primary;
  int? colorNow;
  bool _isUpdate = false;

  @override
  void initState() {
    if (widget.notesModel != null) {
      titleController.text = widget.notesModel!.fileName!;
      // colorController.text = widget.notesModel!.colorValue;
      currentColor = Color(widget.notesModel!.colorValue!);
      _isUpdate = true;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check_rounded),
            onPressed: () {
              if (_isUpdate) {
                print('diupdate');
                Provider.of<NotesViewModel>(context, listen: false).updateNotes(
                  NotesModel(
                    id: widget.notesModel!.id,
                    fileName: titleController.text,
                    rootId: widget.id,
                    type: 1,
                    createdTime: DateTime.now(),
                    colorValue: currentColor.value,
                    isFavorite: false,
                  ),
                );
              } else {
                Provider.of<NotesViewModel>(context, listen: false).addNotes(
                  NotesModel(
                    id: const Uuid().v1(),
                    fileName: titleController.text,
                    rootId: widget.id!,
                    type: 1,
                    createdTime: DateTime.now(),
                    colorValue: currentColor.value,
                    isFavorite: false,
                  ),
                );
              }

              Navigator.pop(context);
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    buildColorPicker(context),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Ketik Judul Di sini..',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
          width: 20,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Color can\'t be Empty';
              }
              return null;
            },
            showCursor: false,
            controller: colorController,
            decoration: InputDecoration(
                filled: true,
                fillColor: currentColor,
                // hintText: 'Pick a Color',
                contentPadding: const EdgeInsets.only(left: 10),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: currentColor)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: currentColor)),
                errorText: _validateColor ? 'Color Can\'t Be Empty' : null),
            onTap: (() {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Pick a Color'),
                    content: SingleChildScrollView(
                      child: ColorPicker(
                        pickerColor: Colors.red,
                        onColorChanged: (color) {
                          setState(() {
                            colorNow = color.value;
                            currentColor = color;
                          });
                        },
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ),
      ],
    );
  }
}
