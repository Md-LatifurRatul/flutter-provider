import 'package:flutter/material.dart';
import 'package:flutter_provider/api/profile_api.dart';
import 'package:flutter_provider/presentation/model/user.dart';
import 'package:flutter_provider/presentation/pages/user_list_page.dart';
import 'package:flutter_provider/presentation/providers/user_notifier.dart';
import 'package:flutter_provider/presentation/widgets/text_button_widget.dart';
import 'package:flutter_provider/presentation/widgets/text_input_form.dart';
import 'package:flutter_provider/presentation/widgets/user_list_view.dart';
import 'package:provider/provider.dart';

class TaskHomePage extends StatefulWidget {
  const TaskHomePage({super.key});

  @override
  State<TaskHomePage> createState() => _TaskHomePageState();
}

class _TaskHomePageState extends State<TaskHomePage> {
  late String _name;
  late String _city;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print('Task Home rebuilding----');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.watch<String>(),
          style: TextStyle(color: Colors.white),
        ),
        leading: Consumer<int>(
          builder: (_, value, __) => Center(
            child: Text(
              value.toString(),
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
        actions: [
          Center(
            child: Selector<UserNotifier, int>(
                builder: (_, age, __) => Text(
                      age.toString(),
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                selector: (_, notifier) => notifier.age),
          ),
        ],
      ),
      body: _buildTaskHome(),
    );
  }

  Widget _buildTaskHome() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureProvider(
              create: (_) => getCurrentTime().catchError(
                (error) {
                  return 'Error occured while fetching time';
                },
              ),
              initialData: 'Loading Time',
              child: Consumer<String>(
                builder: (_, timeString, __) => Text(
                  timeString,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextInputForm(
              labelText: 'Name',
              onSaved: (String? value) {
                _name = value!;
              },
            ),
            SizedBox(
              height: 16,
            ),
            TextInputForm(
              labelText: 'City',
              onSaved: (String? value) {
                _city = value!;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButtonWidget(
                  text: 'Add',
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    _formKey.currentState?.save();

                    context.read<UserNotifier>().addUser(
                          User(_name, _city),
                        );
                  },
                ),
                SizedBox(
                  width: 8,
                ),
                TextButtonWidget(
                  text: 'List',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserListPage(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 8,
                ),
                TextButtonWidget(
                  text: 'Age',
                  onPressed: () {
                    context.read<UserNotifier>().incrementAge();
                  },
                ),
                SizedBox(
                  width: 8,
                ),
                TextButtonWidget(
                  text: 'Height',
                  onPressed: () {
                    context.read<UserNotifier>().incrementHeight();
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            UserListView(),
          ],
        ),
      ),
    );
  }
}
