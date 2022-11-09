import 'package:flutter/material.dart';
import 'package:notula_notes/helper/database_instance.dart';
import 'package:notula_notes/models/notes_model.dart';

enum FolderViewState {
  none,
  loading,
  error,
}

class NotesViewModel extends ChangeNotifier {
  // final List<NotesModel> _notesModels = [];
  List<NotesModel> _notesModelsById = [];
  List<NotesModel> _folderModelsById = [];
  List<NotesModel> _subFolderModelById = [];
  // NotesModel? notesModel;
  bool isGrid = false;

  late DatabaseHelper _dbHelper;

  // List<NotesModel> get notesModels => _notesModels;
  List<NotesModel> get notesModelsById => _notesModelsById;
  List<NotesModel> get folderModels => _folderModelsById;
  List<NotesModel> get subFolderModel => _subFolderModelById;

  FolderViewState _folderViewState = FolderViewState.none;
  FolderViewState get folderViewState => _folderViewState;

  changeState(FolderViewState s) {
    _folderViewState = s;
    // notifyListeners();
  }

  NotesViewModel() {
    _dbHelper = DatabaseHelper();
    _getAllFolder();
    // getFolderByRootId(0);
  }

  void _getAllFolder() async {
    _folderModelsById = await _dbHelper.getFolderByRootId(0);
    notifyListeners();
  }

  Future<void> addNotes(NotesModel noteModel) async {
    await _dbHelper.insertNotes(noteModel);
    if (noteModel.type == 2) {
      _notesModelsById.add(noteModel);
    }
    if (noteModel.type == 1 && noteModel.rootId != '0') {
      _subFolderModelById.add(noteModel);
    }
    notifyListeners();
    _getAllFolder();
  }

  // Future<void> addSubFolder(NotesModel noteModel) async {
  //   await _dbHelper.insertNotes(noteModel);
  //   _subFolderModelById.add(noteModel);
  //   notifyListeners();
  //   _getAllFolder();
  // }

  Future<void> updateNotes(NotesModel noteModel) async {
    await _dbHelper.updateNotes(noteModel);
    if (noteModel.type == 2) {
      _notesModelsById[_notesModelsById
          .indexWhere((element) => element.id == noteModel.id)] = noteModel;
    }
    if (noteModel.type == 1 && noteModel.rootId != '0') {
      // print(_subFolderModelById
      //     .indexWhere((element) => element.id == noteModel.id));
      _subFolderModelById[_subFolderModelById
          .indexWhere((element) => element.id == noteModel.id)] = noteModel;
      // _subFolderModelById.add(noteModel);
    }
    notifyListeners();
    _getAllFolder();
  }

  Future<void> deleteFolderNotes(String id) async {
    changeState(FolderViewState.loading);
    await _dbHelper.deleteFolderNotes(id);
    _getAllFolder();
    changeState(FolderViewState.none);
    notifyListeners();
  }

  Future<void> getNotes(NotesModel noteModel) async {
    // _dbHelper = DatabaseHelper();

    _notesModelsById = await _dbHelper.getNotesByFolderId(noteModel);

    // print('dsd');
    // print(_notesModelsById.first.name_of_file);
    notifyListeners();
    // _getAllFolder();
  }

  Future<void> getSubFolder(NotesModel noteModel) async {
    _subFolderModelById = await _dbHelper.getSubFolderByFolderId(noteModel);
    // print(_subFolderModelById.first.name_of_file);
    notifyListeners();

    // _getAllFolder();
  }

  // void getFolderByRootId(int id) async {
  //   _folderModelsById = await _dbHelper.getFolderByRootId(id);
  //   _getAllFolder();
  // }

  // void updateFolder(FolderModel taskModel) async {
  //   await _dbHelper.updateFolder(taskModel);
  //   _getAllFolder();
  // }

  changeView() {
    isGrid ? isGrid = false : isGrid = true;
    notifyListeners();
  }
}
