import 'package:flutter/material.dart';
import 'package:named_routes/screens/edit.dart';
import 'package:named_routes/screens/preview.dart';

class NamedRoutesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes',
      theme: ThemeData(
        primaryColor: Color(0xffa2231d),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ProfilePreview(),
        '/edit': (context) => EditProfile(),
      },
    );
  }
}
