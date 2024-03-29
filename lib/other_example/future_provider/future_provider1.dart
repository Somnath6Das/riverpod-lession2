import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_lesson2/other_example/future_provider/api_model.dart';
import 'package:riverpod_lesson2/other_example/future_provider/api_service.dart';

final apiProvider = Provider.autoDispose<ApiService>((ref) => ApiService());

final userDataProvider = FutureProvider.autoDispose<List<ApiModel>>((ref) {
  return ref.read(apiProvider).getUsers();
});

class FutureProvider1 extends ConsumerWidget {
  const FutureProvider1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiData = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Future Provider',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        backgroundColor: Colors.white,
      ),
      body: apiData.when(
          data: (data) {
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: ListTile(
                        title: Text(
                          data[index].name,
                        ),
                        subtitle: Text(data[index].age.toString()),
                        leading: CircleAvatar(
                            child: Image.network(data[index].avatar)),
                      )),
                    ],
                  );
                });
          },
          error: ((error, stackTrace) => Center(
                child: Text(error.toString()),
              )),
          loading: () {
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
