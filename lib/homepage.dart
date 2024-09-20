// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:run_api/models/post_model.dart';
import 'package:run_api/services/api_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // List<dynamic> posts = [];
  List<postModel> posts = [];

  // Future fetchData() async {
  //   final url = Uri.parse('http://api.alquran.cloud/v1/quran/quran-uthmani');
  //   final response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     print("success");
  //   } else {
  //     print("failed");
  //   }
  //   // print(response.body.runtimeType);
  //   final jasonData = jsonDecode(response.body.toString());
  //   // print(jasonData['data'].length);

  //   final postList = jasonData["data"]['surahs'] as List;

  //   // print(postList.length);

  //   for (var post in postList) {
  //     posts.add(
  //       postModel.fromJson(post),
  //     );

  //     // posts.add(
  //     //   postModel(
  //     //       name: post['name'],
  //     //       englishName: post['englishName'],
  //     //       englishNameTranslation: post['englishNameTranslation'],
  //     //       number: post['number'],
  //     //       revelationType: post['revelationType']),
  //     // );
  //   }
  //   // posts = postList;
  //   // print(posts.length);
  // }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    final data = await ApiService.fetchData();

    setState(() {
      posts = data!;
    });

    print(data!.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 228, 201, 175),
        appBar: AppBar(
          title: const Text("Quran app"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (_, index) {
              final data = posts[index];
              return Card(
                child: ListTile(
                  title: Text(data.name),
                  subtitle: Text(data.englishName),
                ),
              );
            })
        //Text(posts.length.toString()),
        );
  }
}
