import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../add_edit_todo_page/ui/add_edit_todo_page.dart';
import '../../common/app_colors/app_colors.dart';
import '../../common/app_const/app_constant.dart';
import '../../common/widgets/reusable_text.dart';

class SearchTodoItemTile extends StatelessWidget {
  final IconData? icon1;
  final String text;
  final String time;
  final void Function()? onPressed;
  final Color? itemColor;
  const SearchTodoItemTile({
    super.key,
    this.icon1,
    required this.text,
    required this.time,
    this.onPressed,
    this.itemColor});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddEditTodoPage())
            );
          },
          child: Container(
            width: 300.w,
            height: 65.h,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(AppConst.kR)),
                border: Border.all(color: Colors.grey)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          color: itemColor,
                          borderRadius: BorderRadius.all(Radius.circular(50.w))
                      ),
                      child: Icon(icon1, size: 18, color: AppColors.kWhiteColor,),
                    ),

                    SizedBox(width: 15.w,),

                    Text(
                      text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: appStyle(14, FontWeight.w500, AppColors.kBlackColor),
                    ),
                  ],
                ),
                ReusableText(
                  text: time,
                  style: appStyle(12, FontWeight.w500, AppColors.kBlackColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}