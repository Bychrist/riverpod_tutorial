import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/home_page.dart';
import 'package:riverpod_tutorial/user.dart';

final nameProvider = StateProvider<String?>((ref) => null);
final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(
    const User(name: '', age: 0),
  ),
);

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Riverpod tutorial',
        home: HomePage(),
        debugShowCheckedModeBanner: false);
  }
}
