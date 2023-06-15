// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../drift.dart';

// ignore_for_file: type=lint
class $PredeterminedMenusTable extends PredeterminedMenus
    with TableInfo<$PredeterminedMenusTable, PredeterminedMenu> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PredeterminedMenusTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dayOfWeekMeta =
      const VerificationMeta('dayOfWeek');
  @override
  late final GeneratedColumn<int> dayOfWeek = GeneratedColumn<int>(
      'day_of_week', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _menuIdMeta = const VerificationMeta('menuId');
  @override
  late final GeneratedColumn<int> menuId = GeneratedColumn<int>(
      'menu_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _setMeta = const VerificationMeta('set');
  @override
  late final GeneratedColumn<int> set = GeneratedColumn<int>(
      'set', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _repMeta = const VerificationMeta('rep');
  @override
  late final GeneratedColumn<int> rep = GeneratedColumn<int>(
      'rep', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _assistantMeta =
      const VerificationMeta('assistant');
  @override
  late final GeneratedColumn<bool> assistant =
      GeneratedColumn<bool>('assistant', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("assistant" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns =>
      [id, dayOfWeek, menuId, set, weight, rep, assistant];
  @override
  String get aliasedName => _alias ?? 'predetermined_menus';
  @override
  String get actualTableName => 'predetermined_menus';
  @override
  VerificationContext validateIntegrity(Insertable<PredeterminedMenu> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('day_of_week')) {
      context.handle(
          _dayOfWeekMeta,
          dayOfWeek.isAcceptableOrUnknown(
              data['day_of_week']!, _dayOfWeekMeta));
    } else if (isInserting) {
      context.missing(_dayOfWeekMeta);
    }
    if (data.containsKey('menu_id')) {
      context.handle(_menuIdMeta,
          menuId.isAcceptableOrUnknown(data['menu_id']!, _menuIdMeta));
    } else if (isInserting) {
      context.missing(_menuIdMeta);
    }
    if (data.containsKey('set')) {
      context.handle(
          _setMeta, set.isAcceptableOrUnknown(data['set']!, _setMeta));
    } else if (isInserting) {
      context.missing(_setMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('rep')) {
      context.handle(
          _repMeta, rep.isAcceptableOrUnknown(data['rep']!, _repMeta));
    } else if (isInserting) {
      context.missing(_repMeta);
    }
    if (data.containsKey('assistant')) {
      context.handle(_assistantMeta,
          assistant.isAcceptableOrUnknown(data['assistant']!, _assistantMeta));
    } else if (isInserting) {
      context.missing(_assistantMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PredeterminedMenu map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PredeterminedMenu(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      dayOfWeek: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_of_week'])!,
      menuId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}menu_id'])!,
      set: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}set'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      rep: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rep'])!,
      assistant: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}assistant'])!,
    );
  }

  @override
  $PredeterminedMenusTable createAlias(String alias) {
    return $PredeterminedMenusTable(attachedDatabase, alias);
  }
}

class PredeterminedMenu extends DataClass
    implements Insertable<PredeterminedMenu> {
  final int id;
  final int dayOfWeek;
  final int menuId;
  final int set;
  final double weight;
  final int rep;
  final bool assistant;
  const PredeterminedMenu(
      {required this.id,
      required this.dayOfWeek,
      required this.menuId,
      required this.set,
      required this.weight,
      required this.rep,
      required this.assistant});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['day_of_week'] = Variable<int>(dayOfWeek);
    map['menu_id'] = Variable<int>(menuId);
    map['set'] = Variable<int>(set);
    map['weight'] = Variable<double>(weight);
    map['rep'] = Variable<int>(rep);
    map['assistant'] = Variable<bool>(assistant);
    return map;
  }

  PredeterminedMenusCompanion toCompanion(bool nullToAbsent) {
    return PredeterminedMenusCompanion(
      id: Value(id),
      dayOfWeek: Value(dayOfWeek),
      menuId: Value(menuId),
      set: Value(set),
      weight: Value(weight),
      rep: Value(rep),
      assistant: Value(assistant),
    );
  }

  factory PredeterminedMenu.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PredeterminedMenu(
      id: serializer.fromJson<int>(json['id']),
      dayOfWeek: serializer.fromJson<int>(json['dayOfWeek']),
      menuId: serializer.fromJson<int>(json['menuId']),
      set: serializer.fromJson<int>(json['set']),
      weight: serializer.fromJson<double>(json['weight']),
      rep: serializer.fromJson<int>(json['rep']),
      assistant: serializer.fromJson<bool>(json['assistant']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dayOfWeek': serializer.toJson<int>(dayOfWeek),
      'menuId': serializer.toJson<int>(menuId),
      'set': serializer.toJson<int>(set),
      'weight': serializer.toJson<double>(weight),
      'rep': serializer.toJson<int>(rep),
      'assistant': serializer.toJson<bool>(assistant),
    };
  }

  PredeterminedMenu copyWith(
          {int? id,
          int? dayOfWeek,
          int? menuId,
          int? set,
          double? weight,
          int? rep,
          bool? assistant}) =>
      PredeterminedMenu(
        id: id ?? this.id,
        dayOfWeek: dayOfWeek ?? this.dayOfWeek,
        menuId: menuId ?? this.menuId,
        set: set ?? this.set,
        weight: weight ?? this.weight,
        rep: rep ?? this.rep,
        assistant: assistant ?? this.assistant,
      );
  @override
  String toString() {
    return (StringBuffer('PredeterminedMenu(')
          ..write('id: $id, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('menuId: $menuId, ')
          ..write('set: $set, ')
          ..write('weight: $weight, ')
          ..write('rep: $rep, ')
          ..write('assistant: $assistant')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, dayOfWeek, menuId, set, weight, rep, assistant);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PredeterminedMenu &&
          other.id == this.id &&
          other.dayOfWeek == this.dayOfWeek &&
          other.menuId == this.menuId &&
          other.set == this.set &&
          other.weight == this.weight &&
          other.rep == this.rep &&
          other.assistant == this.assistant);
}

class PredeterminedMenusCompanion extends UpdateCompanion<PredeterminedMenu> {
  final Value<int> id;
  final Value<int> dayOfWeek;
  final Value<int> menuId;
  final Value<int> set;
  final Value<double> weight;
  final Value<int> rep;
  final Value<bool> assistant;
  const PredeterminedMenusCompanion({
    this.id = const Value.absent(),
    this.dayOfWeek = const Value.absent(),
    this.menuId = const Value.absent(),
    this.set = const Value.absent(),
    this.weight = const Value.absent(),
    this.rep = const Value.absent(),
    this.assistant = const Value.absent(),
  });
  PredeterminedMenusCompanion.insert({
    this.id = const Value.absent(),
    required int dayOfWeek,
    required int menuId,
    required int set,
    required double weight,
    required int rep,
    required bool assistant,
  })  : dayOfWeek = Value(dayOfWeek),
        menuId = Value(menuId),
        set = Value(set),
        weight = Value(weight),
        rep = Value(rep),
        assistant = Value(assistant);
  static Insertable<PredeterminedMenu> custom({
    Expression<int>? id,
    Expression<int>? dayOfWeek,
    Expression<int>? menuId,
    Expression<int>? set,
    Expression<double>? weight,
    Expression<int>? rep,
    Expression<bool>? assistant,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dayOfWeek != null) 'day_of_week': dayOfWeek,
      if (menuId != null) 'menu_id': menuId,
      if (set != null) 'set': set,
      if (weight != null) 'weight': weight,
      if (rep != null) 'rep': rep,
      if (assistant != null) 'assistant': assistant,
    });
  }

  PredeterminedMenusCompanion copyWith(
      {Value<int>? id,
      Value<int>? dayOfWeek,
      Value<int>? menuId,
      Value<int>? set,
      Value<double>? weight,
      Value<int>? rep,
      Value<bool>? assistant}) {
    return PredeterminedMenusCompanion(
      id: id ?? this.id,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      menuId: menuId ?? this.menuId,
      set: set ?? this.set,
      weight: weight ?? this.weight,
      rep: rep ?? this.rep,
      assistant: assistant ?? this.assistant,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dayOfWeek.present) {
      map['day_of_week'] = Variable<int>(dayOfWeek.value);
    }
    if (menuId.present) {
      map['menu_id'] = Variable<int>(menuId.value);
    }
    if (set.present) {
      map['set'] = Variable<int>(set.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (rep.present) {
      map['rep'] = Variable<int>(rep.value);
    }
    if (assistant.present) {
      map['assistant'] = Variable<bool>(assistant.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PredeterminedMenusCompanion(')
          ..write('id: $id, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('menuId: $menuId, ')
          ..write('set: $set, ')
          ..write('weight: $weight, ')
          ..write('rep: $rep, ')
          ..write('assistant: $assistant')
          ..write(')'))
        .toString();
  }
}

class $WorkoutMenusTable extends WorkoutMenus
    with TableInfo<$WorkoutMenusTable, WorkoutMenu> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutMenusTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _menuIdMeta = const VerificationMeta('menuId');
  @override
  late final GeneratedColumn<int> menuId = GeneratedColumn<int>(
      'menu_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _setMeta = const VerificationMeta('set');
  @override
  late final GeneratedColumn<int> set = GeneratedColumn<int>(
      'set', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _repMeta = const VerificationMeta('rep');
  @override
  late final GeneratedColumn<int> rep = GeneratedColumn<int>(
      'rep', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _assistantMeta =
      const VerificationMeta('assistant');
  @override
  late final GeneratedColumn<bool> assistant =
      GeneratedColumn<bool>('assistant', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("assistant" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns =>
      [id, date, menuId, set, weight, rep, assistant];
  @override
  String get aliasedName => _alias ?? 'workout_menus';
  @override
  String get actualTableName => 'workout_menus';
  @override
  VerificationContext validateIntegrity(Insertable<WorkoutMenu> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('menu_id')) {
      context.handle(_menuIdMeta,
          menuId.isAcceptableOrUnknown(data['menu_id']!, _menuIdMeta));
    } else if (isInserting) {
      context.missing(_menuIdMeta);
    }
    if (data.containsKey('set')) {
      context.handle(
          _setMeta, set.isAcceptableOrUnknown(data['set']!, _setMeta));
    } else if (isInserting) {
      context.missing(_setMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('rep')) {
      context.handle(
          _repMeta, rep.isAcceptableOrUnknown(data['rep']!, _repMeta));
    } else if (isInserting) {
      context.missing(_repMeta);
    }
    if (data.containsKey('assistant')) {
      context.handle(_assistantMeta,
          assistant.isAcceptableOrUnknown(data['assistant']!, _assistantMeta));
    } else if (isInserting) {
      context.missing(_assistantMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutMenu map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutMenu(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      menuId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}menu_id'])!,
      set: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}set'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      rep: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rep'])!,
      assistant: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}assistant'])!,
    );
  }

  @override
  $WorkoutMenusTable createAlias(String alias) {
    return $WorkoutMenusTable(attachedDatabase, alias);
  }
}

class WorkoutMenu extends DataClass implements Insertable<WorkoutMenu> {
  final int id;
  final DateTime date;
  final int menuId;
  final int set;
  final double weight;
  final int rep;
  final bool assistant;
  const WorkoutMenu(
      {required this.id,
      required this.date,
      required this.menuId,
      required this.set,
      required this.weight,
      required this.rep,
      required this.assistant});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['menu_id'] = Variable<int>(menuId);
    map['set'] = Variable<int>(set);
    map['weight'] = Variable<double>(weight);
    map['rep'] = Variable<int>(rep);
    map['assistant'] = Variable<bool>(assistant);
    return map;
  }

  WorkoutMenusCompanion toCompanion(bool nullToAbsent) {
    return WorkoutMenusCompanion(
      id: Value(id),
      date: Value(date),
      menuId: Value(menuId),
      set: Value(set),
      weight: Value(weight),
      rep: Value(rep),
      assistant: Value(assistant),
    );
  }

  factory WorkoutMenu.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutMenu(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      menuId: serializer.fromJson<int>(json['menuId']),
      set: serializer.fromJson<int>(json['set']),
      weight: serializer.fromJson<double>(json['weight']),
      rep: serializer.fromJson<int>(json['rep']),
      assistant: serializer.fromJson<bool>(json['assistant']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'menuId': serializer.toJson<int>(menuId),
      'set': serializer.toJson<int>(set),
      'weight': serializer.toJson<double>(weight),
      'rep': serializer.toJson<int>(rep),
      'assistant': serializer.toJson<bool>(assistant),
    };
  }

  WorkoutMenu copyWith(
          {int? id,
          DateTime? date,
          int? menuId,
          int? set,
          double? weight,
          int? rep,
          bool? assistant}) =>
      WorkoutMenu(
        id: id ?? this.id,
        date: date ?? this.date,
        menuId: menuId ?? this.menuId,
        set: set ?? this.set,
        weight: weight ?? this.weight,
        rep: rep ?? this.rep,
        assistant: assistant ?? this.assistant,
      );
  @override
  String toString() {
    return (StringBuffer('WorkoutMenu(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('menuId: $menuId, ')
          ..write('set: $set, ')
          ..write('weight: $weight, ')
          ..write('rep: $rep, ')
          ..write('assistant: $assistant')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, date, menuId, set, weight, rep, assistant);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutMenu &&
          other.id == this.id &&
          other.date == this.date &&
          other.menuId == this.menuId &&
          other.set == this.set &&
          other.weight == this.weight &&
          other.rep == this.rep &&
          other.assistant == this.assistant);
}

class WorkoutMenusCompanion extends UpdateCompanion<WorkoutMenu> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> menuId;
  final Value<int> set;
  final Value<double> weight;
  final Value<int> rep;
  final Value<bool> assistant;
  const WorkoutMenusCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.menuId = const Value.absent(),
    this.set = const Value.absent(),
    this.weight = const Value.absent(),
    this.rep = const Value.absent(),
    this.assistant = const Value.absent(),
  });
  WorkoutMenusCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required int menuId,
    required int set,
    required double weight,
    required int rep,
    required bool assistant,
  })  : date = Value(date),
        menuId = Value(menuId),
        set = Value(set),
        weight = Value(weight),
        rep = Value(rep),
        assistant = Value(assistant);
  static Insertable<WorkoutMenu> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? menuId,
    Expression<int>? set,
    Expression<double>? weight,
    Expression<int>? rep,
    Expression<bool>? assistant,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (menuId != null) 'menu_id': menuId,
      if (set != null) 'set': set,
      if (weight != null) 'weight': weight,
      if (rep != null) 'rep': rep,
      if (assistant != null) 'assistant': assistant,
    });
  }

  WorkoutMenusCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<int>? menuId,
      Value<int>? set,
      Value<double>? weight,
      Value<int>? rep,
      Value<bool>? assistant}) {
    return WorkoutMenusCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      menuId: menuId ?? this.menuId,
      set: set ?? this.set,
      weight: weight ?? this.weight,
      rep: rep ?? this.rep,
      assistant: assistant ?? this.assistant,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (menuId.present) {
      map['menu_id'] = Variable<int>(menuId.value);
    }
    if (set.present) {
      map['set'] = Variable<int>(set.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (rep.present) {
      map['rep'] = Variable<int>(rep.value);
    }
    if (assistant.present) {
      map['assistant'] = Variable<bool>(assistant.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutMenusCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('menuId: $menuId, ')
          ..write('set: $set, ')
          ..write('weight: $weight, ')
          ..write('rep: $rep, ')
          ..write('assistant: $assistant')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $PredeterminedMenusTable predeterminedMenus =
      $PredeterminedMenusTable(this);
  late final $WorkoutMenusTable workoutMenus = $WorkoutMenusTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [predeterminedMenus, workoutMenus];
}
