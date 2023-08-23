// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_gorouter/user.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  const ProfilePage({Key? key, required this.name}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("profile"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text('nama : ${widget.name}'),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  context.goNamed('edit_profile',
                      pathParameters: {'nama': widget.name},
                      extra: User(widget.name, 'dummy@gmail.com'));
                },
                child: const Text("edit profile"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
