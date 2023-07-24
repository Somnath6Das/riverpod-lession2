import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_lesson2/other_example/future_provider/api_model.dart';
import 'package:riverpod_lesson2/other_example/future_provider/api_service.dart';

final apiProvider = Provider.autoDispose<ApiService>((ref) => ApiService());
final apiDataProvider = StreamProvider.autoDispose<List<ApiModel>>((ref) async* {
// Make the API call here and yield the results
  final response = await http
      .get(Uri.parse("https://somnath6das.github.io/api/future-provider.json"));
  if (response.statusCode == 200) {
    final List data = jsonDecode(response.body)['data']; 
    yield data.map((e) => ApiModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load data');
  }
});

class StreamProviderApiCall extends ConsumerWidget {
  const StreamProviderApiCall({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiData = ref.watch(apiDataProvider);
    return  Scaffold(
            appBar: AppBar(
              title: const Text('API Call with Riverpod'),
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
          }),);
  }
}
