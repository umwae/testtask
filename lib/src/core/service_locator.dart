import 'package:testtask/src/data/datasources/database.dart';
import 'package:testtask/src/data/datasources/api_client.dart';
import 'package:testtask/src/data/repositories/characters_repository.dart';

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._();
  static ServiceLocator get instance => _instance;
  ServiceLocator._();

  late final DB database;
  late final CharactersRepository charactersRepository;
  late final ApiClient apiClient;

  void setup() {
    database = DB();
    apiClient = ApiClient();
    charactersRepository = CharactersRepository(database, apiClient);
  }
}
