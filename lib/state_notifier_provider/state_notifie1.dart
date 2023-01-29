import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider.autoDispose<Counter, int>((ref) {
  return Counter();
});

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  increment() {
    //  state = 20;
    state += 20;
    // state++;
  }
  decrement() {
    // state -= 20;
    state--;
  }
}

class StateNotifier1 extends ConsumerWidget {
  const StateNotifier1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'State Provider',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        actions: [
          IconButton(
              onPressed: () {
                // ref.invalidate(counterProvider);
                ref.refresh(counterProvider);
              },
              icon: Icon(
                Icons.refresh,
                color: Theme.of(context).colorScheme.primary,
              )),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              count.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            MaterialButton(
              onPressed: () {
                ref.read(counterProvider.notifier).decrement();
              },
              color: Theme.of(context).colorScheme.primary,
              child: const Icon(Icons.minimize),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
