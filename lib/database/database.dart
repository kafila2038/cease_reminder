import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class Reminders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get company => text().withLength(min: 1, max: 10)();
  TextColumn get item => text().withLength(min: 1, max: 25)();
  TextColumn get exp_date => text().withLength(min: 1, max: 25)();
  TextColumn get qty => text().withLength(min: 1, max: 25)();
}

@UseMoor(tables: [Reminders]
// Todo : Custom Query
)
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          logStatements: true,
        ));
  @override
  int get schemaVersion => 1;

}

@UseDao(tables: [Reminders])
class ReminderDao extends DatabaseAccessor<AppDatabase>
    with _$ReminderDaoMixin {
  final AppDatabase db;
  ReminderDao(this.db) : super(db);

   Stream<List<Reminder>> getAllData(String company) =>
      (select(reminders)..where((u) => u.company.like(company))).watch();
  Stream<List<Reminder>> watchAllData() => select(reminders).watch();

  Future<int> insertTask(Reminder data) => into(reminders).insert(data);
  Future updateTask(Reminder data) => update(reminders).replace(data);
  Future deleteTask(Reminder data) => delete(reminders).delete(data);
// Todo : check the results
  Future<List<Reminder>> getCompany() {
    return customSelectQuery(
      'SELECT DISTINCT company FROM remainders',
      readsFrom: {reminders},
    ).map((rows) {
      // Turning the data of a row into a Task object
      return ( Reminder.fromData(rows.data, db));
    }).get();
  }
}
