import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/common/widgets/reusable_text.dart';
import '../../common/app_colors/app_colors.dart';

Widget statusWidget({
  Color? bgColor,
  required Color innerColor,
  required IconData icon,
  required String text,
  required Color textColor,
  void Function()? onStatusTap
}) {
  return GestureDetector(
    onTap: onStatusTap,
    child: Container(
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(10.w))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              color: innerColor,
              shape: BoxShape.circle
            ),
            child: Icon(
              icon,
              size: 18,
              color: AppColors.kWhiteColor,
            ),
          ),
          ReusableText(
            text: text,
            style: appStyle(12, FontWeight.w400, textColor),
          )
        ],
      ),
    ),
  );
}