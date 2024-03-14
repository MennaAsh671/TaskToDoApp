import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/assets.dart';
import '../../create_task/create_task.dart';
import '../widgets/add_task_button.dart';

class YourTasks extends StatelessWidget {
  const YourTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Text(
        "Your Tasks",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      AddButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateTask()),
          );
        },
        buttonIcon: SvgPicture.asset(AssetData.taskPlus),
      )
    ]);
  }
}
