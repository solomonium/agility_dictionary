import 'package:dio/dio.dart';

class ApiSerice {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.dictionaryapi.dev/api/v2/entries/en/',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ));

  Future<Response> getWordMeaning(String word) async {
    try {
      final response = await dio.get(word);
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to load word: ${e.message}');
    }
  }
}
