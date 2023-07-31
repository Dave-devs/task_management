import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/common/app_colors/app_colors.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          SizedBox(height: 70.h,),
          Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: WidgetCircularAnimator(
                    size: 280.w,
                    innerIconsSize: 3,
                    outerIconsSize: 3,
                    innerAnimation: Curves.easeInOutBack,
                    outerAnimation: Curves.easeInOutBack,
                    innerColor: AppColors.kPC,
                    outerColor: AppColors.kPAC,
                    innerAnimationSeconds: 10,
                    outerAnimationSeconds: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent
                      ),
                      child: Icon(
                        Icons.schedule_outlined,
                        color: AppColors.kPC,
                        size: 130,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Text(
                  'A convenient and productive task manager.',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: GoogleFonts.roboto(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.kBlackColor
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  'Create task with a single click of a button and set time for each task based on your schedule.',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: GoogleFonts.roboto(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.kBlackColor
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
