class Postdetailsmodel {
  final int number;
  final String name;
  final String text;
  final int numberInSurah;
  final List<Ayahs> ayahs;

  Postdetailsmodel({
    required this.number,
    required this.name,
    required this.numberInSurah,
    required this.text,
    required this.ayahs,
  });
  factory Postdetailsmodel.fromJson(Map<String, dynamic> json) {
    var ayahsList = json['ayahs'] as List;
    List<Ayahs> ayahs = ayahsList.map((i) => Ayahs.fromJson(i)).toList();

    return Postdetailsmodel(
      number: json['number'],
      numberInSurah: json['numberOfAyahs'],
      text: json['englishNameTranslation'],
      name: json['name'],
      ayahs: ayahs,
    );
  }
}

class Ayahs {
  final String text1;
  final int number;
  Ayahs({
    required this.text1,
    required this.number,
  });
  factory Ayahs.fromJson(Map<String, dynamic> json) {
    return Ayahs(text1: json['text'], number: json['number']);
  }
}
