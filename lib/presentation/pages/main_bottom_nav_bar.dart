import 'package:flutter/material.dart';
import 'package:flutter_provider/presentation/pages/home_page.dart';
import 'package:flutter_provider/presentation/pages/settings_page.dart';
import 'package:flutter_provider/presentation/providers/navbar_provider.dart';
import 'package:provider/provider.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  List<Widget> _pages = [
    const HomePage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    print('Navbar build---');

    return Scaffold(
      body: Consumer<NavbarProvider>(
          builder: (_, counter, child) => _pages[counter.selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        onTap: (index) {
          final navController =
              Provider.of<NavbarProvider>(context, listen: false);
          navController.onItemTapped(index);
        },
        currentIndex: context.watch<NavbarProvider>().selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),
    );
  }
}
