// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersPageDTO _$CharactersPageDTOFromJson(Map<String, dynamic> json) =>
    CharactersPageDTO(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => CharacterDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharactersPageDTOToJson(CharactersPageDTO instance) =>
    <String, dynamic>{'info': instance.info, 'results': instance.results};

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
  count: (json['count'] as num).toInt(),
  pages: (json['pages'] as num).toInt(),
  next: json['next'] as String?,
  prev: json['prev'],
);

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
  'count': instance.count,
  'pages': instance.pages,
  'next': instance.next,
  'prev': instance.prev,
};

CharacterDTO _$CharacterDTOFromJson(Map<String, dynamic> json) => CharacterDTO(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  status: $enumDecode(_$StatusEnumMap, json['status']),
  species: $enumDecode(_$SpeciesEnumMap, json['species']),
  type: json['type'] as String,
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  origin: Location.fromJson(json['origin'] as Map<String, dynamic>),
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
  image: json['image'] as String,
  episode: (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
  url: json['url'] as String,
  created: CharacterDTO._dateTimeFromJson(json['created'] as String),
);

Map<String, dynamic> _$CharacterDTOToJson(CharacterDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': _$StatusEnumMap[instance.status]!,
      'species': _$SpeciesEnumMap[instance.species]!,
      'type': instance.type,
      'gender': _$GenderEnumMap[instance.gender]!,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
      'created': CharacterDTO._dateTimeToJson(instance.created),
    };

const _$StatusEnumMap = {
  Status.alive: 'Alive',
  Status.dead: 'Dead',
  Status.unknown: 'unknown',
};

const _$SpeciesEnumMap = {
  Species.alien: 'Alien',
  Species.human: 'Human',
  Species.humanoid: 'Humanoid',
  Species.poopybutthole: 'Poopybutthole',
  Species.mythologicalCreature: 'Mythological Creature',
  Species.animal: 'Animal',
  Species.robot: 'Robot',
  Species.cronenberg: 'Cronenberg',
  Species.disease: 'Disease',
  Species.unknown: 'unknown',
};

const _$GenderEnumMap = {
  Gender.female: 'Female',
  Gender.male: 'Male',
  Gender.genderless: 'Genderless',
  Gender.unknown: 'unknown',
};

Location _$LocationFromJson(Map<String, dynamic> json) =>
    Location(name: json['name'] as String, url: json['url'] as String);

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
  'name': instance.name,
  'url': instance.url,
};
