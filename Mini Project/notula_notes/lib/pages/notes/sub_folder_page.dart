// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notula_notes/components/priority_card.dart';

import 'package:notula_notes/models/notes_view_model.dart';

import '../add_folder_notes/add_sub_folder.dart';

class SubFolderPage extends StatelessWidget {
  const SubFolderPage({
    Key? key,
    required this.folderViewModel,
  }) : super(key: key);
  final NotesViewModel folderViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: List.generate(
          folderViewModel.subFolderModel.length,
          (index) {
            final subFolder = folderViewModel.subFolderModel[index];
            return Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddSubFolderPage(
                              notesModel: folderViewModel.subFolderModel[index],
                              id: folderViewModel.folderModels[index].id,
                            ),
                          ));
                    },
                    borderRadius: BorderRadius.circular(12),
                    label: 'Edit',
                    backgroundColor: Colors.teal,
                    icon: Icons.edit,
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      showAlertDialog(
                          context, subFolder.id, folderViewModel, index);
                    },
                    borderRadius: BorderRadius.circular(12),
                    label: 'Delete',
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                  ),
                ],
              ),
              child: Column(
                children: [
                  PriorityCard(
                    priorityFolder: subFolder.fileName!,
                    time: subFolder.createdTime!,
                    color: Color(subFolder.colorValue!),
                  ),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context, String id,
      NotesViewModel folderViewModel, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: const Text('Are you sure you want to delete Folder?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                folderViewModel.deleteFolderNotes(id);
                folderViewModel.subFolderModel.removeAt(index);
                Navigator.pop(context);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
