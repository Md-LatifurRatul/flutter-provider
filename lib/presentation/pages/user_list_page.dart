import 'package:flutter/material.dart';
import 'package:flutter_provider/presentation/widgets/user_list_view.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: UserListView(),
      ),
    );
  }
}
