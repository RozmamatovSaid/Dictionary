import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_homework/mini%20project/data/models/dictionary_model.dart';

class DictionaryViewModel extends ChangeNotifier {
  final TextEditingController controllerEng = TextEditingController();
  final TextEditingController controllerUz = TextEditingController();

  late Box<DictionaryModel> _dictionaryBox;

  DictionaryViewModel() {
    _openBox();
  }

  Future<void> _openBox() async {
    _dictionaryBox = await Hive.openBox<DictionaryModel>('dictionaryBox');
  }

  void addWord(BuildContext context) {
    if (controllerEng.text.isEmpty || controllerUz.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Maydon bo'sh bolishi mumkun emas!")));
    } else {
      final newWord = DictionaryModel(
        uzbek: controllerUz.text,
        english: controllerEng.text,
      );
      _dictionaryBox.add(newWord);

      controllerEng.clear();
      controllerUz.clear();
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("successfully sent\nMuvofaqiyatli jo'natildi")));
    }
  }
}
