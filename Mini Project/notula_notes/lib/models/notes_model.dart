// ignore_for_file: public_member_api_docs, sort_constructors_first
class NotesModel {
  final String id;
  String? fileName;
  String? notes;
  String? rootId;
  int? type; //Type 1 = folder, Type 2 = Notes
  DateTime? createdTime;
  int? colorValue;
  bool? isFavorite;

  NotesModel({
    required this.id,
    required this.fileName,
    this.notes,
    required this.rootId,
    required this.type,
    required this.createdTime,
    this.colorValue,
    required this.isFavorite,
  });

  NotesModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fileName = json['file_name'],
        notes = json['notes'],
        rootId = json['root_id'],
        type = json['type'],
        createdTime = DateTime.parse(json['time']),
        colorValue = json['color'],
        isFavorite = json['isFavorite'] == 0;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'file_name': fileName,
      'notes': notes,
      'root_id': rootId,
      'type': type,
      'time': createdTime!.toIso8601String(),
      'color': colorValue,
      'isFavorite': isFavorite! ? 1 : 0,
    };
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['file_name'] = fileName;
  //   data['notes'] = notes;
  //   data['root_id'] = rootId;
  //   data['type'] = type;
  //   data['time'] = createdTime!.toIso8601String();
  //   data['color'] = colorValue;
  //   data['isFavorite'] = isFavorite! ? 1 : 0;
  //   return data;
  // }
}
