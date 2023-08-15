import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/common/widgets/pick_assets_tile.dart';
import 'package:task_management/common/widgets/custom_textfields.dart';
import 'package:task_management/common/widgets/reusable_text.dart';
import 'package:task_management/data_page/db_helper_page/db_helper.dart';
import '../../common/app_colors/app_colors.dart';
import '../../common/app_const/app_constant.dart';
import '../../common/widgets/custoom_button.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController todoTitleController = TextEditingController();
  final TextEditingController todosController = TextEditingController();
  final TextEditingController todoDateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _todoLists = [];
    bool isLoading = true;
    void refreshTodo() async{
      final data = await DBHelper.getTodos();
      setState(() {
        _todoLists = data;
        isLoading = false;
      });
    }

    @override
    void initState() {
      super.initState();
      refreshTodo();
    }

    Future<void> _addTodoItem() async {
      await DBHelper.createTodoItem(
          todoTitleController.text,
          todosController.text,
          todoDateController.text,
          startTimeController.text,
          endTimeController.text
      );
      refreshTodo();
    }

    return Scaffold(
        backgroundColor: AppColors.kBGC,
        appBar: AppBar(
            automaticallyImplyLeading: true
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          children: [
            SizedBox(height: 10.h,),

            ReusableText(
              text: 'New Todo',
              style: appStyle(24, FontWeight.bold, AppColors.kBlackColor),
            ),

            SizedBox(height: 10.h,),

            //Content TextField Section.........................................
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: ReusableText(
                text: 'to-dos',
                style: appStyle(12, FontWeight.normal, AppColors.kBlackColor),
              ),
            ),
            SizedBox(height: 5.h,),
            ReusableTextField(
              w: 300.w,
              h: 120.h,
              controller: todosController,
              hintText: 'Add a todo item...',
              hintStyle: appStyle(14, FontWeight.w300, AppColors.kBlackColor),
              obscureText: false,
              autocorrect: false,
              expands: false,
              minLines: 15,
              maxLines: 20,
              keyboardType: TextInputType.multiline,
              style: appStyle(14, FontWeight.normal, AppColors.kBlackColor),
            ),

            SizedBox(height: 20.h,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: ReusableText(
                text: 'Date',
                style: appStyle(12, FontWeight.normal, AppColors.kBlackColor),
              ),
            ),
            SizedBox(height: 5.h,),
            ReusableTextField(
              w: 300.w,
              h: 50.h,
              controller: todoDateController,
              onChanged: (value) {

              },
              hintText: '6:24 PM',
              hintStyle: appStyle(14, FontWeight.w300, AppColors.kBlackColor),
              obscureText: false,
              autocorrect: false,
              expands: false,
              keyboardType: TextInputType.text,
              style: appStyle(16, FontWeight.normal, AppColors.kBlackColor),
              minLines: 1,
              maxLines: 1,
            ),

            SizedBox(height: 20.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableTextField(
                  w: 160.w,
                  h: 50.h,
                  controller: startTimeController,
                  onChanged: (value) {

                  },
                  hintText: 'Start Time',
                  hintStyle: appStyle(14, FontWeight.w300, AppColors.kBlackColor),
                  obscureText: false,
                  autocorrect: false,
                  expands: false,
                  keyboardType: TextInputType.text,
                  style: appStyle(16, FontWeight.normal, AppColors.kBlackColor),
                  minLines: 1,
                  maxLines: 1,
                ),

                ReusableTextField(
                  w: 160.w,
                  h: 50.h,
                  controller: endTimeController,
                  onChanged: (value) {

                  },
                  hintText: 'End Time',
                  hintStyle: appStyle(14, FontWeight.w300, AppColors.kBlackColor),
                  obscureText: false,
                  autocorrect: false,
                  expands: false,
                  keyboardType: TextInputType.text,
                  style: appStyle(16, FontWeight.normal, AppColors.kBlackColor),
                  minLines: 1,
                  maxLines: 1,
                ),
              ],
            ),

            SizedBox(height: 30.h,),

            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                  color: AppColors.kPAC.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(AppConst.kR)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  //Pick Image
                  PickAltAssets(
                    onSelect: () {

                    },
                    icon: Icons.photo_camera_outlined,
                    text: 'Albums',

                  ),
                  //Pick Record Audio
                  PickAltAssets(
                    onSelect: () {

                    },
                    icon: Icons.photo_camera_outlined,
                    text: 'Audio',

                  ),
                  //Set Reminder
                  PickAltAssets(
                    onSelect: () {

                    },
                    icon: Icons.photo_camera_outlined,
                    text: 'Reminder',

                  ),
                ],
              ),
            ),

            SizedBox(height: 160.h,),

            ReusableButton(
              w: 360.w,
              h: 55.h,
              onTap: () {
                setState(() {
                  _addTodoItem();
                });
                Navigator.pop(context);
              },
              text: 'Save Todo',
              kR: AppConst.kR,
              color: AppColors.kPC,
              style: appStyle(18, FontWeight.w400, AppColors.kWhiteColor),
            ),
          ],
        )
    );
  }
}
