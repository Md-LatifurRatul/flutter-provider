import 'package:flutter/material.dart';
import 'package:flutter_provider/presentation/providers/user_notifier.dart';
import 'package:provider/provider.dart';

class UserListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('User list rebuilt');
    final userNotifier = context.watch<UserNotifier>();
    return ListView.builder(
      itemCount: userNotifier.userList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final user = userNotifier.userList[index];
        return Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${user.name}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'City: ${user.city}',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                IconButton(
                  onPressed: () =>
                      context.read<UserNotifier>().deleteUser(index),
                  icon: Icon(Icons.delete),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
