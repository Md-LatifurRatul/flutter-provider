import 'package:flutter/material.dart';
import 'package:flutter_provider/presentation/pages/task_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(color: Color(0xFF2F5233), centerTitle: true),
        primaryColor: Color(0xFF2F5233),
      ),
      debugShowCheckedModeBanner: false,
      home: const TaskHomePage(),
    );
  }
}
