// To parse this JSON data, do
//
//     final wordModel = wordModelFromJson(jsonString);

import 'dart:convert';

List<WordModel> wordModelFromJson(String str) =>
    List<WordModel>.from(json.decode(str).map((x) => WordModel.fromJson(x)));

String wordModelToJson(List<WordModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WordModel {
  String? word;
  String? phonetic;
  List<Phonetic>? phonetics;
  String? origin;
  List<Meaning>? meanings;

  WordModel({
    this.word,
    this.phonetic,
    this.phonetics,
    this.origin,
    this.meanings,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) => WordModel(
        word: json["word"],
        phonetic: json["phonetic"],
        phonetics: json["phonetics"] == null
            ? []
            : List<Phonetic>.from(
                json["phonetics"]!.map((x) => Phonetic.fromJson(x))),
        origin: json["origin"],
        meanings: json["meanings"] == null
            ? []
            : List<Meaning>.from(
                json["meanings"]!.map((x) => Meaning.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "phonetic": phonetic,
        "phonetics": phonetics == null
            ? []
            : List<dynamic>.from(phonetics!.map((x) => x.toJson())),
        "origin": origin,
        "meanings": meanings == null
            ? []
            : List<dynamic>.from(meanings!.map((x) => x.toJson())),
      };
}

class Meaning {
  String? partOfSpeech;
  List<Definition>? definitions;

  Meaning({
    this.partOfSpeech,
    this.definitions,
  });

  factory Meaning.fromJson(Map<String, dynamic> json) => Meaning(
        partOfSpeech: json["partOfSpeech"],
        definitions: json["definitions"] == null
            ? []
            : List<Definition>.from(
                json["definitions"]!.map((x) => Definition.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "partOfSpeech": partOfSpeech,
        "definitions": definitions == null
            ? []
            : List<dynamic>.from(definitions!.map((x) => x.toJson())),
      };
}

class Definition {
  String? definition;
  String? example;
  List<dynamic>? synonyms;
  List<dynamic>? antonyms;

  Definition({
    this.definition,
    this.example,
    this.synonyms,
    this.antonyms,
  });

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
        definition: json["definition"],
        example: json["example"],
        synonyms: json["synonyms"] == null
            ? []
            : List<dynamic>.from(json["synonyms"]!.map((x) => x)),
        antonyms: json["antonyms"] == null
            ? []
            : List<dynamic>.from(json["antonyms"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "definition": definition,
        "example": example,
        "synonyms":
            synonyms == null ? [] : List<dynamic>.from(synonyms!.map((x) => x)),
        "antonyms":
            antonyms == null ? [] : List<dynamic>.from(antonyms!.map((x) => x)),
      };
}

class Phonetic {
  String? text;
  String? audio;

  Phonetic({
    this.text,
    this.audio,
  });

  factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
        text: json["text"],
        audio: json["audio"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "audio": audio,
      };
}
