import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_homework/mini%20project/presentation/manager/dictionary_%20viewmodel.dart';
import 'package:provider/provider.dart';

import '../widgets/input_text.dart';

class InputDictionary extends StatefulWidget {
  const InputDictionary({super.key});

  @override
  State<InputDictionary> createState() => _InputDictionaryState();
}

class _InputDictionaryState extends State<InputDictionary> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DictionaryViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.purple.withValues(alpha: 0.3),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          "Add dictionary",
          style: TextStyle(
            color: Colors.black.withValues(alpha: 0.5),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        child: Column(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            input_text(
              hintText: 'English language',
              controller: vm.controllerEng,
            ),
            input_text(
              hintText: "Uzbek tili",
              controller: vm.controllerUz,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                fixedSize: Size(220, 40),
                foregroundColor: Colors.black.withValues(alpha: 0.5),
                overlayColor: Colors.cyanAccent,
                textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
              onPressed: () => vm.addWord(context),
              child: Text("I N P U T"),
            ),
            FloatingActionButton(
              backgroundColor: Colors.black.withValues(alpha: 0.2),
              onPressed: () {
                context.go('/output');
              },
              child: Icon(Icons.navigate_next),
            ),
          ],
        ),
      ),
    );
  }
}