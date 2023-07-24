import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider2 = StateNotifierProvider((ref) => Counter(0));

class Counter extends StateNotifier<int> {
  Counter(super.state);
  void increment() {
    state++;
  }

  void decrement() {
   if(state > 0) state--;
  }
}

class StateNotifier2 extends ConsumerWidget {
  const StateNotifier2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ref.watch(counterProvider2).toString(),
              style: const TextStyle(fontSize: 35),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: () {
                ref.read(counterProvider2.notifier).increment();
              },
              child: const Icon(Icons.plus_one)),
          const SizedBox(
            height: 25,
          ),
          FloatingActionButton(
              onPressed: () {
                ref.read(counterProvider2.notifier).decrement();
              },
              child: const Icon(Icons.exposure_minus_1_rounded)),
        ],
      ),
    );
  }
}
