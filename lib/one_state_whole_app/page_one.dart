import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_lesson2/one_state_whole_app/counter_state.dart';

class PageOne extends ConsumerWidget {
  const PageOne({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('page: 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter value:${ref.watch(counterProviderApp)}'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back to FrontPage')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.plus_one),
          onPressed: () {
            // its same like   ).state++
            ref.read(counterProviderApp.notifier).state =
                ref.read(counterProviderApp.notifier).state + 1;
          }),
    );
  }
}
