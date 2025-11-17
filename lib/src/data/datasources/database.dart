import 'package:testtask/src/core/exceptions/app_exception_mapper.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

class Characters extends Table {
  IntColumn get id => integer()();
  TextColumn get image => text().nullable()();
  TextColumn get species => text().nullable()();
  TextColumn get name => text()();
  TextColumn get status => text().nullable()();
  TextColumn get location => text().nullable()();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(true))();
  BlobColumn get imageData => blob().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class CharPages extends Table {
  IntColumn get pageIdx => integer()();
  IntColumn get charCount => integer()();
  BoolColumn get isLastPage => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {pageIdx};
}

@DriftDatabase(tables: [Characters, CharPages])
class DB extends _$DB {
  DB() : super(driftDatabase(name: 'characters.db'));

  @override
  int get schemaVersion => 10;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (migrator, from, to) async {
      await migrator.deleteTable('characters');
      await migrator.createTable(characters);
      await migrator.deleteTable('char_pages');
      await migrator.createTable(charPages);
    },
  );

  //--------------------
  Future<List<Character>> getAllCharacters() async {
    try {
      return await select(characters).get();
    } on Exception catch (e) {
      throw e.toAppException();
    }
  }

  Future<int> getCurrentPageIdx() async {
    final query = selectOnly(charPages)..addColumns([charPages.pageIdx.count()]);
    final count = await query.map((row) => row.read(charPages.pageIdx.count())).getSingle();
    return count ?? 0;
  }

  Future<void> insertCharPage(CharPagesCompanion page) async {
    try {
      await into(charPages).insertOnConflictUpdate(page);
    } on Exception catch (e) {
      throw e.toAppException();
    }
  }

  Future<void> insertMultipleCharacters(List<CharactersCompanion> batch) async {
    try {
      for (final ch in batch) {
        await into(characters).insertOnConflictUpdate(ch);
      }
    } on Exception catch (e) {
      throw e.toAppException();
    }
  }

  Future<void> deleteAllEntries() async {
    try {
      await delete(characters).go();
      await delete(charPages).go();
    } on Exception catch (e) {
      throw e.toAppException();
    }
  }

  Future<void> toggleFavorite(int id) async {
    await transaction(() async {
      final character = await (select(characters)..where((t) => t.id.equals(id))).getSingle();
      await (update(characters)..where((t) => t.id.equals(id))).write(
        CharactersCompanion(
          isFavorite: Value(!character.isFavorite),
        ),
      );
    });
  }

  Stream<List<Character>> watchCharacters() {
    try {
      final query = select(characters)..orderBy([(t) => OrderingTerm(expression: t.name)]);
      return query.watch();
    } on Exception catch (_) {
      return const Stream.empty();
    }
  }
}
