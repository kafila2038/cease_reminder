// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Reminder extends DataClass implements Insertable<Reminder> {
  final int id;
  final String company;
  final String item;
  final String exp_date;
  final String qty;
  Reminder(
      {@required this.id,
      @required this.company,
      @required this.item,
      @required this.exp_date,
      @required this.qty});
  factory Reminder.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Reminder(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      company:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}company']),
      item: stringType.mapFromDatabaseResponse(data['${effectivePrefix}item']),
      exp_date: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}exp_date']),
      qty: stringType.mapFromDatabaseResponse(data['${effectivePrefix}qty']),
    );
  }
  factory Reminder.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Reminder(
      id: serializer.fromJson<int>(json['id']),
      company: serializer.fromJson<String>(json['company']),
      item: serializer.fromJson<String>(json['item']),
      exp_date: serializer.fromJson<String>(json['exp_date']),
      qty: serializer.fromJson<String>(json['qty']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'company': serializer.toJson<String>(company),
      'item': serializer.toJson<String>(item),
      'exp_date': serializer.toJson<String>(exp_date),
      'qty': serializer.toJson<String>(qty),
    };
  }

  @override
  RemindersCompanion createCompanion(bool nullToAbsent) {
    return RemindersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      company: company == null && nullToAbsent
          ? const Value.absent()
          : Value(company),
      item: item == null && nullToAbsent ? const Value.absent() : Value(item),
      exp_date: exp_date == null && nullToAbsent
          ? const Value.absent()
          : Value(exp_date),
      qty: qty == null && nullToAbsent ? const Value.absent() : Value(qty),
    );
  }

  Reminder copyWith(
          {int id, String company, String item, String exp_date, String qty}) =>
      Reminder(
        id: id ?? this.id,
        company: company ?? this.company,
        item: item ?? this.item,
        exp_date: exp_date ?? this.exp_date,
        qty: qty ?? this.qty,
      );
  @override
  String toString() {
    return (StringBuffer('Reminder(')
          ..write('id: $id, ')
          ..write('company: $company, ')
          ..write('item: $item, ')
          ..write('exp_date: $exp_date, ')
          ..write('qty: $qty')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(company.hashCode,
          $mrjc(item.hashCode, $mrjc(exp_date.hashCode, qty.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Reminder &&
          other.id == this.id &&
          other.company == this.company &&
          other.item == this.item &&
          other.exp_date == this.exp_date &&
          other.qty == this.qty);
}

class RemindersCompanion extends UpdateCompanion<Reminder> {
  final Value<int> id;
  final Value<String> company;
  final Value<String> item;
  final Value<String> exp_date;
  final Value<String> qty;
  const RemindersCompanion({
    this.id = const Value.absent(),
    this.company = const Value.absent(),
    this.item = const Value.absent(),
    this.exp_date = const Value.absent(),
    this.qty = const Value.absent(),
  });
  RemindersCompanion.insert({
    this.id = const Value.absent(),
    @required String company,
    @required String item,
    @required String exp_date,
    @required String qty,
  })  : company = Value(company),
        item = Value(item),
        exp_date = Value(exp_date),
        qty = Value(qty);
  RemindersCompanion copyWith(
      {Value<int> id,
      Value<String> company,
      Value<String> item,
      Value<String> exp_date,
      Value<String> qty}) {
    return RemindersCompanion(
      id: id ?? this.id,
      company: company ?? this.company,
      item: item ?? this.item,
      exp_date: exp_date ?? this.exp_date,
      qty: qty ?? this.qty,
    );
  }
}

class $RemindersTable extends Reminders
    with TableInfo<$RemindersTable, Reminder> {
  final GeneratedDatabase _db;
  final String _alias;
  $RemindersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _companyMeta = const VerificationMeta('company');
  GeneratedTextColumn _company;
  @override
  GeneratedTextColumn get company => _company ??= _constructCompany();
  GeneratedTextColumn _constructCompany() {
    return GeneratedTextColumn('company', $tableName, false,
        minTextLength: 1, maxTextLength: 90);
  }

  final VerificationMeta _itemMeta = const VerificationMeta('item');
  GeneratedTextColumn _item;
  @override
  GeneratedTextColumn get item => _item ??= _constructItem();
  GeneratedTextColumn _constructItem() {
    return GeneratedTextColumn('item', $tableName, false,
        minTextLength: 1, maxTextLength: 90);
  }

  final VerificationMeta _exp_dateMeta = const VerificationMeta('exp_date');
  GeneratedTextColumn _exp_date;
  @override
  GeneratedTextColumn get exp_date => _exp_date ??= _constructExpDate();
  GeneratedTextColumn _constructExpDate() {
    return GeneratedTextColumn('exp_date', $tableName, false,
        minTextLength: 1, maxTextLength: 15);
  }

  final VerificationMeta _qtyMeta = const VerificationMeta('qty');
  GeneratedTextColumn _qty;
  @override
  GeneratedTextColumn get qty => _qty ??= _constructQty();
  GeneratedTextColumn _constructQty() {
    return GeneratedTextColumn('qty', $tableName, false,
        minTextLength: 1, maxTextLength: 10);
  }

  @override
  List<GeneratedColumn> get $columns => [id, company, item, exp_date, qty];
  @override
  $RemindersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'reminders';
  @override
  final String actualTableName = 'reminders';
  @override
  VerificationContext validateIntegrity(RemindersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.company.present) {
      context.handle(_companyMeta,
          company.isAcceptableValue(d.company.value, _companyMeta));
    } else if (company.isRequired && isInserting) {
      context.missing(_companyMeta);
    }
    if (d.item.present) {
      context.handle(
          _itemMeta, item.isAcceptableValue(d.item.value, _itemMeta));
    } else if (item.isRequired && isInserting) {
      context.missing(_itemMeta);
    }
    if (d.exp_date.present) {
      context.handle(_exp_dateMeta,
          exp_date.isAcceptableValue(d.exp_date.value, _exp_dateMeta));
    } else if (exp_date.isRequired && isInserting) {
      context.missing(_exp_dateMeta);
    }
    if (d.qty.present) {
      context.handle(_qtyMeta, qty.isAcceptableValue(d.qty.value, _qtyMeta));
    } else if (qty.isRequired && isInserting) {
      context.missing(_qtyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Reminder map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Reminder.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(RemindersCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.company.present) {
      map['company'] = Variable<String, StringType>(d.company.value);
    }
    if (d.item.present) {
      map['item'] = Variable<String, StringType>(d.item.value);
    }
    if (d.exp_date.present) {
      map['exp_date'] = Variable<String, StringType>(d.exp_date.value);
    }
    if (d.qty.present) {
      map['qty'] = Variable<String, StringType>(d.qty.value);
    }
    return map;
  }

  @override
  $RemindersTable createAlias(String alias) {
    return $RemindersTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $RemindersTable _reminders;
  $RemindersTable get reminders => _reminders ??= $RemindersTable(this);
  Selectable<String> distinctCompanyQuery() {
    return customSelectQuery('SELECT DISTINCT company FROM reminders;',
            variables: [], readsFrom: {reminders})
        .map((QueryRow row) => row.readString('company'));
  }

  Future<List<String>> distinctCompany() {
    return distinctCompanyQuery().get();
  }

  Stream<List<String>> watchDistinctCompany() {
    return distinctCompanyQuery().watch();
  }

  @override
  List<TableInfo> get allTables => [reminders];
}
