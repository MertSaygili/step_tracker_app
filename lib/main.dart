import 'package:flutter/material.dart';
import 'package:step_tracker_app/app/init.dart';
import 'package:step_tracker_app/app/service/firebase/auth/auth_service.dart';
import 'package:step_tracker_app/app/service/firebase/auth/auth_service_impl.dart';

Future<void> main() async {
  await Init.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final AuthService service = AuthServiceImpl();
              await service.signUp(name: 'name', email: 'email123@gmail.com', password: 'password');
            },
            child: const Text('normal sign in'),
          ),
          ElevatedButton(
            onPressed: () async {
              final AuthService service = AuthServiceImpl();
              await service.googleSignIn();
            },
            child: const Text('google sign in'),
          ),
        ],
      ),
    );
  }
}
