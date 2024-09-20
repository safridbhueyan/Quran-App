import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:run_api/models/postDetailsModel.dart';
import 'package:run_api/services/api_service.dart';

class Ayatpage extends StatelessWidget {
  final String ayatNum;
  const Ayatpage({
    super.key,
    required this.ayatNum,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.surface, //Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          ayatNum,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
          future: ApiService.getSingleAyat(ayatNum),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var data = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        data.text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.builder(
                        itemCount: data.ayahs.length,
                        itemBuilder: (context, index) {
                          var ayah = data.ayahs[index];
                          return ListTile(
                            title: Center(
                              child: Text(
                                ayah.number.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              ayah.text1,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }
}
