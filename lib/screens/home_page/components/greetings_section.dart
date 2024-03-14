import 'package:flutter/material.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        backgroundImage:
            NetworkImage("https://avatar.iran.liara.run/public/20"),
        radius: 25,
      ),
      title: Text("Hello Menna,"),
      subtitle: Text("We wish you a productive Day!"),
    );
  }
}
