import 'package:floor/floor.dart';
import '../models/person.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM Person')
  Stream<List<Person>> findAllPersonsAsStream();

  @insert
  Future<void> insertPerson(Person person);
}