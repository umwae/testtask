// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CharactersTable extends Characters
    with TableInfo<$CharactersTable, Character> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _speciesMeta = const VerificationMeta(
    'species',
  );
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
    'species',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _imageDataMeta = const VerificationMeta(
    'imageData',
  );
  @override
  late final GeneratedColumn<Uint8List> imageData = GeneratedColumn<Uint8List>(
    'image_data',
    aliasedName,
    true,
    type: DriftSqlType.blob,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    image,
    species,
    name,
    status,
    location,
    isFavorite,
    imageData,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'characters';
  @override
  VerificationContext validateIntegrity(
    Insertable<Character> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    }
    if (data.containsKey('species')) {
      context.handle(
        _speciesMeta,
        species.isAcceptableOrUnknown(data['species']!, _speciesMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('image_data')) {
      context.handle(
        _imageDataMeta,
        imageData.isAcceptableOrUnknown(data['image_data']!, _imageDataMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Character map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Character(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      ),
      species: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}species'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      imageData: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}image_data'],
      ),
    );
  }

  @override
  $CharactersTable createAlias(String alias) {
    return $CharactersTable(attachedDatabase, alias);
  }
}

class Character extends DataClass implements Insertable<Character> {
  final int id;
  final String? image;
  final String? species;
  final String name;
  final String? status;
  final String? location;
  final bool isFavorite;
  final Uint8List? imageData;
  const Character({
    required this.id,
    this.image,
    this.species,
    required this.name,
    this.status,
    this.location,
    required this.isFavorite,
    this.imageData,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || species != null) {
      map['species'] = Variable<String>(species);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    map['is_favorite'] = Variable<bool>(isFavorite);
    if (!nullToAbsent || imageData != null) {
      map['image_data'] = Variable<Uint8List>(imageData);
    }
    return map;
  }

  CharactersCompanion toCompanion(bool nullToAbsent) {
    return CharactersCompanion(
      id: Value(id),
      image: image == null && nullToAbsent
          ? const Value.absent()
          : Value(image),
      species: species == null && nullToAbsent
          ? const Value.absent()
          : Value(species),
      name: Value(name),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      isFavorite: Value(isFavorite),
      imageData: imageData == null && nullToAbsent
          ? const Value.absent()
          : Value(imageData),
    );
  }

  factory Character.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Character(
      id: serializer.fromJson<int>(json['id']),
      image: serializer.fromJson<String?>(json['image']),
      species: serializer.fromJson<String?>(json['species']),
      name: serializer.fromJson<String>(json['name']),
      status: serializer.fromJson<String?>(json['status']),
      location: serializer.fromJson<String?>(json['location']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      imageData: serializer.fromJson<Uint8List?>(json['imageData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'image': serializer.toJson<String?>(image),
      'species': serializer.toJson<String?>(species),
      'name': serializer.toJson<String>(name),
      'status': serializer.toJson<String?>(status),
      'location': serializer.toJson<String?>(location),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'imageData': serializer.toJson<Uint8List?>(imageData),
    };
  }

  Character copyWith({
    int? id,
    Value<String?> image = const Value.absent(),
    Value<String?> species = const Value.absent(),
    String? name,
    Value<String?> status = const Value.absent(),
    Value<String?> location = const Value.absent(),
    bool? isFavorite,
    Value<Uint8List?> imageData = const Value.absent(),
  }) => Character(
    id: id ?? this.id,
    image: image.present ? image.value : this.image,
    species: species.present ? species.value : this.species,
    name: name ?? this.name,
    status: status.present ? status.value : this.status,
    location: location.present ? location.value : this.location,
    isFavorite: isFavorite ?? this.isFavorite,
    imageData: imageData.present ? imageData.value : this.imageData,
  );
  Character copyWithCompanion(CharactersCompanion data) {
    return Character(
      id: data.id.present ? data.id.value : this.id,
      image: data.image.present ? data.image.value : this.image,
      species: data.species.present ? data.species.value : this.species,
      name: data.name.present ? data.name.value : this.name,
      status: data.status.present ? data.status.value : this.status,
      location: data.location.present ? data.location.value : this.location,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      imageData: data.imageData.present ? data.imageData.value : this.imageData,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Character(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('species: $species, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('location: $location, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('imageData: $imageData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    image,
    species,
    name,
    status,
    location,
    isFavorite,
    $driftBlobEquality.hash(imageData),
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Character &&
          other.id == this.id &&
          other.image == this.image &&
          other.species == this.species &&
          other.name == this.name &&
          other.status == this.status &&
          other.location == this.location &&
          other.isFavorite == this.isFavorite &&
          $driftBlobEquality.equals(other.imageData, this.imageData));
}

class CharactersCompanion extends UpdateCompanion<Character> {
  final Value<int> id;
  final Value<String?> image;
  final Value<String?> species;
  final Value<String> name;
  final Value<String?> status;
  final Value<String?> location;
  final Value<bool> isFavorite;
  final Value<Uint8List?> imageData;
  const CharactersCompanion({
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    this.species = const Value.absent(),
    this.name = const Value.absent(),
    this.status = const Value.absent(),
    this.location = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.imageData = const Value.absent(),
  });
  CharactersCompanion.insert({
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    this.species = const Value.absent(),
    required String name,
    this.status = const Value.absent(),
    this.location = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.imageData = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Character> custom({
    Expression<int>? id,
    Expression<String>? image,
    Expression<String>? species,
    Expression<String>? name,
    Expression<String>? status,
    Expression<String>? location,
    Expression<bool>? isFavorite,
    Expression<Uint8List>? imageData,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (image != null) 'image': image,
      if (species != null) 'species': species,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (location != null) 'location': location,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (imageData != null) 'image_data': imageData,
    });
  }

  CharactersCompanion copyWith({
    Value<int>? id,
    Value<String?>? image,
    Value<String?>? species,
    Value<String>? name,
    Value<String?>? status,
    Value<String?>? location,
    Value<bool>? isFavorite,
    Value<Uint8List?>? imageData,
  }) {
    return CharactersCompanion(
      id: id ?? this.id,
      image: image ?? this.image,
      species: species ?? this.species,
      name: name ?? this.name,
      status: status ?? this.status,
      location: location ?? this.location,
      isFavorite: isFavorite ?? this.isFavorite,
      imageData: imageData ?? this.imageData,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (imageData.present) {
      map['image_data'] = Variable<Uint8List>(imageData.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharactersCompanion(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('species: $species, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('location: $location, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('imageData: $imageData')
          ..write(')'))
        .toString();
  }
}

class $CharPagesTable extends CharPages
    with TableInfo<$CharPagesTable, CharPage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharPagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pageIdxMeta = const VerificationMeta(
    'pageIdx',
  );
  @override
  late final GeneratedColumn<int> pageIdx = GeneratedColumn<int>(
    'page_idx',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _charCountMeta = const VerificationMeta(
    'charCount',
  );
  @override
  late final GeneratedColumn<int> charCount = GeneratedColumn<int>(
    'char_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isLastPageMeta = const VerificationMeta(
    'isLastPage',
  );
  @override
  late final GeneratedColumn<bool> isLastPage = GeneratedColumn<bool>(
    'is_last_page',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_last_page" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [pageIdx, charCount, isLastPage];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'char_pages';
  @override
  VerificationContext validateIntegrity(
    Insertable<CharPage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('page_idx')) {
      context.handle(
        _pageIdxMeta,
        pageIdx.isAcceptableOrUnknown(data['page_idx']!, _pageIdxMeta),
      );
    }
    if (data.containsKey('char_count')) {
      context.handle(
        _charCountMeta,
        charCount.isAcceptableOrUnknown(data['char_count']!, _charCountMeta),
      );
    } else if (isInserting) {
      context.missing(_charCountMeta);
    }
    if (data.containsKey('is_last_page')) {
      context.handle(
        _isLastPageMeta,
        isLastPage.isAcceptableOrUnknown(
          data['is_last_page']!,
          _isLastPageMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pageIdx};
  @override
  CharPage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharPage(
      pageIdx: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_idx'],
      )!,
      charCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}char_count'],
      )!,
      isLastPage: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_last_page'],
      )!,
    );
  }

  @override
  $CharPagesTable createAlias(String alias) {
    return $CharPagesTable(attachedDatabase, alias);
  }
}

class CharPage extends DataClass implements Insertable<CharPage> {
  final int pageIdx;
  final int charCount;
  final bool isLastPage;
  const CharPage({
    required this.pageIdx,
    required this.charCount,
    required this.isLastPage,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['page_idx'] = Variable<int>(pageIdx);
    map['char_count'] = Variable<int>(charCount);
    map['is_last_page'] = Variable<bool>(isLastPage);
    return map;
  }

  CharPagesCompanion toCompanion(bool nullToAbsent) {
    return CharPagesCompanion(
      pageIdx: Value(pageIdx),
      charCount: Value(charCount),
      isLastPage: Value(isLastPage),
    );
  }

  factory CharPage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharPage(
      pageIdx: serializer.fromJson<int>(json['pageIdx']),
      charCount: serializer.fromJson<int>(json['charCount']),
      isLastPage: serializer.fromJson<bool>(json['isLastPage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pageIdx': serializer.toJson<int>(pageIdx),
      'charCount': serializer.toJson<int>(charCount),
      'isLastPage': serializer.toJson<bool>(isLastPage),
    };
  }

  CharPage copyWith({int? pageIdx, int? charCount, bool? isLastPage}) =>
      CharPage(
        pageIdx: pageIdx ?? this.pageIdx,
        charCount: charCount ?? this.charCount,
        isLastPage: isLastPage ?? this.isLastPage,
      );
  CharPage copyWithCompanion(CharPagesCompanion data) {
    return CharPage(
      pageIdx: data.pageIdx.present ? data.pageIdx.value : this.pageIdx,
      charCount: data.charCount.present ? data.charCount.value : this.charCount,
      isLastPage: data.isLastPage.present
          ? data.isLastPage.value
          : this.isLastPage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharPage(')
          ..write('pageIdx: $pageIdx, ')
          ..write('charCount: $charCount, ')
          ..write('isLastPage: $isLastPage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pageIdx, charCount, isLastPage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharPage &&
          other.pageIdx == this.pageIdx &&
          other.charCount == this.charCount &&
          other.isLastPage == this.isLastPage);
}

class CharPagesCompanion extends UpdateCompanion<CharPage> {
  final Value<int> pageIdx;
  final Value<int> charCount;
  final Value<bool> isLastPage;
  const CharPagesCompanion({
    this.pageIdx = const Value.absent(),
    this.charCount = const Value.absent(),
    this.isLastPage = const Value.absent(),
  });
  CharPagesCompanion.insert({
    this.pageIdx = const Value.absent(),
    required int charCount,
    this.isLastPage = const Value.absent(),
  }) : charCount = Value(charCount);
  static Insertable<CharPage> custom({
    Expression<int>? pageIdx,
    Expression<int>? charCount,
    Expression<bool>? isLastPage,
  }) {
    return RawValuesInsertable({
      if (pageIdx != null) 'page_idx': pageIdx,
      if (charCount != null) 'char_count': charCount,
      if (isLastPage != null) 'is_last_page': isLastPage,
    });
  }

  CharPagesCompanion copyWith({
    Value<int>? pageIdx,
    Value<int>? charCount,
    Value<bool>? isLastPage,
  }) {
    return CharPagesCompanion(
      pageIdx: pageIdx ?? this.pageIdx,
      charCount: charCount ?? this.charCount,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pageIdx.present) {
      map['page_idx'] = Variable<int>(pageIdx.value);
    }
    if (charCount.present) {
      map['char_count'] = Variable<int>(charCount.value);
    }
    if (isLastPage.present) {
      map['is_last_page'] = Variable<bool>(isLastPage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharPagesCompanion(')
          ..write('pageIdx: $pageIdx, ')
          ..write('charCount: $charCount, ')
          ..write('isLastPage: $isLastPage')
          ..write(')'))
        .toString();
  }
}

abstract class _$DB extends GeneratedDatabase {
  _$DB(QueryExecutor e) : super(e);
  $DBManager get managers => $DBManager(this);
  late final $CharactersTable characters = $CharactersTable(this);
  late final $CharPagesTable charPages = $CharPagesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [characters, charPages];
}

typedef $$CharactersTableCreateCompanionBuilder =
    CharactersCompanion Function({
      Value<int> id,
      Value<String?> image,
      Value<String?> species,
      required String name,
      Value<String?> status,
      Value<String?> location,
      Value<bool> isFavorite,
      Value<Uint8List?> imageData,
    });
typedef $$CharactersTableUpdateCompanionBuilder =
    CharactersCompanion Function({
      Value<int> id,
      Value<String?> image,
      Value<String?> species,
      Value<String> name,
      Value<String?> status,
      Value<String?> location,
      Value<bool> isFavorite,
      Value<Uint8List?> imageData,
    });

class $$CharactersTableFilterComposer extends Composer<_$DB, $CharactersTable> {
  $$CharactersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get imageData => $composableBuilder(
    column: $table.imageData,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CharactersTableOrderingComposer
    extends Composer<_$DB, $CharactersTable> {
  $$CharactersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get imageData => $composableBuilder(
    column: $table.imageData,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CharactersTableAnnotationComposer
    extends Composer<_$DB, $CharactersTable> {
  $$CharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get species =>
      $composableBuilder(column: $table.species, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<Uint8List> get imageData =>
      $composableBuilder(column: $table.imageData, builder: (column) => column);
}

class $$CharactersTableTableManager
    extends
        RootTableManager<
          _$DB,
          $CharactersTable,
          Character,
          $$CharactersTableFilterComposer,
          $$CharactersTableOrderingComposer,
          $$CharactersTableAnnotationComposer,
          $$CharactersTableCreateCompanionBuilder,
          $$CharactersTableUpdateCompanionBuilder,
          (Character, BaseReferences<_$DB, $CharactersTable, Character>),
          Character,
          PrefetchHooks Function()
        > {
  $$CharactersTableTableManager(_$DB db, $CharactersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharactersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CharactersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharactersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<String?> species = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<Uint8List?> imageData = const Value.absent(),
              }) => CharactersCompanion(
                id: id,
                image: image,
                species: species,
                name: name,
                status: status,
                location: location,
                isFavorite: isFavorite,
                imageData: imageData,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<String?> species = const Value.absent(),
                required String name,
                Value<String?> status = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<Uint8List?> imageData = const Value.absent(),
              }) => CharactersCompanion.insert(
                id: id,
                image: image,
                species: species,
                name: name,
                status: status,
                location: location,
                isFavorite: isFavorite,
                imageData: imageData,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CharactersTableProcessedTableManager =
    ProcessedTableManager<
      _$DB,
      $CharactersTable,
      Character,
      $$CharactersTableFilterComposer,
      $$CharactersTableOrderingComposer,
      $$CharactersTableAnnotationComposer,
      $$CharactersTableCreateCompanionBuilder,
      $$CharactersTableUpdateCompanionBuilder,
      (Character, BaseReferences<_$DB, $CharactersTable, Character>),
      Character,
      PrefetchHooks Function()
    >;
typedef $$CharPagesTableCreateCompanionBuilder =
    CharPagesCompanion Function({
      Value<int> pageIdx,
      required int charCount,
      Value<bool> isLastPage,
    });
typedef $$CharPagesTableUpdateCompanionBuilder =
    CharPagesCompanion Function({
      Value<int> pageIdx,
      Value<int> charCount,
      Value<bool> isLastPage,
    });

class $$CharPagesTableFilterComposer extends Composer<_$DB, $CharPagesTable> {
  $$CharPagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get pageIdx => $composableBuilder(
    column: $table.pageIdx,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get charCount => $composableBuilder(
    column: $table.charCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLastPage => $composableBuilder(
    column: $table.isLastPage,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CharPagesTableOrderingComposer extends Composer<_$DB, $CharPagesTable> {
  $$CharPagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get pageIdx => $composableBuilder(
    column: $table.pageIdx,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get charCount => $composableBuilder(
    column: $table.charCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLastPage => $composableBuilder(
    column: $table.isLastPage,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CharPagesTableAnnotationComposer
    extends Composer<_$DB, $CharPagesTable> {
  $$CharPagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get pageIdx =>
      $composableBuilder(column: $table.pageIdx, builder: (column) => column);

  GeneratedColumn<int> get charCount =>
      $composableBuilder(column: $table.charCount, builder: (column) => column);

  GeneratedColumn<bool> get isLastPage => $composableBuilder(
    column: $table.isLastPage,
    builder: (column) => column,
  );
}

class $$CharPagesTableTableManager
    extends
        RootTableManager<
          _$DB,
          $CharPagesTable,
          CharPage,
          $$CharPagesTableFilterComposer,
          $$CharPagesTableOrderingComposer,
          $$CharPagesTableAnnotationComposer,
          $$CharPagesTableCreateCompanionBuilder,
          $$CharPagesTableUpdateCompanionBuilder,
          (CharPage, BaseReferences<_$DB, $CharPagesTable, CharPage>),
          CharPage,
          PrefetchHooks Function()
        > {
  $$CharPagesTableTableManager(_$DB db, $CharPagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharPagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CharPagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharPagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> pageIdx = const Value.absent(),
                Value<int> charCount = const Value.absent(),
                Value<bool> isLastPage = const Value.absent(),
              }) => CharPagesCompanion(
                pageIdx: pageIdx,
                charCount: charCount,
                isLastPage: isLastPage,
              ),
          createCompanionCallback:
              ({
                Value<int> pageIdx = const Value.absent(),
                required int charCount,
                Value<bool> isLastPage = const Value.absent(),
              }) => CharPagesCompanion.insert(
                pageIdx: pageIdx,
                charCount: charCount,
                isLastPage: isLastPage,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CharPagesTableProcessedTableManager =
    ProcessedTableManager<
      _$DB,
      $CharPagesTable,
      CharPage,
      $$CharPagesTableFilterComposer,
      $$CharPagesTableOrderingComposer,
      $$CharPagesTableAnnotationComposer,
      $$CharPagesTableCreateCompanionBuilder,
      $$CharPagesTableUpdateCompanionBuilder,
      (CharPage, BaseReferences<_$DB, $CharPagesTable, CharPage>),
      CharPage,
      PrefetchHooks Function()
    >;

class $DBManager {
  final _$DB _db;
  $DBManager(this._db);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db, _db.characters);
  $$CharPagesTableTableManager get charPages =>
      $$CharPagesTableTableManager(_db, _db.charPages);
}
