import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notula_notes/components/notes_card.dart';
import 'package:notula_notes/components/priority_card.dart';
import 'package:notula_notes/models/notes_view_model.dart';
import 'package:notula_notes/pages/add_folder_notes/add_folder_page.dart';
import 'package:notula_notes/pages/admin/admin_view_model.dart';
import 'package:notula_notes/pages/home/components/ads.dart';
import 'package:provider/provider.dart';

import '../notes/notes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AdminViewModel>(context, listen: false).getAds();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final adminViewModel = Provider.of<AdminViewModel>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddFolderPage(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        // centerTitle: false,
        title: Image.asset(
          'assets/images/Notula_Logo.png',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.star),
          ),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Catatan'),
                NotesCard(
                  icon: Icons.notes,
                  name: 'Semua Catatan',
                  color: Colors.blue,
                ),
                const SizedBox(
                  height: 10,
                ),
                NotesCard(
                  icon: Icons.star,
                  name: 'Catatan Berbintang',
                  color: Colors.orange,
                ),
                const SizedBox(
                  height: 10,
                ),
                NotesCard(
                  icon: Icons.folder_off,
                  name: 'Catatan Tak Berfolder',
                  color: Colors.blue,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          buildAds(adminViewModel),
          // FutureBuilder<dynamic>(
          //     future:
          //         Provider.of<AdminViewModel>(context, listen: false).getAds(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return const Center(child: CircularProgressIndicator());
          //       } else {
          //         if (snapshot.hasData) {
          //           return Ads(adsModel: snapshot.data);
          //         }
          //       }
          //       return Text(snapshot.data.toString());
          //     }),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('Folder Prioritas'),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.info),
                    )
                  ],
                ),
                Consumer<NotesViewModel>(builder: (context, notes, child) {
                  if (notes.folderModels.isNotEmpty) {
                    return Column(
                      children: List.generate(
                        notes.folderModels.length,
                        (index) => Slidable(
                          // key: Key('${notes.folderModelsById.length}'),

                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddFolderPage(
                                          notesModel: notes.folderModels[index],
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
                                  showAlertDialog(notes.folderModels[index].id);
                                },
                                borderRadius: BorderRadius.circular(12),
                                label: 'Delete',
                                backgroundColor: Colors.red,
                                icon: Icons.delete,
                              ),
                            ],
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NotesPage(
                                    notesModel: notes.folderModels[index],
                                  ),
                                ),
                              );
                            },
                            child: PriorityCard(
                              priorityFolder:
                                  notes.folderModels[index].fileName ?? '',
                              time: notes.folderModels[index].createdTime!,
                              color:
                                  Color(notes.folderModels[index].colorValue!),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Text('Tidak ada Data');
                  }
                }),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Folder Lainnya'),
                // PriorityCard(
                //   priorityFolder: 'Kumpulan Puisi',
                //   time: DateTime.now(),
                //   color: Colors.pink,
                // ),
                // const SizedBox(
                //   height: 10,
              ],
            ),
          )
        ],
      ),
    );
  }

  void showAlertDialog(String id) {
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
                Navigator.pop(context);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  Widget buildAds(AdminViewModel adminViewModel) {
    final isLoading = adminViewModel.adminState == AdminViewState.loading;
    final isError = adminViewModel.adminState == AdminViewState.error;
    if (adminViewModel.ads.isNotEmpty) {
      if (isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (isError) {
        return const Text('TIDAK ADA DATA');
      }
      return Ads(adsModel: adminViewModel.ads.first);
    }
    return Center(
      child: Container(),
    );
  }
}
