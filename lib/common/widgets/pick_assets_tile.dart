import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/common/widgets/reusable_text.dart';
import '../app_colors/app_colors.dart';

class PickAltAssets extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onSelect;
  const PickAltAssets({super.key, required this.icon, required this.text, this.onSelect});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Column(
        children: [
          Icon(icon, color: AppColors.kPC,),
          ReusableText(text: text, style: appStyle(12, FontWeight.w300, AppColors.kPC),)
        ],
      ),
    );
  }
}
