import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/main.dart';
import 'package:riverpod_tutorial/post_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void onSubmit(WidgetRef ref, String value) {
    ref.read(nameProvider.notifier).update((state) => value);
  }

  void onSubmitUser(WidgetRef ref, String name) {
    ref.read(userProvider.notifier).updateName(name);
  }

  void onSubmitUserChangeNotifier(WidgetRef ref, String n) {
    ref.read(userChangeProvider).updateName(n);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final name = ref.watch(nameProvider) ?? '';
        final user = ref.watch(userProvider);
        final userChange = ref.watch(userChangeProvider);
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: Column(
                children: [
                  TextField(
                    onSubmitted: (value) => onSubmit(ref, value),
                  ),
                  Text(
                    '\n STATE PROVIDER SECTION \n $name',
                  ),
                  TextField(
                    onSubmitted: (value) => onSubmitUser(ref, value),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'THE STATE NOTIFIER \n ${user.name}.',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onSubmitted: (value) =>
                        onSubmitUserChangeNotifier(ref, value),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' \n THE CHANGE NOTIFIER SECTION \n  ${userChange.user.name}',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  IconButton(
                    onPressed: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const PostPage(),
                        ),
                      );
                    }),
                    icon: const Icon(Icons.arrow_right_alt),
                    color: const Color.fromARGB(255, 201, 133, 233),
                    iconSize: 50,
                  ),
                  const Text(
                    'Go To Post Page',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
