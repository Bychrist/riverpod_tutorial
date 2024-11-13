import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void onSubmit(WidgetRef ref, String value) {
    ref.read(nameProvider.notifier).update((state) => value);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final name = ref.watch(nameProvider) ?? '';
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                TextField(
                  onSubmitted: (value) => onSubmit(ref, value),
                ),
                Text(
                  name,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
