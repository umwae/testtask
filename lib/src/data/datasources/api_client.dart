import 'dart:convert';
import 'dart:typed_data' show Uint8List;
import 'package:http/http.dart' as http;
import 'package:testtask/src/core/exceptions/app_exception.dart';
import 'package:testtask/src/core/exceptions/app_exception_mapper.dart';
import 'package:testtask/src/data/models/characters.dart';

class ApiClient {
  static const _baseUrl = 'https://rickandmortyapi.com/api';

  Future<CharactersPageDTO> getCharactersPage({int page = 1}) async {
    try {
      final uri = Uri.parse('$_baseUrl/character?page=$page');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return CharactersPageDTO.fromJson(data);
      } else {
        throw NetworkException('Ответ сервера ${response.statusCode}');
      }
    } on Exception catch (e) {
      throw e.toAppException();
    }
  }

  Future<Uint8List?> getImageData(String url) async {
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        throw NetworkException('Ответ сервера ${response.statusCode}');
      }
    } on Exception catch (e) {
      throw e.toAppException();
    }
  }
}
