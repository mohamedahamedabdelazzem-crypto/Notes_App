import 'package:hive_flutter/hive_flutter.dart';
part 'notes_model.g.dart';
@HiveType(typeId: 0)
class NotesModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subTitle;
  @HiveField(2)
  final String date;

  NotesModel({ required this.title, required this.subTitle, required this.date});

}
