import 'dart:typed_data' show Uint8List;

class CharPageEntity {
  final List<CharacterEntity> characters;
  final int pageIdx;
  final bool isLastPage;
  const CharPageEntity({
    required this.characters,
    required this.pageIdx,
    required this.isLastPage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CharacterEntity && pageIdx == other.id;

  @override
  int get hashCode => pageIdx.hashCode;
}

class CharacterEntity {
  final int id;
  final String name;
  final String? image;
  final Uint8List? imageData;
  final String? species;
  final String? location;
  final String? status;
  final bool isFavorite;

  const CharacterEntity({
    required this.id,
    required this.name,
    this.image,
    this.imageData,
    this.species,
    this.location,
    this.status,
    this.isFavorite = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CharacterEntity && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
