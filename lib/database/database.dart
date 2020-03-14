import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class Reminders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get company => text().withLength(min: 1, max: 90)();
  TextColumn get item => text().withLength(min: 1, max: 90)();
  TextColumn get exp_date => text().withLength(min: 1, max: 15)();
  TextColumn get qty => text().withLength(min: 1, max: 5)();
}

@UseMoor(tables: [Reminders],
// Todo : Custom Query
    queries: {'distinctCompany': 'SELECT DISTINCT company FROM reminders;'})
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          logStatements: true,
        ));
  @override
  int get schemaVersion => 1;
  Stream<List<Reminder>> getAllData(String company) =>
      (select(reminders)..where((u) => u.company.like(company))).watch();
  Future<List<Reminder>> watchAllData() => select(reminders).get();

  Future<int> insertTask(Reminder data) => into(reminders).insert(data);
  Future updateTask(Reminder data) => update(reminders).replace(data);
  Future deleteTask(Reminder data) => delete(reminders).delete(data);
  Stream<List<String>> watchDistinctCompany() {
    return distinctCompanyQuery().watch();
  }
}
