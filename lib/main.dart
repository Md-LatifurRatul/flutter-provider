import 'package:flutter/material.dart';
import 'package:flutter_provider/api/profile_api.dart';
import 'package:flutter_provider/app.dart';
import 'package:flutter_provider/presentation/providers/user_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserNotifier>(
          create: (_) => UserNotifier(),
        ),
        FutureProvider(
            create: (_) => getProfileUserName(),
            initialData: "Loading Name..."),
        StreamProvider(create: (_) => getSessionTime(), initialData: 0),
      ],
      child: const MyApp(),
    ),
  );
}
