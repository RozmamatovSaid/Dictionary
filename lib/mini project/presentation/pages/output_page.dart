import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_homework/mini%20project/data/models/dictionary_model.dart';

class OutputDictionaries extends StatefulWidget {
  const OutputDictionaries({super.key});

  @override
  State<OutputDictionaries> createState() => _OutputDictionariesState();
}

class _OutputDictionariesState extends State<OutputDictionaries> {
  late Box<DictionaryModel> _dictionaryBox;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    _dictionaryBox = await Hive.openBox<DictionaryModel>("dictionaryBox");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.withValues(alpha: 0.3),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          "Dictionaries",
          style: TextStyle(
            color: Colors.black.withValues(alpha: 0.5),
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: _dictionaryBox.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 50,
                children: [
                  CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  Text(
                    "W A I T . . .",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _dictionaryBox.length,
              itemBuilder: (context, index) {
                final word = _dictionaryBox.getAt(index);
                return ListTile(
                  title: Card(
                    surfaceTintColor: Colors.white,
                    color: Colors.black.withValues(alpha: 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${word?.english} - ${word?.uzbek}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 40),
                        ),
                        IconButton(
                          onPressed: () {
                            _dictionaryBox.deleteAt(index);
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
