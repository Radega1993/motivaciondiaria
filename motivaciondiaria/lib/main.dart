import 'dart:convert';
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/frase_model.dart';

Future<Frase> fetchFrase() async {
  final total = await http
      .get(Uri.parse('https://api-motivaciondiaria.paraanime.com/total'));
  if (total.statusCode == 200) {
    final total_rows = json.decode(total.body);
    var my_num_rows = total_rows.toString();
    final number = Random().nextInt(int.parse(my_num_rows)) + 1;
    final response = await http.get(Uri.parse(
        'https://api-motivaciondiaria.paraanime.com/frase/' +
            number.toString()));
    if (response.statusCode == 200) {
      return Frase.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load frase');
    }
  } else {
    throw Exception('Failed to load total');
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Frase> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchFrase();
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF000000);

    late Future<Frase> futureFrase;

    futureFrase = fetchFrase();

    return MaterialApp(
        title: 'MOTIVACIÓN DIARIA',
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          appBar: AppBar(
              title: Center(
            child: Text('MOTIVACIÓN DIARIA'),
          )),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FutureBuilder<Frase>(
                  future: futureFrase,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!.categoria,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
                SizedBox(height: 40),
                FutureBuilder<Frase>(
                  future: futureFrase,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!.frase,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
                SizedBox(height: 10),
                FutureBuilder<Frase>(
                  future: futureFrase,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        "- " + snapshot.data!.autor + " -",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
                SizedBox(height: 10),
                Image.asset(
                  'assets/logo.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ));
  }
}
