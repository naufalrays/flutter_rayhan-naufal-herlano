// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:notula_notes/models/notes_view_model.dart';

import '../test_notes_page.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    Key? key,
    // required this.notesModel,
    required this.folderViewModel,
  }) : super(key: key);
  // final NotesModel notesModel;
  final NotesViewModel folderViewModel;
  // final List<NotesModel> notesModels;
  // final DateTime time;
  // bool? isFavorite;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // final data = Provider.of<FolderViewModel>(context);
    return Column(
      children: List.generate(folderViewModel.notesModelsById.length, (index) {
        return CupertinoContextMenu(
          previewBuilder: (context, animation, child) {
            // return Container(
            //   color: Colors.red,
            // );
            print('index sekarang : $index');
            // print(folderViewModel.notesModelsById.length);
            // print(folderViewModel.notesModelsById[index].id);
            return SingleChildScrollView(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  // side: const BorderSide(color: Colors.purple, width: 1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // width: double.infinity,
                      // decoration: BoxDecoration(border: Border.all()),
                      child: Text(
                        index >= folderViewModel.notesModelsById.length
                            ? ''
                            : folderViewModel.notesModelsById[index].fileName!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.black.withOpacity(0.2),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OpenContainer(
                          transitionDuration: const Duration(milliseconds: 700),
                          closedBuilder: (context, action) => Container(
                                child: Text(
                                  index >=
                                          folderViewModel.notesModelsById.length
                                      ? ''
                                      : folderViewModel
                                          .notesModelsById[index].notes!,
                                  maxLines: 12,
                                  // style: const TextStyle(
                                  //     overflow: TextOverflow.ellipsis),
                                ),
                              ),
                          openBuilder: (context, action) => TestPage(
                              notesModel:
                                  folderViewModel.notesModelsById[index])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(index >= folderViewModel.notesModelsById.length
                              ? ''
                              : '${DateFormat.E().format(folderViewModel.notesModelsById[index].createdTime!)} - ${DateFormat.Hm().format(folderViewModel.notesModelsById[index].createdTime!)}'),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              // print(widget.notesModel.id);
                              // if (notes[index]["isFavorite"] == true) {
                              //   setState(() {
                              //     notes[index]["isFavorite"] = false;
                              //   });
                              // } else if (notes[index]["isFavorite"] == false) {
                              //   setState(() {
                              //     notes[index]["isFavorite"] = true;
                              //     print(false);
                              //   });
                              // }
                            },
                            icon: const Icon(Icons.star_outline),
                            constraints: const BoxConstraints(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          actions: [
            const CupertinoContextMenuAction(
              trailingIcon: CupertinoIcons.cloud_upload,
              child: Text('Update'),
            ),
            CupertinoContextMenuAction(
              isDestructiveAction: true,
              trailingIcon: CupertinoIcons.delete,
              child: const Text('Delete'),
              onPressed: () {
                folderViewModel.deleteFolderNotes(
                  folderViewModel.notesModelsById[index].id,
                );
                print('indexnya $index');
                folderViewModel.notesModelsById.removeAt(index);
                Navigator.pop(context);
              },
            ),
          ],
          child: SingleChildScrollView(
            child: Card(
              margin: EdgeInsets.symmetric(
                  horizontal: width * 0.02, vertical: height * 0.01),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      folderViewModel.notesModelsById[index].fileName!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      folderViewModel.notesModelsById[index].notes ?? '',
                      maxLines: 3,
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            '${DateFormat.E().format(folderViewModel.notesModelsById[index].createdTime!)} - ${DateFormat.Hm().format(folderViewModel.notesModelsById[index].createdTime!)}'),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            // print(widget.notesModel.id);
                            // if (notes[index]["isFavorite"] == true) {
                            //   setState(() {
                            //     notes[index]["isFavorite"] = false;
                            //   });
                            // } else if (notes[index]["isFavorite"] == false) {
                            //   setState(() {
                            //     notes[index]["isFavorite"] = true;
                            //     print(false);
                            //   });
                            // }
                          },
                          icon: const Icon(Icons.star_outline),
                          constraints: const BoxConstraints(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  // void showAlertDialog(int id) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text('Delete'),
  //         content: const Text('Are you sure you want to delete Folder?'),
  //         actions: [
  //           ElevatedButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: const Text('No'),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               Provider.of<FolderViewModel>(context, listen: false)
  //                   .deleteFolderNotes(id);
  //               Navigator.pop(context);
  //             },
  //             child: const Text('Yes'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
