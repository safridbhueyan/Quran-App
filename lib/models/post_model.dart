class postModel {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;

  postModel({
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.number,
    required this.revelationType,
  });

  factory postModel.fromJson(Map<String, dynamic> json) {
    return postModel(
        name: json['name'],
        englishName: json['englishName'],
        englishNameTranslation: json['englishNameTranslation'],
        number: json['number'],
        revelationType: json['revelationType']);
  }
}
