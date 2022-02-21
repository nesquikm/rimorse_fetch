import 'dart:convert';
import 'dart:io';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';

var characterService = CharacterService();
var episodeService = EpisodeService();
var locationService = LocationService();

Future<void> fetchCharacters() async {
  print('Fetching characters');
  List<Character> characters = await characterService.getAllCharacters();
  List<Map<String, Object>> characterEntities = characters
      .map((Character character) => {
            'value': character.name,
            'synonyms': [character.name]
          })
      .toList();
  File('characters.json').writeAsStringSync(jsonEncode(characterEntities));

  print('Fetching characters done');
}

Future<void> fetchEpisodes() async {
  print('Fetching episodes');
  List<Episode> episodes = await episodeService.getAllEpisodes();
  List<Map<String, Object>> episodeEntities = episodes
      .map((Episode episode) => {
            'value': episode.name,
            'synonyms': [episode.name, episode.episode]
          })
      .toList();
  File('episodes.json').writeAsStringSync(jsonEncode(episodeEntities));

  print('Fetching episodes done');
}

Future<void> fetchLocations() async {
  print('Fetching locations');
  List<Location> locations = await locationService.getAllLocations();
  List<Map<String, Object>> locationEntities = locations
      .map((Location location) => {
            'value': location.name,
            'synonyms': [location.name]
          })
      .toList();
  File('locations.json').writeAsStringSync(jsonEncode(locationEntities));

  print('Fetching locations done');
}

void fetch() async {
  await fetchCharacters();
  await fetchEpisodes();
  await fetchLocations();
  print('fetched');
}
