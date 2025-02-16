import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_homework/mini%20project/data/models/dictionary_model.dart';
import 'package:hive_homework/mini%20project/presentation/manager/dictionary_%20viewmodel.dart';
import 'package:hive_homework/mini%20project/presentation/pages/output_page.dart';
import 'package:provider/provider.dart';

import 'mini project/presentation/pages/input_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DictionaryModelAdapter());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DictionaryViewModel(),
        ),
      ],
      child: MainApp(),
    ),
  );
}

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => InputDictionary()),
    GoRoute(path: '/output', builder: (context, state) => OutputDictionaries()),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
