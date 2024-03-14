import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task2_todoapp/screens/home_page/widgets/pinned_task_components.dart';

import '../../../constants/assets.dart';
import '../../../constants/colors.dart';
import '../../../entities/tasks.dart';
import 'my_circular_progress_indicator.dart';

class PinnedTask extends StatelessWidget {
  final Task task;
  const PinnedTask({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        color: AppColors.containerColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Text(
                    task.title,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 4.0,
                    bottom: 3,
                    right: 18,
                    left: 12,
                  ),
                  child: SvgPicture.asset(
                    AssetData.pin,
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 0.25,
              color: Colors.white,
              indent: 16,
              endIndent: 100,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 3, 10, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var taskComponent in task.components) ...[
                        PinnedTaskComponents(taskComps: taskComponent),
                        const SizedBox(height: 5),
                      ]
                    ],
                  ),
                  MyCircularProgressIndicator(
                    percent: task.progress,
                    radius: 33.0,
                    fontSize: 18,
                    lineWidth: 6,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
