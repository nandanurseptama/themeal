// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class AreaTableData extends DataClass implements Insertable<AreaTableData> {
  final int id;
  final String strArea;
  AreaTableData({required this.id, required this.strArea});
  factory AreaTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AreaTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      strArea: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_area'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['str_area'] = Variable<String>(strArea);
    return map;
  }

  AreaTableCompanion toCompanion(bool nullToAbsent) {
    return AreaTableCompanion(
      id: Value(id),
      strArea: Value(strArea),
    );
  }

  factory AreaTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AreaTableData(
      id: serializer.fromJson<int>(json['id']),
      strArea: serializer.fromJson<String>(json['strArea']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'strArea': serializer.toJson<String>(strArea),
    };
  }

  AreaTableData copyWith({int? id, String? strArea}) => AreaTableData(
        id: id ?? this.id,
        strArea: strArea ?? this.strArea,
      );
  @override
  String toString() {
    return (StringBuffer('AreaTableData(')
          ..write('id: $id, ')
          ..write('strArea: $strArea')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, strArea.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AreaTableData &&
          other.id == this.id &&
          other.strArea == this.strArea);
}

class AreaTableCompanion extends UpdateCompanion<AreaTableData> {
  final Value<int> id;
  final Value<String> strArea;
  const AreaTableCompanion({
    this.id = const Value.absent(),
    this.strArea = const Value.absent(),
  });
  AreaTableCompanion.insert({
    this.id = const Value.absent(),
    required String strArea,
  }) : strArea = Value(strArea);
  static Insertable<AreaTableData> custom({
    Expression<int>? id,
    Expression<String>? strArea,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (strArea != null) 'str_area': strArea,
    });
  }

  AreaTableCompanion copyWith({Value<int>? id, Value<String>? strArea}) {
    return AreaTableCompanion(
      id: id ?? this.id,
      strArea: strArea ?? this.strArea,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (strArea.present) {
      map['str_area'] = Variable<String>(strArea.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AreaTableCompanion(')
          ..write('id: $id, ')
          ..write('strArea: $strArea')
          ..write(')'))
        .toString();
  }
}

class $AreaTableTable extends AreaTable
    with TableInfo<$AreaTableTable, AreaTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $AreaTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _strAreaMeta = const VerificationMeta('strArea');
  late final GeneratedColumn<String?> strArea = GeneratedColumn<String?>(
      'str_area', aliasedName, false,
      typeName: 'TEXT',
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE');
  @override
  List<GeneratedColumn> get $columns => [id, strArea];
  @override
  String get aliasedName => _alias ?? 'area_table';
  @override
  String get actualTableName => 'area_table';
  @override
  VerificationContext validateIntegrity(Insertable<AreaTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('str_area')) {
      context.handle(_strAreaMeta,
          strArea.isAcceptableOrUnknown(data['str_area']!, _strAreaMeta));
    } else if (isInserting) {
      context.missing(_strAreaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AreaTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AreaTableData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AreaTableTable createAlias(String alias) {
    return $AreaTableTable(_db, alias);
  }
}

class MealTableData extends DataClass implements Insertable<MealTableData> {
  final int id;

  /// id meal
  final String idMeal;

  /// meal name
  final String strMeal;

  /// drink alternate
  final String? strDrinkAlternate;

  /// meal category
  final String strCategory;

  /// meal area
  final String strArea;

  /// meal thumb
  final String? strMealThumb;

  /// instruction to cook
  final String strInstructions;

  /// meal tags
  final String? strTags;

  /// tutorial video about how to cook the meal
  final String strYoutube;

  /// list of ingredient
  final String? strIngredient;

  /// list of ingredient measure
  final String? strMeasure;

  /// author
  final String? strSource;

  /// image source
  final String? strImageSource;

  /// is favorite
  final bool isFavorite;
  MealTableData(
      {required this.id,
      required this.idMeal,
      required this.strMeal,
      this.strDrinkAlternate,
      required this.strCategory,
      required this.strArea,
      this.strMealThumb,
      required this.strInstructions,
      this.strTags,
      required this.strYoutube,
      this.strIngredient,
      this.strMeasure,
      this.strSource,
      this.strImageSource,
      required this.isFavorite});
  factory MealTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MealTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idMeal: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_meal'])!,
      strMeal: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_meal'])!,
      strDrinkAlternate: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}str_drink_alternate']),
      strCategory: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_category'])!,
      strArea: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_area'])!,
      strMealThumb: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_meal_thumb']),
      strInstructions: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_instructions'])!,
      strTags: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_tags']),
      strYoutube: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_youtube'])!,
      strIngredient: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_ingredient']),
      strMeasure: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_measure']),
      strSource: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_source']),
      strImageSource: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_image_source']),
      isFavorite: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_favorite'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_meal'] = Variable<String>(idMeal);
    map['str_meal'] = Variable<String>(strMeal);
    if (!nullToAbsent || strDrinkAlternate != null) {
      map['str_drink_alternate'] = Variable<String?>(strDrinkAlternate);
    }
    map['str_category'] = Variable<String>(strCategory);
    map['str_area'] = Variable<String>(strArea);
    if (!nullToAbsent || strMealThumb != null) {
      map['str_meal_thumb'] = Variable<String?>(strMealThumb);
    }
    map['str_instructions'] = Variable<String>(strInstructions);
    if (!nullToAbsent || strTags != null) {
      map['str_tags'] = Variable<String?>(strTags);
    }
    map['str_youtube'] = Variable<String>(strYoutube);
    if (!nullToAbsent || strIngredient != null) {
      map['str_ingredient'] = Variable<String?>(strIngredient);
    }
    if (!nullToAbsent || strMeasure != null) {
      map['str_measure'] = Variable<String?>(strMeasure);
    }
    if (!nullToAbsent || strSource != null) {
      map['str_source'] = Variable<String?>(strSource);
    }
    if (!nullToAbsent || strImageSource != null) {
      map['str_image_source'] = Variable<String?>(strImageSource);
    }
    map['is_favorite'] = Variable<bool>(isFavorite);
    return map;
  }

  MealTableCompanion toCompanion(bool nullToAbsent) {
    return MealTableCompanion(
      id: Value(id),
      idMeal: Value(idMeal),
      strMeal: Value(strMeal),
      strDrinkAlternate: strDrinkAlternate == null && nullToAbsent
          ? const Value.absent()
          : Value(strDrinkAlternate),
      strCategory: Value(strCategory),
      strArea: Value(strArea),
      strMealThumb: strMealThumb == null && nullToAbsent
          ? const Value.absent()
          : Value(strMealThumb),
      strInstructions: Value(strInstructions),
      strTags: strTags == null && nullToAbsent
          ? const Value.absent()
          : Value(strTags),
      strYoutube: Value(strYoutube),
      strIngredient: strIngredient == null && nullToAbsent
          ? const Value.absent()
          : Value(strIngredient),
      strMeasure: strMeasure == null && nullToAbsent
          ? const Value.absent()
          : Value(strMeasure),
      strSource: strSource == null && nullToAbsent
          ? const Value.absent()
          : Value(strSource),
      strImageSource: strImageSource == null && nullToAbsent
          ? const Value.absent()
          : Value(strImageSource),
      isFavorite: Value(isFavorite),
    );
  }

  factory MealTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MealTableData(
      id: serializer.fromJson<int>(json['id']),
      idMeal: serializer.fromJson<String>(json['idMeal']),
      strMeal: serializer.fromJson<String>(json['strMeal']),
      strDrinkAlternate:
          serializer.fromJson<String?>(json['strDrinkAlternate']),
      strCategory: serializer.fromJson<String>(json['strCategory']),
      strArea: serializer.fromJson<String>(json['strArea']),
      strMealThumb: serializer.fromJson<String?>(json['strMealThumb']),
      strInstructions: serializer.fromJson<String>(json['strInstructions']),
      strTags: serializer.fromJson<String?>(json['strTags']),
      strYoutube: serializer.fromJson<String>(json['strYoutube']),
      strIngredient: serializer.fromJson<String?>(json['strIngredient']),
      strMeasure: serializer.fromJson<String?>(json['strMeasure']),
      strSource: serializer.fromJson<String?>(json['strSource']),
      strImageSource: serializer.fromJson<String?>(json['strImageSource']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idMeal': serializer.toJson<String>(idMeal),
      'strMeal': serializer.toJson<String>(strMeal),
      'strDrinkAlternate': serializer.toJson<String?>(strDrinkAlternate),
      'strCategory': serializer.toJson<String>(strCategory),
      'strArea': serializer.toJson<String>(strArea),
      'strMealThumb': serializer.toJson<String?>(strMealThumb),
      'strInstructions': serializer.toJson<String>(strInstructions),
      'strTags': serializer.toJson<String?>(strTags),
      'strYoutube': serializer.toJson<String>(strYoutube),
      'strIngredient': serializer.toJson<String?>(strIngredient),
      'strMeasure': serializer.toJson<String?>(strMeasure),
      'strSource': serializer.toJson<String?>(strSource),
      'strImageSource': serializer.toJson<String?>(strImageSource),
      'isFavorite': serializer.toJson<bool>(isFavorite),
    };
  }

  MealTableData copyWith(
          {int? id,
          String? idMeal,
          String? strMeal,
          String? strDrinkAlternate,
          String? strCategory,
          String? strArea,
          String? strMealThumb,
          String? strInstructions,
          String? strTags,
          String? strYoutube,
          String? strIngredient,
          String? strMeasure,
          String? strSource,
          String? strImageSource,
          bool? isFavorite}) =>
      MealTableData(
        id: id ?? this.id,
        idMeal: idMeal ?? this.idMeal,
        strMeal: strMeal ?? this.strMeal,
        strDrinkAlternate: strDrinkAlternate ?? this.strDrinkAlternate,
        strCategory: strCategory ?? this.strCategory,
        strArea: strArea ?? this.strArea,
        strMealThumb: strMealThumb ?? this.strMealThumb,
        strInstructions: strInstructions ?? this.strInstructions,
        strTags: strTags ?? this.strTags,
        strYoutube: strYoutube ?? this.strYoutube,
        strIngredient: strIngredient ?? this.strIngredient,
        strMeasure: strMeasure ?? this.strMeasure,
        strSource: strSource ?? this.strSource,
        strImageSource: strImageSource ?? this.strImageSource,
        isFavorite: isFavorite ?? this.isFavorite,
      );
  @override
  String toString() {
    return (StringBuffer('MealTableData(')
          ..write('id: $id, ')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strDrinkAlternate: $strDrinkAlternate, ')
          ..write('strCategory: $strCategory, ')
          ..write('strArea: $strArea, ')
          ..write('strMealThumb: $strMealThumb, ')
          ..write('strInstructions: $strInstructions, ')
          ..write('strTags: $strTags, ')
          ..write('strYoutube: $strYoutube, ')
          ..write('strIngredient: $strIngredient, ')
          ..write('strMeasure: $strMeasure, ')
          ..write('strSource: $strSource, ')
          ..write('strImageSource: $strImageSource, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idMeal.hashCode,
          $mrjc(
              strMeal.hashCode,
              $mrjc(
                  strDrinkAlternate.hashCode,
                  $mrjc(
                      strCategory.hashCode,
                      $mrjc(
                          strArea.hashCode,
                          $mrjc(
                              strMealThumb.hashCode,
                              $mrjc(
                                  strInstructions.hashCode,
                                  $mrjc(
                                      strTags.hashCode,
                                      $mrjc(
                                          strYoutube.hashCode,
                                          $mrjc(
                                              strIngredient.hashCode,
                                              $mrjc(
                                                  strMeasure.hashCode,
                                                  $mrjc(
                                                      strSource.hashCode,
                                                      $mrjc(
                                                          strImageSource
                                                              .hashCode,
                                                          isFavorite
                                                              .hashCode)))))))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealTableData &&
          other.id == this.id &&
          other.idMeal == this.idMeal &&
          other.strMeal == this.strMeal &&
          other.strDrinkAlternate == this.strDrinkAlternate &&
          other.strCategory == this.strCategory &&
          other.strArea == this.strArea &&
          other.strMealThumb == this.strMealThumb &&
          other.strInstructions == this.strInstructions &&
          other.strTags == this.strTags &&
          other.strYoutube == this.strYoutube &&
          other.strIngredient == this.strIngredient &&
          other.strMeasure == this.strMeasure &&
          other.strSource == this.strSource &&
          other.strImageSource == this.strImageSource &&
          other.isFavorite == this.isFavorite);
}

class MealTableCompanion extends UpdateCompanion<MealTableData> {
  final Value<int> id;
  final Value<String> idMeal;
  final Value<String> strMeal;
  final Value<String?> strDrinkAlternate;
  final Value<String> strCategory;
  final Value<String> strArea;
  final Value<String?> strMealThumb;
  final Value<String> strInstructions;
  final Value<String?> strTags;
  final Value<String> strYoutube;
  final Value<String?> strIngredient;
  final Value<String?> strMeasure;
  final Value<String?> strSource;
  final Value<String?> strImageSource;
  final Value<bool> isFavorite;
  const MealTableCompanion({
    this.id = const Value.absent(),
    this.idMeal = const Value.absent(),
    this.strMeal = const Value.absent(),
    this.strDrinkAlternate = const Value.absent(),
    this.strCategory = const Value.absent(),
    this.strArea = const Value.absent(),
    this.strMealThumb = const Value.absent(),
    this.strInstructions = const Value.absent(),
    this.strTags = const Value.absent(),
    this.strYoutube = const Value.absent(),
    this.strIngredient = const Value.absent(),
    this.strMeasure = const Value.absent(),
    this.strSource = const Value.absent(),
    this.strImageSource = const Value.absent(),
    this.isFavorite = const Value.absent(),
  });
  MealTableCompanion.insert({
    this.id = const Value.absent(),
    required String idMeal,
    required String strMeal,
    this.strDrinkAlternate = const Value.absent(),
    required String strCategory,
    required String strArea,
    this.strMealThumb = const Value.absent(),
    required String strInstructions,
    this.strTags = const Value.absent(),
    required String strYoutube,
    this.strIngredient = const Value.absent(),
    this.strMeasure = const Value.absent(),
    this.strSource = const Value.absent(),
    this.strImageSource = const Value.absent(),
    this.isFavorite = const Value.absent(),
  })  : idMeal = Value(idMeal),
        strMeal = Value(strMeal),
        strCategory = Value(strCategory),
        strArea = Value(strArea),
        strInstructions = Value(strInstructions),
        strYoutube = Value(strYoutube);
  static Insertable<MealTableData> custom({
    Expression<int>? id,
    Expression<String>? idMeal,
    Expression<String>? strMeal,
    Expression<String?>? strDrinkAlternate,
    Expression<String>? strCategory,
    Expression<String>? strArea,
    Expression<String?>? strMealThumb,
    Expression<String>? strInstructions,
    Expression<String?>? strTags,
    Expression<String>? strYoutube,
    Expression<String?>? strIngredient,
    Expression<String?>? strMeasure,
    Expression<String?>? strSource,
    Expression<String?>? strImageSource,
    Expression<bool>? isFavorite,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idMeal != null) 'id_meal': idMeal,
      if (strMeal != null) 'str_meal': strMeal,
      if (strDrinkAlternate != null) 'str_drink_alternate': strDrinkAlternate,
      if (strCategory != null) 'str_category': strCategory,
      if (strArea != null) 'str_area': strArea,
      if (strMealThumb != null) 'str_meal_thumb': strMealThumb,
      if (strInstructions != null) 'str_instructions': strInstructions,
      if (strTags != null) 'str_tags': strTags,
      if (strYoutube != null) 'str_youtube': strYoutube,
      if (strIngredient != null) 'str_ingredient': strIngredient,
      if (strMeasure != null) 'str_measure': strMeasure,
      if (strSource != null) 'str_source': strSource,
      if (strImageSource != null) 'str_image_source': strImageSource,
      if (isFavorite != null) 'is_favorite': isFavorite,
    });
  }

  MealTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? idMeal,
      Value<String>? strMeal,
      Value<String?>? strDrinkAlternate,
      Value<String>? strCategory,
      Value<String>? strArea,
      Value<String?>? strMealThumb,
      Value<String>? strInstructions,
      Value<String?>? strTags,
      Value<String>? strYoutube,
      Value<String?>? strIngredient,
      Value<String?>? strMeasure,
      Value<String?>? strSource,
      Value<String?>? strImageSource,
      Value<bool>? isFavorite}) {
    return MealTableCompanion(
      id: id ?? this.id,
      idMeal: idMeal ?? this.idMeal,
      strMeal: strMeal ?? this.strMeal,
      strDrinkAlternate: strDrinkAlternate ?? this.strDrinkAlternate,
      strCategory: strCategory ?? this.strCategory,
      strArea: strArea ?? this.strArea,
      strMealThumb: strMealThumb ?? this.strMealThumb,
      strInstructions: strInstructions ?? this.strInstructions,
      strTags: strTags ?? this.strTags,
      strYoutube: strYoutube ?? this.strYoutube,
      strIngredient: strIngredient ?? this.strIngredient,
      strMeasure: strMeasure ?? this.strMeasure,
      strSource: strSource ?? this.strSource,
      strImageSource: strImageSource ?? this.strImageSource,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idMeal.present) {
      map['id_meal'] = Variable<String>(idMeal.value);
    }
    if (strMeal.present) {
      map['str_meal'] = Variable<String>(strMeal.value);
    }
    if (strDrinkAlternate.present) {
      map['str_drink_alternate'] = Variable<String?>(strDrinkAlternate.value);
    }
    if (strCategory.present) {
      map['str_category'] = Variable<String>(strCategory.value);
    }
    if (strArea.present) {
      map['str_area'] = Variable<String>(strArea.value);
    }
    if (strMealThumb.present) {
      map['str_meal_thumb'] = Variable<String?>(strMealThumb.value);
    }
    if (strInstructions.present) {
      map['str_instructions'] = Variable<String>(strInstructions.value);
    }
    if (strTags.present) {
      map['str_tags'] = Variable<String?>(strTags.value);
    }
    if (strYoutube.present) {
      map['str_youtube'] = Variable<String>(strYoutube.value);
    }
    if (strIngredient.present) {
      map['str_ingredient'] = Variable<String?>(strIngredient.value);
    }
    if (strMeasure.present) {
      map['str_measure'] = Variable<String?>(strMeasure.value);
    }
    if (strSource.present) {
      map['str_source'] = Variable<String?>(strSource.value);
    }
    if (strImageSource.present) {
      map['str_image_source'] = Variable<String?>(strImageSource.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealTableCompanion(')
          ..write('id: $id, ')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strDrinkAlternate: $strDrinkAlternate, ')
          ..write('strCategory: $strCategory, ')
          ..write('strArea: $strArea, ')
          ..write('strMealThumb: $strMealThumb, ')
          ..write('strInstructions: $strInstructions, ')
          ..write('strTags: $strTags, ')
          ..write('strYoutube: $strYoutube, ')
          ..write('strIngredient: $strIngredient, ')
          ..write('strMeasure: $strMeasure, ')
          ..write('strSource: $strSource, ')
          ..write('strImageSource: $strImageSource, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }
}

class $MealTableTable extends MealTable
    with TableInfo<$MealTableTable, MealTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MealTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idMealMeta = const VerificationMeta('idMeal');
  late final GeneratedColumn<String?> idMeal = GeneratedColumn<String?>(
      'id_meal', aliasedName, false,
      typeName: 'TEXT',
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _strMealMeta = const VerificationMeta('strMeal');
  late final GeneratedColumn<String?> strMeal = GeneratedColumn<String?>(
      'str_meal', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _strDrinkAlternateMeta =
      const VerificationMeta('strDrinkAlternate');
  late final GeneratedColumn<String?> strDrinkAlternate =
      GeneratedColumn<String?>('str_drink_alternate', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _strCategoryMeta =
      const VerificationMeta('strCategory');
  late final GeneratedColumn<String?> strCategory = GeneratedColumn<String?>(
      'str_category', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _strAreaMeta = const VerificationMeta('strArea');
  late final GeneratedColumn<String?> strArea = GeneratedColumn<String?>(
      'str_area', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _strMealThumbMeta =
      const VerificationMeta('strMealThumb');
  late final GeneratedColumn<String?> strMealThumb = GeneratedColumn<String?>(
      'str_meal_thumb', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _strInstructionsMeta =
      const VerificationMeta('strInstructions');
  late final GeneratedColumn<String?> strInstructions =
      GeneratedColumn<String?>('str_instructions', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _strTagsMeta = const VerificationMeta('strTags');
  late final GeneratedColumn<String?> strTags = GeneratedColumn<String?>(
      'str_tags', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _strYoutubeMeta = const VerificationMeta('strYoutube');
  late final GeneratedColumn<String?> strYoutube = GeneratedColumn<String?>(
      'str_youtube', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _strIngredientMeta =
      const VerificationMeta('strIngredient');
  late final GeneratedColumn<String?> strIngredient = GeneratedColumn<String?>(
      'str_ingredient', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _strMeasureMeta = const VerificationMeta('strMeasure');
  late final GeneratedColumn<String?> strMeasure = GeneratedColumn<String?>(
      'str_measure', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _strSourceMeta = const VerificationMeta('strSource');
  late final GeneratedColumn<String?> strSource = GeneratedColumn<String?>(
      'str_source', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _strImageSourceMeta =
      const VerificationMeta('strImageSource');
  late final GeneratedColumn<String?> strImageSource = GeneratedColumn<String?>(
      'str_image_source', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _isFavoriteMeta = const VerificationMeta('isFavorite');
  late final GeneratedColumn<bool?> isFavorite = GeneratedColumn<bool?>(
      'is_favorite', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_favorite IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idMeal,
        strMeal,
        strDrinkAlternate,
        strCategory,
        strArea,
        strMealThumb,
        strInstructions,
        strTags,
        strYoutube,
        strIngredient,
        strMeasure,
        strSource,
        strImageSource,
        isFavorite
      ];
  @override
  String get aliasedName => _alias ?? 'meal_table';
  @override
  String get actualTableName => 'meal_table';
  @override
  VerificationContext validateIntegrity(Insertable<MealTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_meal')) {
      context.handle(_idMealMeta,
          idMeal.isAcceptableOrUnknown(data['id_meal']!, _idMealMeta));
    } else if (isInserting) {
      context.missing(_idMealMeta);
    }
    if (data.containsKey('str_meal')) {
      context.handle(_strMealMeta,
          strMeal.isAcceptableOrUnknown(data['str_meal']!, _strMealMeta));
    } else if (isInserting) {
      context.missing(_strMealMeta);
    }
    if (data.containsKey('str_drink_alternate')) {
      context.handle(
          _strDrinkAlternateMeta,
          strDrinkAlternate.isAcceptableOrUnknown(
              data['str_drink_alternate']!, _strDrinkAlternateMeta));
    }
    if (data.containsKey('str_category')) {
      context.handle(
          _strCategoryMeta,
          strCategory.isAcceptableOrUnknown(
              data['str_category']!, _strCategoryMeta));
    } else if (isInserting) {
      context.missing(_strCategoryMeta);
    }
    if (data.containsKey('str_area')) {
      context.handle(_strAreaMeta,
          strArea.isAcceptableOrUnknown(data['str_area']!, _strAreaMeta));
    } else if (isInserting) {
      context.missing(_strAreaMeta);
    }
    if (data.containsKey('str_meal_thumb')) {
      context.handle(
          _strMealThumbMeta,
          strMealThumb.isAcceptableOrUnknown(
              data['str_meal_thumb']!, _strMealThumbMeta));
    }
    if (data.containsKey('str_instructions')) {
      context.handle(
          _strInstructionsMeta,
          strInstructions.isAcceptableOrUnknown(
              data['str_instructions']!, _strInstructionsMeta));
    } else if (isInserting) {
      context.missing(_strInstructionsMeta);
    }
    if (data.containsKey('str_tags')) {
      context.handle(_strTagsMeta,
          strTags.isAcceptableOrUnknown(data['str_tags']!, _strTagsMeta));
    }
    if (data.containsKey('str_youtube')) {
      context.handle(
          _strYoutubeMeta,
          strYoutube.isAcceptableOrUnknown(
              data['str_youtube']!, _strYoutubeMeta));
    } else if (isInserting) {
      context.missing(_strYoutubeMeta);
    }
    if (data.containsKey('str_ingredient')) {
      context.handle(
          _strIngredientMeta,
          strIngredient.isAcceptableOrUnknown(
              data['str_ingredient']!, _strIngredientMeta));
    }
    if (data.containsKey('str_measure')) {
      context.handle(
          _strMeasureMeta,
          strMeasure.isAcceptableOrUnknown(
              data['str_measure']!, _strMeasureMeta));
    }
    if (data.containsKey('str_source')) {
      context.handle(_strSourceMeta,
          strSource.isAcceptableOrUnknown(data['str_source']!, _strSourceMeta));
    }
    if (data.containsKey('str_image_source')) {
      context.handle(
          _strImageSourceMeta,
          strImageSource.isAcceptableOrUnknown(
              data['str_image_source']!, _strImageSourceMeta));
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['is_favorite']!, _isFavoriteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MealTableData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MealTableTable createAlias(String alias) {
    return $MealTableTable(_db, alias);
  }
}

class CategoryTableData extends DataClass
    implements Insertable<CategoryTableData> {
  final int id;

  /// id category
  final String idCategory;

  /// category name
  final String strCategory;

  /// category thumbnail
  final String strCategoryThumb;

  /// category description
  final String strCategoryDescription;
  CategoryTableData(
      {required this.id,
      required this.idCategory,
      required this.strCategory,
      required this.strCategoryThumb,
      required this.strCategoryDescription});
  factory CategoryTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CategoryTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idCategory: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_category'])!,
      strCategory: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_category'])!,
      strCategoryThumb: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}str_category_thumb'])!,
      strCategoryDescription: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}str_category_description'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_category'] = Variable<String>(idCategory);
    map['str_category'] = Variable<String>(strCategory);
    map['str_category_thumb'] = Variable<String>(strCategoryThumb);
    map['str_category_description'] = Variable<String>(strCategoryDescription);
    return map;
  }

  CategoryTableCompanion toCompanion(bool nullToAbsent) {
    return CategoryTableCompanion(
      id: Value(id),
      idCategory: Value(idCategory),
      strCategory: Value(strCategory),
      strCategoryThumb: Value(strCategoryThumb),
      strCategoryDescription: Value(strCategoryDescription),
    );
  }

  factory CategoryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CategoryTableData(
      id: serializer.fromJson<int>(json['id']),
      idCategory: serializer.fromJson<String>(json['idCategory']),
      strCategory: serializer.fromJson<String>(json['strCategory']),
      strCategoryThumb: serializer.fromJson<String>(json['strCategoryThumb']),
      strCategoryDescription:
          serializer.fromJson<String>(json['strCategoryDescription']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idCategory': serializer.toJson<String>(idCategory),
      'strCategory': serializer.toJson<String>(strCategory),
      'strCategoryThumb': serializer.toJson<String>(strCategoryThumb),
      'strCategoryDescription':
          serializer.toJson<String>(strCategoryDescription),
    };
  }

  CategoryTableData copyWith(
          {int? id,
          String? idCategory,
          String? strCategory,
          String? strCategoryThumb,
          String? strCategoryDescription}) =>
      CategoryTableData(
        id: id ?? this.id,
        idCategory: idCategory ?? this.idCategory,
        strCategory: strCategory ?? this.strCategory,
        strCategoryThumb: strCategoryThumb ?? this.strCategoryThumb,
        strCategoryDescription:
            strCategoryDescription ?? this.strCategoryDescription,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryTableData(')
          ..write('id: $id, ')
          ..write('idCategory: $idCategory, ')
          ..write('strCategory: $strCategory, ')
          ..write('strCategoryThumb: $strCategoryThumb, ')
          ..write('strCategoryDescription: $strCategoryDescription')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idCategory.hashCode,
          $mrjc(
              strCategory.hashCode,
              $mrjc(strCategoryThumb.hashCode,
                  strCategoryDescription.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryTableData &&
          other.id == this.id &&
          other.idCategory == this.idCategory &&
          other.strCategory == this.strCategory &&
          other.strCategoryThumb == this.strCategoryThumb &&
          other.strCategoryDescription == this.strCategoryDescription);
}

class CategoryTableCompanion extends UpdateCompanion<CategoryTableData> {
  final Value<int> id;
  final Value<String> idCategory;
  final Value<String> strCategory;
  final Value<String> strCategoryThumb;
  final Value<String> strCategoryDescription;
  const CategoryTableCompanion({
    this.id = const Value.absent(),
    this.idCategory = const Value.absent(),
    this.strCategory = const Value.absent(),
    this.strCategoryThumb = const Value.absent(),
    this.strCategoryDescription = const Value.absent(),
  });
  CategoryTableCompanion.insert({
    this.id = const Value.absent(),
    required String idCategory,
    required String strCategory,
    required String strCategoryThumb,
    required String strCategoryDescription,
  })  : idCategory = Value(idCategory),
        strCategory = Value(strCategory),
        strCategoryThumb = Value(strCategoryThumb),
        strCategoryDescription = Value(strCategoryDescription);
  static Insertable<CategoryTableData> custom({
    Expression<int>? id,
    Expression<String>? idCategory,
    Expression<String>? strCategory,
    Expression<String>? strCategoryThumb,
    Expression<String>? strCategoryDescription,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idCategory != null) 'id_category': idCategory,
      if (strCategory != null) 'str_category': strCategory,
      if (strCategoryThumb != null) 'str_category_thumb': strCategoryThumb,
      if (strCategoryDescription != null)
        'str_category_description': strCategoryDescription,
    });
  }

  CategoryTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? idCategory,
      Value<String>? strCategory,
      Value<String>? strCategoryThumb,
      Value<String>? strCategoryDescription}) {
    return CategoryTableCompanion(
      id: id ?? this.id,
      idCategory: idCategory ?? this.idCategory,
      strCategory: strCategory ?? this.strCategory,
      strCategoryThumb: strCategoryThumb ?? this.strCategoryThumb,
      strCategoryDescription:
          strCategoryDescription ?? this.strCategoryDescription,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idCategory.present) {
      map['id_category'] = Variable<String>(idCategory.value);
    }
    if (strCategory.present) {
      map['str_category'] = Variable<String>(strCategory.value);
    }
    if (strCategoryThumb.present) {
      map['str_category_thumb'] = Variable<String>(strCategoryThumb.value);
    }
    if (strCategoryDescription.present) {
      map['str_category_description'] =
          Variable<String>(strCategoryDescription.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableCompanion(')
          ..write('id: $id, ')
          ..write('idCategory: $idCategory, ')
          ..write('strCategory: $strCategory, ')
          ..write('strCategoryThumb: $strCategoryThumb, ')
          ..write('strCategoryDescription: $strCategoryDescription')
          ..write(')'))
        .toString();
  }
}

class $CategoryTableTable extends CategoryTable
    with TableInfo<$CategoryTableTable, CategoryTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CategoryTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idCategoryMeta = const VerificationMeta('idCategory');
  late final GeneratedColumn<String?> idCategory = GeneratedColumn<String?>(
      'id_category', aliasedName, false,
      typeName: 'TEXT',
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _strCategoryMeta =
      const VerificationMeta('strCategory');
  late final GeneratedColumn<String?> strCategory = GeneratedColumn<String?>(
      'str_category', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _strCategoryThumbMeta =
      const VerificationMeta('strCategoryThumb');
  late final GeneratedColumn<String?> strCategoryThumb =
      GeneratedColumn<String?>('str_category_thumb', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _strCategoryDescriptionMeta =
      const VerificationMeta('strCategoryDescription');
  late final GeneratedColumn<String?> strCategoryDescription =
      GeneratedColumn<String?>('str_category_description', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, idCategory, strCategory, strCategoryThumb, strCategoryDescription];
  @override
  String get aliasedName => _alias ?? 'category_table';
  @override
  String get actualTableName => 'category_table';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_category')) {
      context.handle(
          _idCategoryMeta,
          idCategory.isAcceptableOrUnknown(
              data['id_category']!, _idCategoryMeta));
    } else if (isInserting) {
      context.missing(_idCategoryMeta);
    }
    if (data.containsKey('str_category')) {
      context.handle(
          _strCategoryMeta,
          strCategory.isAcceptableOrUnknown(
              data['str_category']!, _strCategoryMeta));
    } else if (isInserting) {
      context.missing(_strCategoryMeta);
    }
    if (data.containsKey('str_category_thumb')) {
      context.handle(
          _strCategoryThumbMeta,
          strCategoryThumb.isAcceptableOrUnknown(
              data['str_category_thumb']!, _strCategoryThumbMeta));
    } else if (isInserting) {
      context.missing(_strCategoryThumbMeta);
    }
    if (data.containsKey('str_category_description')) {
      context.handle(
          _strCategoryDescriptionMeta,
          strCategoryDescription.isAcceptableOrUnknown(
              data['str_category_description']!, _strCategoryDescriptionMeta));
    } else if (isInserting) {
      context.missing(_strCategoryDescriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CategoryTableData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CategoryTableTable createAlias(String alias) {
    return $CategoryTableTable(_db, alias);
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $AreaTableTable areaTable = $AreaTableTable(this);
  late final $MealTableTable mealTable = $MealTableTable(this);
  late final $CategoryTableTable categoryTable = $CategoryTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [areaTable, mealTable, categoryTable];
}
