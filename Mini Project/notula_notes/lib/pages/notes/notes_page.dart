// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:notula_notes/models/notes_view_model.dart';
import 'package:notula_notes/models/notes_model.dart';
import 'package:notula_notes/pages/add_folder_notes/add_sub_folder.dart';
import 'package:notula_notes/pages/notes/components/notes_grid.dart';
import 'package:notula_notes/pages/notes/sub_folder_page.dart';
import 'package:provider/provider.dart';

import '../add_folder_notes/add_notes_page.dart';
import 'components/notes_list.dart';

// import 'components/ads.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({
    Key? key,
    required this.notesModel,
  }) : super(key: key);
  final NotesModel notesModel;

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  bool isGrid = false;

  // DatabaseHelper? _dbHelper;

  // Future initDatabase() async {
  //   await _dbHelper!.getNotesByFolderId(widget.notesModel);
  //   setState(() {});
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<FolderViewModel>(context, listen: false)
  //       .getNotes(widget.notesModel);
  // }

  // @override
  // void initState() {
  //   if (!mounted) return;
  //   super.initState();
  //   // late DatabaseHelper dbHelper;
  //   // _dbHelper = DatabaseHelper();
  //   // initDatabase();
  //   Provider.of<FolderViewModel>(context, listen: false)
  //       .getNotesByFolderId(widget.notesModel);
  //   // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {

  //   //   // Provider.of<FolderViewModel>(context, listen: false)
  //   //   //     .getSubFolderByFolderId(widget.notesModel);
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        children: [
          SpeedDialChild(
            child: const Icon(Icons.add),
            label: 'Add Notes',
            onTap: () {
              print(widget.notesModel.id);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNotesPage(
                    notesModel: widget.notesModel,
                  ),
                ),
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.add),
            label: 'Add SubFolder',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AddSubFolderPage(id: widget.notesModel.id),
                ),
              );
            },
          ),
        ],
        // child: Icon(Icons.add),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color(widget.notesModel.colorValue!),
        centerTitle: false,
        title: Text(
          widget.notesModel.fileName!,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text('Beranda'),
                    const Text(' > '),
                    Text(widget.notesModel.fileName!),
                  ],
                ),
                Row(
                  children: [
                    Consumer<NotesViewModel>(
                      builder: (context, value, child) {
                        return IconButton(
                            onPressed: () {
                              Provider.of<NotesViewModel>(context,
                                      listen: false)
                                  .changeView();
                            },
                            icon: value.isGrid
                                ? const Icon(
                                    Icons.format_list_bulleted_outlined)
                                : const Icon(Icons.grid_view_outlined));
                      },
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.sort))
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Folder'),
          ),
          const SizedBox(
            height: 4,
          ),
          FutureBuilder(
              future: Provider.of<NotesViewModel>(context, listen: false)
                  .getSubFolder(widget.notesModel),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  const CircularProgressIndicator();
                }
                return Consumer<NotesViewModel>(
                    builder: (context, folder, child) {
                  if (folder.subFolderModel.isNotEmpty) {
                    return SubFolderPage(
                      folderViewModel: folder,
                    );
                  }
                  return const Padding(
                    padding: EdgeInsets.only(left: 16, bottom: 16, top: 8),
                    child: Text(
                      'Belum ada Folder',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  );
                });
              }),
          // const Ads(),
          // TODO Ads
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Minggu ini'),
                const SizedBox(
                  height: 12,
                ),
                FutureBuilder(
                    future: Provider.of<NotesViewModel>(context, listen: false)
                        .getNotes(widget.notesModel),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        const CircularProgressIndicator();
                      }
                      return Consumer<NotesViewModel>(
                          builder: (context, notes, child) {
                        if (notes.notesModelsById.isNotEmpty) {
                          return notes.isGrid
                              ? NotesGrid(folderViewModel: notes)
                              : NotesList(
                                  folderViewModel: notes,
                                );
                        }
                        return const Text(
                          'Belum ada Catatan',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        );
                      });
                    })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Folder Lainnya'),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showAlertDialog(
    String id,
  ) {
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
                Provider.of<NotesViewModel>(context, listen: false)
                    .deleteFolderNotes(id);
                // Provider.of<FolderViewModel>(context, listen: false)
                //     .deleteFolder(id);
                // Provider.of<NoteViewModel>(context, listen: false)
                //     .deleteAllNotes(id);

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
