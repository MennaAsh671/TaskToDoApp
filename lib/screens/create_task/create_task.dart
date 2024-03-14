import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task2_todoapp/constants/colors.dart';
import 'package:task2_todoapp/providers/task_provider.dart';
import 'package:task2_todoapp/screens/create_task/widgets/to_dos_list.dart';

import '../../constants/assets.dart';
import '../../entities/tasks.dart';
import '../home_page/widgets/add_task_button.dart';
import '../home_page/widgets/my_app_bar.dart';
import 'components/task_title.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final TextEditingController _task1controller = TextEditingController();
  final List<TextEditingController> allControllersList = [
    TextEditingController()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        logo: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: (AppColors.appColor),
              elevation: 0.0,
              shadowColor: Colors.transparent,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.only(
                top: 3.0,
                bottom: 3,
                left: 2,
              ),
              child: Icon(Icons.arrow_back_ios_sharp),
            )),
        appBarText: const Text(
          "Create Task",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.appBarTextColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
            left: 12,
            right: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TaskTitle(
                titleController: _task1controller,
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 15.0, left: 12, right: 12, bottom: 2),
                child: Text(
                  "ToDos",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ToDosList(
                onPressed: (int index) {
                  setState(() {
                    allControllersList.removeAt(index);
                  });
                },
                allControllersList: allControllersList,
              ),
              Center(
                child: AddButton(
                  onPressed: () {
                    _generateTaskInputField();
                  },
                  buttonIcon: SvgPicture.asset(
                    AssetData.plus,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 85,
        width: 85,
        child: FittedBox(
          child: FloatingActionButton.large(
            backgroundColor: AppColors.buttonColor,
            onPressed: () {
              context.read<TaskProvider>().addTask(addTaskToList());
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 45,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }

  void _generateTaskInputField() {
    final TextEditingController controller = TextEditingController();
    setState(() {
      allControllersList.add(controller);
    });
  }

  Task addTaskToList() {
    List<TaskComponent> taskComponents = [
      for (final controller in allControllersList)
        TaskComponent(name: controller.text, isDone: false)
    ];
    return Task(title: _task1controller.text, components: taskComponents);
  }
}
