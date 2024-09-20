import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:run_api/models/postDetailsModel.dart';
import 'package:run_api/models/post_model.dart';

class ApiService {
  static Future<List<postModel>?> fetchData() async {
    final url = Uri.parse('http://api.alquran.cloud/v1/quran/quran-uthmani');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print("success");

      final jasonData = jsonDecode(response.body.toString());
      final postList = jasonData["data"]['surahs'] as List;
      return postList.map((postJson) => postModel.fromJson(postJson)).toList();
    } else {
      return null;
    }
  }

  static Future<Postdetailsmodel?> getSingleAyat(String ayatNum) async {
    final url =
        Uri.parse('http://api.alquran.cloud/v1/surah/$ayatNum/quran-uthmani');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);

      return Postdetailsmodel.fromJson(decode['data']);
    } else {
      print("Error is ${response.body}");
      return null;
    }
  }
}
