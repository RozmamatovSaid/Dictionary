import 'package:hive/hive.dart';

part 'dictionary_model.g.dart';
@HiveType(typeId: 0)
class DictionaryModel extends HiveObject {
  @HiveField(0)
  final String uzbek;
  @HiveField(1)
  final String english;

  DictionaryModel({required this.uzbek, required this.english});
}
