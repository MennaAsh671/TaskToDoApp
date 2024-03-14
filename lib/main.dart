import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2_todoapp/providers/task_provider.dart';
import 'package:task2_todoapp/screens/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TaskProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: const Color(0xFF121212),
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
