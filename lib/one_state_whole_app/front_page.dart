import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_lesson2/one_state_whole_app/counter_state.dart';
import 'package:riverpod_lesson2/one_state_whole_app/page_one.dart';
import 'package:riverpod_lesson2/one_state_whole_app/page_two.dart';

// consumer widgets + StateProvider can maintain state a whole app.
class FrontPage extends ConsumerWidget {
  const FrontPage({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Front page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ref.watch(counterProviderApp).toString()),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => const PageOne()));
                },
                child: const Text('Go to screen 1')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => const PageTwo()));
                },
                child: const Text('Go to screen 2'))
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
