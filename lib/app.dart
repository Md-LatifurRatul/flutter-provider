import 'package:flutter/material.dart';
import 'package:flutter_provider/presentation/pages/main_bottom_nav_bar.dart';
import 'package:flutter_provider/presentation/providers/navbar_provider.dart';
import 'package:flutter_provider/presentation/providers/user_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavbarProvider>(
          create: (context) => NavbarProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.teal, centerTitle: true),
        ),
        debugShowCheckedModeBanner: false,
        home: const MainBottomNavBar(),
      ),
    );
  }
}





/// provider home, provider value notifier, counter provider

// import 'package:flutter/material.dart';
// import 'package:flutter_provider/presentation/pages/home_page.dart';
// import 'package:flutter_provider/presentation/pages/provider_home.dart';
// import 'package:flutter_provider/presentation/pages/provider_value_notifier_home.dart';
// import 'package:flutter_provider/presentation/providers/counter_provider.dart';
// import 'package:provider/provider.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         appBarTheme: AppBarTheme(color: Colors.teal, centerTitle: true),
//       ),
//       debugShowCheckedModeBanner: false,
//       home: ChangeNotifierProvider<CounterProvider>(
//         create: (context) => CounterProvider(),
//         child: const ProviderHome(),
//       ),
      // home: ChangeNotifierProvider<ValueNotifier<int>>(
      //   create: (context) => ValueNotifier<int>(0),
      //   child: const ProviderValueNotifierHome(),
      // ),
//     );
//   }
// }
