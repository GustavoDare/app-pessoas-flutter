import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/app_database.dart';
import 'viewmodels/person_viewmodel.dart';
import 'views/person_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  runApp(
    ChangeNotifierProvider(
      create: (_) => PersonViewModel(database),
      child: const MaterialApp(
        home: PersonScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}