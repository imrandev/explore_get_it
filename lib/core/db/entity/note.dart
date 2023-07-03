import 'package:floor/floor.dart';

@entity
class Note {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String? title;

  final String? description;

  final String? createdDate;

  Note(this.id, this.title, this.description, this.createdDate);

  Note.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        createdDate = json['description'];

  Map<String, Object?> toJson() {
    return {
      "id": id,
      "title": title,
      'description': description,
      'createdDate': createdDate
    };
  }
}