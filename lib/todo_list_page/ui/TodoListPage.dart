import 'package:flutter/material.dart';
import 'package:task_management/common/app_colors/app_colors.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBGC,
      appBar: AppBar(),
    );
  }
}
