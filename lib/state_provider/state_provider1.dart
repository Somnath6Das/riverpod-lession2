import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);

class StateProvider1 extends ConsumerWidget {
  const StateProvider1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    ref.listen(counterProvider, (previous, next) {
      if (next == 2 || next == 4 || next == 6) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('The value is $next')));
      }
    });
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
                ref.invalidate(counterProvider);
                // ref.refresh(counterProvider);
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
          // ref.read(counterProvider.notifier).state += 100 ;
          ref.read(counterProvider.notifier).state++;
          // ref.read(counterProvider.notifier).update((state) => state += 200);
          // ref.read(counterProvider.notifier).update((state) => state += 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
