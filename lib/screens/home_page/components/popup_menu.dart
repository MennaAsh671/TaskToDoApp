import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../entities/tasks.dart';
import '../../../providers/task_provider.dart';

enum SampleItem {
  pin,
  delete,
}

class MyPopUpMenu extends StatefulWidget {
  final Task task;
  const MyPopUpMenu({super.key, required this.task});

  @override
  State<MyPopUpMenu> createState() => _MyPopUpMenuState();
}

class _MyPopUpMenuState extends State<MyPopUpMenu> {
  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, taskProvider, _) {
      return PopupMenuButton<SampleItem>(
        initialValue: selectedItem,
        iconSize: 22,
        onSelected: (SampleItem item) {
          setState(() {
            selectedItem = item;
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
          PopupMenuItem<SampleItem>(
            onTap: () {
              taskProvider.pinTask(widget.task);
            },
            value: SampleItem.pin,
            child: const Text('Pin'),
          ),
          PopupMenuItem<SampleItem>(
            onTap: () {
              taskProvider.removeTask(widget.task);
            },
            value: SampleItem.delete,
            child: const Text('Delete'),
          ),
        ],
      );
    });
  }
}
