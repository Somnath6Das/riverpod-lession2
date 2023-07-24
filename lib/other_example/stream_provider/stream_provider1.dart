import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider.autoDispose<int>((ref) {
  return Stream.periodic(const Duration(seconds: 2), ((count) => count));
});

class StreamProvider1 extends ConsumerWidget {
  const StreamProvider1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stream Provider',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        backgroundColor: Colors.white,
      ),
      body: streamData.when(
          data: ((data) => Center(
                child: Text(
                  data.toString(),
                  style: const TextStyle(fontSize: 25),
                ),
              )),
          error: ((error, stackTrace) => Text(error.toString())),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
