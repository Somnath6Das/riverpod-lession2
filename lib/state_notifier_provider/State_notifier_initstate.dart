import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider =
    StateNotifierProvider.autoDispose<CounterNotifier, Counter>((ref) {
  return CounterNotifier();
});

class CounterNotifier extends StateNotifier<Counter> {
  CounterNotifier() : super(Counter(3, 5));



  void increment() {
    state = Counter(state.count + 1, state.count + 2);
  }

  void decrement() {
    state = Counter(state.count - 1, state.count - 2);
  }
}

class Counter {
  int count;
  int number;
  Counter(this.count, this.number);
}

class StateNotifierInitState extends ConsumerWidget {
  const StateNotifierInitState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('State Notifier init state')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Text(
              'counter: ${counter.count} ${counter.number}',
              style: const TextStyle(fontSize: 22),
            ),
            IconButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).decrement();
                },
                icon: const Icon(Icons.move_to_inbox_sharp)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.notifier).increment(),
        child: const Icon(Icons.medical_information_rounded),
      ),
    );
  }
}
