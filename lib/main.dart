import 'package:flutter/material.dart';
import 'package:hospital_app/get_start.dart';
import 'package:hospital_app/patient_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => GetStart(),
        '/patientList': (context) => PatientListPage(),
      },
    );
  }
}
