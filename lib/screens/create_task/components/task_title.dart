import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/assets.dart';
import '../widgets/task_input_field.dart';

class TaskTitle extends StatelessWidget {
  final TextEditingController titleController;

  const TaskTitle({super.key, required this.titleController});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Title",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      TaskInputField(
        controller: titleController,
        hintText: 'Task Title',
        prefix: SvgPicture.asset(
          AssetData.title,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Divider(
          thickness: 1,
          color: Colors.white,
        ),
      ),
    ]);
  }
}
