import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task2_todoapp/screens/create_task/widgets/task_input_field.dart';

import '../../../constants/assets.dart';

class ToDosList extends StatelessWidget {
  final List<TextEditingController> allControllersList;
  final void Function(int) onPressed;

  const ToDosList(
      {super.key, required this.onPressed, required this.allControllersList});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView.separated(
        shrinkWrap: true,
        itemCount: allControllersList.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskInputField(
            controller: allControllersList[index],
            hintText: 'ToDo ${index + 1}',
            prefix: SvgPicture.asset(AssetData.clipboard),
            suffix: (index == 0)
                ? null
                : IconButton(
                    onPressed: () => onPressed(index),
                    icon: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 10);
        },
      ),
      const SizedBox(height: 15),
    ]);
  }
}
