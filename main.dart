import 'package:flutter/material.dart';

import 'screens/personList.dart';
import './screens/addPerson.dart';
import './screens/updatePerson.dart';

void main() => runApp(ObjectBoxApp());

class ObjectBoxApp extends StatefulWidget {
  @override
  _ObjectBoxAppState createState() => _ObjectBoxAppState();
}

class _ObjectBoxAppState extends State<ObjectBoxApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ObjectBox",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.amber,
      ),
      home: PersonList(),
      routes: {
        AddPerson.routeName: (ctx) => AddPerson(),
        UpdatePerson.routeName: (ctx) => UpdatePerson(),
      },
    );
  }
}
