import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/data/local/sharedhelper.dart';
import 'package:padilni/presentation/profile/controllers/profile_controller.dart';
import 'package:padilni/utils/colors.dart';

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch> {
  final _controller = ValueNotifier<bool>(false);
  bool ar = true;
  @override
  void initState() {
    _controller.value = Shared.getstring("lang") != 'ar';
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {});
      print("aaaaa");
    });
    print(_controller.value);
    _controller.addListener(() {
      setState(() {
        print(_controller.value);
        if (_controller.value) {
          // ar = false;
          Get.updateLocale(const Locale('en'));

          Shared.setstring("lang", "en");
          Get.find<ProfileController>().updateLanguage("en");
        } else {
          // ar = true;
          Get.updateLocale(const Locale('ar'));
          Shared.setstring("lang", "ar");
          Get.find<ProfileController>().updateLanguage("ar");
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_controller.value);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        width: 80.w,
        child: Row(
          children: [
            Text(
              "Ar",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 12.sp,
                    // color: AppColors.greyColor2,
                  ),
            ),
            SizedBox(width: 5.w),
            AdvancedSwitch(
              initialValue: _controller.value,
              controller: _controller,
              activeColor: AppColors.secondaryColor,
              inactiveColor: AppColors.secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              width: 35.w,
              height: 25.h,
              // enabled: _controller.value,
              disabledOpacity: 0.5,
            ),
            SizedBox(width: 5.w),
            Text(
              "En",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 12.sp,
                    // color: AppColors.primaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
