import 'package:agility_flutter_form/api_service/api_service.dart';
import 'package:agility_flutter_form/model/word_model.dart';
import 'package:flutter/material.dart';

class DictionaryViewWordModel extends ChangeNotifier {
  final apiService = ApiSerice();
  WordModel? wordModel;
  bool isLoading = false;
  String errorMessage = '';
  void getWordMeaning(String word) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await apiService.getWordMeaning(word);
      if (response.statusCode == 200) {
        wordModel = WordModel.fromJson(response.data[0]);
        isLoading = false;
        notifyListeners();
      } else {
        errorMessage = 'Failed to load word';
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }
}
