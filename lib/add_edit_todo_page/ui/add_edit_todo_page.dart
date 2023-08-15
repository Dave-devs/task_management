import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/common/widgets/custom_textfields.dart';
import 'package:task_management/common/widgets/reusable_text.dart';
import '../../common/app_colors/app_colors.dart';
import '../../common/app_const/app_constant.dart';
import '../../common/widgets/custoom_button.dart';
import '../../common/widgets/pick_assets_tile.dart';
import '../widgets/status_widget.dart';

class AddEditTodoPage extends StatefulWidget {
  const AddEditTodoPage({super.key});

  @override
  State<AddEditTodoPage> createState() => _AddEditTodoPageState();
}

class _AddEditTodoPageState extends State<AddEditTodoPage> {
  final TextEditingController _todoContent = TextEditingController();
  final TextEditingController _setTodoDate = TextEditingController();
  final TextEditingController _setStartTime = TextEditingController();
  final TextEditingController _setEndTime = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBGC,
      appBar: AppBar(
        automaticallyImplyLeading: true
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          SizedBox(height: 10.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReusableText(
                text: 'Edit Todo',
                style: appStyle(24, FontWeight.bold, AppColors.kBlackColor),
              ),
              IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(Icons.delete_outline))
            ],
          ),

          SizedBox(height: 10.h,),

          //Content TextField Section.........................................
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: ReusableText(
              text: 'To-dos',
              style: appStyle(12, FontWeight.normal, AppColors.kBlackColor),
            ),
          ),
          SizedBox(height: 5.h,),
          ReusableTextField(
            w: 300.w,
            h: 120.h,
            controller: _todoContent,
            onChanged: (value) {

            },
            hintText: 'Add your todos here...',
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
            controller: _setTodoDate,
            onChanged: (value) {

            },
            hintText: '15 September - 16 September',
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
                controller: _setStartTime,
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
                controller: _setEndTime,
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

          SizedBox(height: 20.h,),

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

          SizedBox(height: 20.h,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: ReusableText(
              text: 'Status',
              style: appStyle(12, FontWeight.normal, AppColors.kBlackColor),
            ),
          ),
          SizedBox(height: 8.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              statusWidget(
                  onStatusTap: () {

                  },
                  bgColor: AppColors.kPAC,
                  innerColor: AppColors.kNoteC,
                  icon: Icons.event_note_outlined,
                  text: 'Note',
                  textColor: AppColors.kNoteC

              ),
              statusWidget(
                  onStatusTap: () {

                  },
                  bgColor: Colors.transparent,
                  innerColor: AppColors.kIPC,
                  icon: Icons.event_note_outlined,
                  text: 'In-Progress',
                  textColor: AppColors.kIPC

              ),
              statusWidget(
                onStatusTap: () {

                },
                  bgColor: Colors.transparent,
                  innerColor: AppColors.kDC,
                  icon: Icons.event_note_outlined,
                  text: 'Completed',
                  textColor: AppColors.kDC,

              ),
            ],
          ),

          SizedBox(height: 60.h,),

          ReusableButton(
            w: 360.w,
            h: 55.h,
            onTap: () {

            },
            text: 'Save Changes',
            kR: AppConst.kR,
            color: AppColors.kPC,
            style: appStyle(18, FontWeight.w400, AppColors.kWhiteColor),
          ),
        ],
      )
    );
  }
}
