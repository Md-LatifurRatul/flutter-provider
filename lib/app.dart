import 'package:flutter/material.dart';
import 'package:flutter_provider/presentation/pages/product_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Provider',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(color: Colors.teal, centerTitle: true),
      ),
      debugShowCheckedModeBanner: false,
      home: const ProductHomePage(),
    );
  }
}
