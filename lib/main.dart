import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/home_page.dart';
import 'package:riverpod_tutorial/posts.dart';
import 'package:riverpod_tutorial/user.dart';
import 'package:http/http.dart' as http;

final nameProvider = StateProvider<String?>((ref) => null);
final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(
    const User(name: '', age: 0),
  ),
);

final userChangeProvider =
    ChangeNotifierProvider((ref) => UserChangeNotifier());

final fetchPostProvider = FutureProvider((ref) {
  const url = 'https://jsonplaceholder.typicode.com/posts/1';
  return http.get(Uri.parse(url)).then((value) => Post.fromJson(value.body));
});

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
