import 'package:flutter/material.dart';
import 'package:random_person_data/views/screens/info_page.dart';

void main() {
  runApp(
    const Random_Person(),
  );
}

class Random_Person extends StatefulWidget {
  const Random_Person({Key? key}) : super(key: key);

  @override
  State<Random_Person> createState() => _Random_PersonState();
}

class _Random_PersonState extends State<Random_Person> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Info(),
    );
  }
}
