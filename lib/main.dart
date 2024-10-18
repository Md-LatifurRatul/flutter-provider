import 'package:flutter/material.dart';
import 'package:flutter_provider/app.dart';
import 'package:flutter_provider/presentation/providers/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}
