import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter();
});

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
              ))
        ],
      ),
      body: Center(
        child: Text(
          count.toString(),
          style: const TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increament();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increament() {
    state += 20;
    // state++;
  }
}
