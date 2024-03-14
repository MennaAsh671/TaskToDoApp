class Task {
  final String title;
  final List<TaskComponent> components;
  bool isPinned;
  late final double progress;

  Task({
    required this.title,
    required this.components,
    this.isPinned = false,
  }) {
    final doneComponents =
        components.where((component) => component.isDone).length;
    progress = doneComponents / components.length;
  }

  static List<Task> get mockUpTasks {
    return [
      Task(
        title: 'Study for finals',
        isPinned: false,
        components: [
          TaskComponent(name: 'Math', isDone: true),
          TaskComponent(name: 'Physics', isDone: false),
          TaskComponent(name: 'Chemistry', isDone: true),
          TaskComponent(name: 'Biology', isDone: false),
        ],
      ),
      Task(
        title: 'Work on project',
        components: [
          TaskComponent(name: 'Design', isDone: true),
          TaskComponent(name: 'Development', isDone: true),
          TaskComponent(name: 'Testing', isDone: false),
          TaskComponent(name: 'Deployment', isDone: false),
        ],
      ),
      Task(
        title: 'Go to the gym',
        components: [
          TaskComponent(name: 'Cardio', isDone: true),
          TaskComponent(name: 'Weights', isDone: true),
          TaskComponent(name: 'Stretching', isDone: true),
        ],
      ),
      Task(
        title: 'Prepare food',
        components: [
          TaskComponent(name: 'Breakfast', isDone: true),
          TaskComponent(name: 'Lunch', isDone: true),
          TaskComponent(name: 'Dinner', isDone: true),
        ],
      )
    ];
  }
}

class TaskComponent {
  final String name;
  final bool isDone;

  TaskComponent({
    required this.name,
    required this.isDone,
  });
}
