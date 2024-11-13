import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class User {
  final String name;
  final int age;
  const User({required this.name, required this.age});
}

// to work with complex data types such as the user model
// StateNotifier and StateNotifierProvider will be used

// ------ we create a class for that effect
class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);
}
