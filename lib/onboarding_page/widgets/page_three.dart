import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/common/app_colors/app_colors.dart';
import 'package:task_management/common/widgets/custoom_button.dart';
import 'package:task_management/login_page/ui/login_page.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

import '../../common/app_const/app_constant.dart';
import '../../common/widgets/reusable_text.dart';

class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          SizedBox(height: 60.h,),
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
                        Icons.done,
                        color: AppColors.kPC,
                        size: 130,
                      ),
                    ),
                  )
              )
          ),
          SizedBox(
            height: 35.h,
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

              SizedBox(height: 40.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ReusableButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage())
                    );
                  },
                  w: 330.w,
                  h: 55.h,
                  text: 'Start',
                  color: AppColors.kPC,
                  style: appStyle(18, FontWeight.w500, AppColors.kWhiteColor),
                  kR: AppConst.kR,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
