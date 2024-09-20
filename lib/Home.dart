import 'package:flutter/material.dart';
import 'package:run_api/ayatPage.dart';

import 'package:run_api/services/api_service.dart';
import 'package:run_api/utils/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: Text(
            "Quran app",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        drawer: const MyDrawer(),
        body: FutureBuilder(
            future: ApiService.fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blueGrey,
                  ),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) {
                    final data = snapshot.data![index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Ayatpage(
                              ayatNum: data.number.toString(),
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: Theme.of(context).colorScheme.tertiary,
                        child: ListTile(
                          title: Text(
                            data.name,
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          subtitle: Text(
                            data.englishName,
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }));
  }
}
