import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/common/app_colors/app_colors.dart';
import 'package:task_management/common/widgets/reusable_text.dart';
import 'package:task_management/note_list_page/ui/note_list_page.dart';
import 'package:task_management/profile_page/ui/profile_page.dart';
import '../../todo_list_page/ui/TodoListPage.dart';
import '../bloc/bottom_nav_bloc.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  final List<Widget> _pageList = [
    const NoteListPage(),
    const TodoListPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.kBGC,
          body: _pageList[state.pageIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.event_note_outlined),
                  activeIcon: Icon(Icons.event),
                  label: 'Notes'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.task_alt_outlined),
                  activeIcon: Icon(Icons.task_alt),
                  label: 'To-dos'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: 'Profile'
              )
            ],
            onTap: (index) {
              setState(() {
                state.pageIndex = index;
                context.read<BottomNavBloc>().add(OnNavEventButtonClick (index));
              });
            },
            currentIndex: state.pageIndex,
            backgroundColor: AppColors.kWhiteColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.kPC,
            unselectedItemColor: AppColors.kPAC,
            iconSize: 20.w,
            selectedLabelStyle: appStyle(12, FontWeight.w400, AppColors.kPC),
            unselectedLabelStyle: appStyle(12, FontWeight.w400, AppColors.kPAC),
            showSelectedLabels: true,
            showUnselectedLabels: true,
          ),
        );
      },
    );
  }
}
