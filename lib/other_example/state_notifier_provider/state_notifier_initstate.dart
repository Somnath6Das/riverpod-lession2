import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final counterProviderInit =
    StateNotifierProvider.autoDispose<CounterNotifier, Counter>((ref) {
  return CounterNotifier();
});

class CounterNotifier extends StateNotifier<Counter> {
  // integer 3 and String hello is the initial value of two value of veriable 
  CounterNotifier() : super(Counter(3, 'hello'));

  void increment() {
    state = Counter(state.count + 1, state.name = 'Som');
  }

  void decrement() {
    state = Counter(state.count - 1, state.name = 'Ok');
  }
}

class Counter {
  int count;
  String name;
  Counter(this.count, this.name);
}

class StateNotifierInitState extends ConsumerWidget {
  const StateNotifierInitState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProviderInit);
    return Scaffold(
      appBar: AppBar(title: const Text('State Notifier init state')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Text(
              
              'counter: with Riverpod ${counter.count} ${counter.name}',
              style: const TextStyle(fontSize: 22),
            ),
            IconButton(
                onPressed: () {
                  // to call whole method for change the value exists on that method
                  ref.read(counterProviderInit.notifier).decrement();
                },
                icon: const Icon(Icons.move_to_inbox_sharp)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProviderInit.notifier).increment(),
        child: const Icon(Icons.medical_information_rounded),
      ),
    );
  }
}
