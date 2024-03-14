import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../entities/tasks.dart';

class PinnedTaskComponents extends StatelessWidget {
  final TaskComponent taskComps;

  const PinnedTaskComponents({super.key, required this.taskComps});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        (taskComps.isDone == true)
            ? Icons.check_circle_outline
            : Icons.circle_outlined,
        color: (taskComps.isDone == true)
            ? AppColors.checkedTaskColor
            : AppColors.unCheckedTaskColor,
      ),
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          taskComps.name,
          style: TextStyle(
            color: (taskComps.isDone == true)
                ? AppColors.checkedTaskColor
                : AppColors.unCheckedTaskColor,
          ),
        ),
      )
    ]);
  }
}
