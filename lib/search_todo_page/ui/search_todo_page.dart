import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/common/app_colors/app_colors.dart';
import 'package:task_management/common/widgets/reusable_text.dart';
import '../../common/app_const/app_constant.dart';
import '../widgets/search_todo_item_tile.dart';

class SearchTodoPage extends StatefulWidget {
  const SearchTodoPage({super.key});

  @override
  State<SearchTodoPage> createState() => _SearchTodoPageState();
}

class _SearchTodoPageState extends State<SearchTodoPage> {
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBGC,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Container(
              width: 340.w,
              height: 40.h,
              padding: EdgeInsets.only(left: 10.w),
              decoration: BoxDecoration(
                  color: AppColors.kGreyC,
                  borderRadius: BorderRadius.all(Radius.circular(AppConst.kR))
              ),
              child: TextField(
                onChanged: (value) {

                },
                keyboardType: TextInputType.text,
                autocorrect: false,
                minLines: 1,
                showCursor: true,
                style: appStyle(14, FontWeight.w300, AppColors.kBlackColor),
                decoration: InputDecoration(
                    hintText: 'Search for todos...',
                    hintStyle: appStyle(14, FontWeight.w400, Colors.grey),
                    suffixIcon: const Icon(Icons.cancel_outlined, size: 20, color: Colors.grey,)
                ),
              )
          ),
        ),
        body: ListView(
          children: [
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ReusableText(
                text: 'Search Results',
                style: appStyle(20, FontWeight.bold, AppColors.kBlackColor),
              ),
            ),
            SizedBox(height: 10.h,),
            SearchTodoItemTile(
              onPressed: () {
                //Could implement navigate to add edit todo page
              },
              icon1: Icons.local_fire_department_outlined,
              itemColor: AppColors.kTodoC,
              text: 'Make a low-fi wireframe',
              time: '11:37 AM',
            ),
            SearchTodoItemTile(
              onPressed: () {
                //Could implement navigate to add edit todo page
              },
              icon1: Icons.local_fire_department_outlined,
              itemColor: AppColors.kTodoC,
              text: 'Make a high-fi wireframe',
              time: '11:37 AM',
            )
          ],
        )
    );
  }
}
