import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../entities/tasks.dart';
import '../components/popup_menu.dart';
import 'my_circular_progress_indicator.dart';

class TaskTodo extends StatelessWidget {
  final List<Task> yourTask;

  const TaskTodo({super.key, required this.yourTask});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: yourTask.length,
      itemBuilder: (BuildContext context, int index) {
        final task = yourTask[index];
        return Container(
          width: 360,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            color: AppColors.containerColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 14.0, top: 8.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      task.title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${task.components.length} tasks",
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.appBarTextColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyCircularProgressIndicator(
                      percent: task.progress,
                    ),
                    MyPopUpMenu(task: task),
                  ],
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 10);
      },
    );
  }
}
