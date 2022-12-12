import 'package:dropdown_app/core/view/home_page.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

void main() => runApp(const DropdownButtonApp());

class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});
  static const String _title = "Flutter Code Sample";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
          primarySwatch: Colors.orange, //uygulamanın baskın tema rengi
          textTheme: TextTheme(
              headline6: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black12,
                  fontWeight: FontWeight.w300))),
      home: const HomePage(),
    );
  }
}
