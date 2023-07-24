import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_lesson2/one_state_whole_app/counter_state.dart';

class PageTwo extends ConsumerWidget {
  const PageTwo({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Page: 2'),
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
          child: const Icon(Icons.plus_one), onPressed: () {
            ref.read(counterProviderApp.notifier).state++;
          }),
    );
  }
}
