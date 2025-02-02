import 'package:flutter/material.dart';
import 'package:hospital_app/Provider/Paddpatient2.dart';
import 'package:hospital_app/Provider/Paddpatient3.dart';
import 'package:hospital_app/Provider/Paddpatient4.dart';
import 'package:hospital_app/Provider/Paddpatient5.dart';
import 'package:hospital_app/Provider/Pquiz.dart';
import 'package:hospital_app/get_start.dart';
import 'package:hospital_app/patient_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Paddpatient2()),
        ChangeNotifierProvider(create: (_) => Paddpatient3()),
        ChangeNotifierProvider(create: (_) => QuizModel()),
        ChangeNotifierProvider(create: (_) => Paddpatient4()),
        ChangeNotifierProvider(create: (_) => Paddpatient5()),
        // Add other providers here
      ],
      child: MyApp(),
    ),
  );
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
