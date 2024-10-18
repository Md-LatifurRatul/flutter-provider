import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderValueNotifierHome extends StatelessWidget {
  const ProviderValueNotifierHome({super.key});

  @override
  Widget build(BuildContext context) {
    // final counter = Provider.of<CounterProvider>(context, listen: false);
    final counter = Provider.of<ValueNotifier<int>>(context, listen: false);

    print('Build----1');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'RTL',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<ValueNotifier<int>>(
              builder: (_, counter, __) => Text(
                "${counter.value}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.value++,
        child: Icon(Icons.add),
      ),
    );
  }
}
