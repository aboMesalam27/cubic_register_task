import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/styles.dart';
import 'widgets/cubic_image.dart';
import 'widgets/get_started_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            const Expanded(child: CubicImage()),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'ecure Your Tomorrow With Worx Onboarding Onboard your Customers in less than a minute',
                  style: TextStyles.font13GrayRegular.copyWith(
                    fontSize: 20.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: const Expanded(child: GetStartedButton()),
            )
          ],
        ),
      ),
    );
  }
}
