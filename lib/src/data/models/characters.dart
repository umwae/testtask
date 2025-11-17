import 'package:json_annotation/json_annotation.dart';

part 'characters.g.dart';

@JsonSerializable()
class CharactersPageDTO {
  final Info info;
  final List<CharacterDTO> results;

  CharactersPageDTO({required this.info, required this.results});

  factory CharactersPageDTO.fromJson(Map<String, dynamic> json) =>
      _$CharactersPageDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CharactersPageDTOToJson(this);
}

@JsonSerializable()
class Info {
  final int count;
  final int pages;
  final String? next;
  final dynamic prev;

  Info({required this.count, required this.pages, this.next, this.prev});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class CharacterDTO {
  final int id;
  final String name;
  final Status status;
  final Species species;
  final String type;
  final Gender gender;
  final Location origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  final DateTime created;

  CharacterDTO({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory CharacterDTO.fromJson(Map<String, dynamic> json) => _$CharacterDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterDTOToJson(this);

  static DateTime _dateTimeFromJson(String json) => DateTime.parse(json);
  static String _dateTimeToJson(DateTime dateTime) => dateTime.toIso8601String();
}

@JsonSerializable()
class Location {
  final String name;
  final String url;

  Location({required this.name, required this.url});

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

enum Gender {
  @JsonValue('Female')
  female,
  @JsonValue('Male')
  male,
  @JsonValue('Genderless')
  genderless,
  unknown,
}

enum Species {
  @JsonValue('Alien')
  alien,
  @JsonValue('Human')
  human,
  @JsonValue('Humanoid')
  humanoid,
  @JsonValue('Poopybutthole')
  poopybutthole,
  @JsonValue('Mythological Creature')
  mythologicalCreature,
  @JsonValue('Animal')
  animal,
  @JsonValue('Robot')
  robot,
  @JsonValue('Cronenberg')
  cronenberg,
  @JsonValue('Disease')
  disease,
  unknown,
}

enum Status {
  @JsonValue('Alive')
  alive,
  @JsonValue('Dead')
  dead,
  unknown,
}
