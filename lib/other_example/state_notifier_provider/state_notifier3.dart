import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileProvider = StateNotifierProvider<ProfileStateNotifier, Profile>(
    (_) => ProfileStateNotifier(const Profile("", -1)));

class ProfileStateNotifier extends StateNotifier<Profile> {
  ProfileStateNotifier(Profile state) : super(state);
  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setAge(int age) {
    state = state.copyWith(age: age);
  }
}

class Profile {
  final String name;
  final int age;
  const Profile(this.name, this.age);
  Profile copyWith({name, age}) {
    return Profile(name ?? this.name, age ?? this.age);
  }
}

class StateNotifier3 extends ConsumerWidget {
  const StateNotifier3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Profile profile = ref.watch(profileProvider);
    final notifier = ref.watch(profileProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (profile.name.isNotEmpty)
              Text(
                profile.name,
                style: const TextStyle(fontSize: 24),
              ),
            const SizedBox(height: 4),
            if (profile.age >= 0)
              Text(
                '${profile.age}',
                style: const TextStyle(fontSize: 24),
              ),
            TextField(
              decoration: const InputDecoration(labelText: "Enter your name"),
              onChanged: (value) {
                notifier.setName(value);
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Enter your age"),
              onChanged: (value) {
                notifier.setAge(int.parse(value));
              },
            ),
          ],
        ),
      ),
    );
  }
}
