import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class Person {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String country;

  var fakultas;

  var jurusan;

  Person(
      {required this.name,
      required this.country,
      required this.fakultas,
      required this.jurusan});
}
