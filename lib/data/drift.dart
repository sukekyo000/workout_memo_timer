
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'generated/drift.g.dart';

@DriftDatabase(tables: [PredeterminedMenus, WorkoutMenus])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db_2.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DataClassName('PredeterminedMenu')
class PredeterminedMenus extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get dayOfWeek => integer()();
  IntColumn get menuId => integer()();
  IntColumn get set => integer()();
  RealColumn get weight => real()();
  IntColumn get rep => integer()();
  BoolColumn get assistant => boolean()();
}

@DataClassName('WorkoutMenu')
class WorkoutMenus extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  IntColumn get menuId => integer()();
  IntColumn get set => integer()();
  RealColumn get weight => real()();
  IntColumn get rep => integer()();
  BoolColumn get assistant => boolean()();
}