// ignore_for_file: avoid_redundant_argument_values

import 'package:drift/drift.dart';
import 'package:testtask/src/data/datasources/database.dart' as db;
import 'package:testtask/src/domain/entities.dart';
import 'package:testtask/src/data/models/characters.dart';

extension CharacterEntityMapper on CharacterEntity {
  db.CharactersCompanion toCompanion() {
    return db.CharactersCompanion.insert(
      id: Value(id),
      name: name,
      image: Value(image),
      imageData: Value(imageData),
      species: Value(species),
      location: Value(location),
      status: Value(status),
      isFavorite: Value(isFavorite),
    );
  }
}

extension DBCharacterMapper on db.Character {
  CharacterEntity toEntity() {
    return CharacterEntity(
      id: id,
      name: name,
      image: image,
      imageData: imageData,
      species: species,
      location: location,
      status: status,
      isFavorite: isFavorite,
    );
  }
}

extension DTOCharacterMapper on CharacterDTO {
  CharacterEntity toEntity({Uint8List? imageData}) {
    return CharacterEntity(
      id: id,
      name: name,
      image: image,
      imageData: imageData,
      species: species.name,
      location: location.name,
      status: status.name,
      isFavorite: false,
    );
  }
}

extension DTOCharPageMapper on CharactersPageDTO {
  Future<CharPageEntity> toEntity(
    int pageIdx,
    Future<Uint8List?> Function(String url) imageDataLoader,
  ) async {
    final characters = await Future.wait(
      results.map((e) async {
        final imageData = await imageDataLoader.call(e.image);
        return e.toEntity(imageData: imageData);
      }).toList(),
    );
    return CharPageEntity(
      pageIdx: pageIdx,
      characters: characters,
      isLastPage: info.next == null,
    );
  }
}

extension CharPageEntityMapper on CharPageEntity {
  db.CharPagesCompanion toCompanion() {
    return db.CharPagesCompanion.insert(
      pageIdx: Value(pageIdx),
      charCount: characters.length,
      isLastPage: Value(isLastPage),
    );
  }
}
