import 'package:flutter/foundation.dart';
import '../data/app_database.dart';
import '../data/models/person.dart';

class PersonViewModel extends ChangeNotifier {
  final AppDatabase database;

  PersonViewModel(this.database);

  Stream<List<Person>> get personStream => database.personDao.findAllPersonsAsStream();

  Future<void> addPerson(String name, int age) async {
    final person = Person(name: name, age: age);
    await database.personDao.insertPerson(person);
  }
}