import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/common/app_colors/app_colors.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          SizedBox(height: 170.h,),
          Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: WidgetCircularAnimator(
                  size: 250.w,
                  innerIconsSize: 3,
                  outerIconsSize: 3,
                  innerAnimation: Curves.easeInOutBack,
                  outerAnimation: Curves.easeInOutBack,
                  innerColor: Colors.deepPurple,
                  outerColor: Colors.orangeAccent,
                  innerAnimationSeconds: 10,
                  outerAnimationSeconds: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey[200]),
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.deepOrange[200],
                      size: 60,
                    ),
                  ),
                )
              )
          ),
          SizedBox(
            height: 40.h,
          ),
          Column(
            children: [
              Text(
                '',
                textAlign: TextAlign.center,
                softWrap: true,
                style: GoogleFonts.roboto(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kWhiteColor,
                    letterSpacing: 0.01,
                    wordSpacing: 0.1
                ),
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  '',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: GoogleFonts.roboto(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kWhiteColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
