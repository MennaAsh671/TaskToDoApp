import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task2_todoapp/constants/colors.dart';
import 'package:task2_todoapp/providers/task_provider.dart';
import 'package:task2_todoapp/screens/home_page/widgets/my_app_bar.dart';
import 'package:task2_todoapp/screens/home_page/widgets/pinned_task.dart';
import 'package:task2_todoapp/screens/home_page/widgets/tasks_to_do.dart';

import '../../constants/assets.dart';
import '../../entities/tasks.dart';
import 'components/greetings_section.dart';
import 'components/your_tasks_comp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    tasks.addAll(Task.mockUpTasks);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, taskProvider, _) {
      final Task? pinnedTask = taskProvider.tasksList.cast<Task?>().firstWhere(
            (task) => task!.isPinned,
            orElse: () => null,
          );
      return Scaffold(
        appBar: MyAppBar(
          logo: Padding(
            padding: const EdgeInsets.fromLTRB(12, 3, 0, 3),
            child: SvgPicture.asset(
              AssetData.logo,
              width: 10,
              height: 50,
            ),
          ),
          appBarText: const Text(
            "ToDo",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.appBarTextColor,
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SvgPicture.asset(
              AssetData.settings,
              width: 10,
              height: 25,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const GreetingSection(),
              if (pinnedTask != null) PinnedTask(task: pinnedTask),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 15, 8),
                child: YourTasks(),
              ),
              TaskTodo(
                yourTask: taskProvider.tasksList,
              ),
            ],
          ),
        ),
      );
    });
  }
}
