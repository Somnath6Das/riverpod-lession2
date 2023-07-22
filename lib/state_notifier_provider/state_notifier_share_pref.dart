import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


// some code need to be initialized in main function and provider scope function.
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier(ref.read);
});


class CounterNotifier extends StateNotifier<int> {
  CounterNotifier(this._read) : super(8) {
    _loadCounterFromSharedPreferences();
  }
  final dynamic _read;
  static const String _counterKey = 'counter';

  Future<void> _loadCounterFromSharedPreferences() async {
    final prefs = await _read(sharedPreferencesProvider);
    final counter = prefs.getInt(_counterKey) ?? 0;
    state = counter;
  }

  Future<void> _saveCounterToSharedPreferences() async {
  
    final prefs = await _read(sharedPreferencesProvider);
    prefs.setInt(_counterKey, state);
  }

  void incrementCounter() {
    state++;
    _saveCounterToSharedPreferences();
  }

  void resetCounter() {
    state = 8;
    _saveCounterToSharedPreferences();
  }
}



class StateNotifierSharePref extends ConsumerWidget {
  const StateNotifierSharePref({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('State Notifier Shared Preference')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'counter: with Riverpod and Shared Preference: $counter',
              style: const TextStyle(fontSize: 22),
            ),
            IconButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).resetCounter();
                },
                icon: const Icon(Icons.move_to_inbox_sharp)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.notifier).incrementCounter(),
        child: const Icon(Icons.medical_information_rounded),
      ),
    );
  }
}
