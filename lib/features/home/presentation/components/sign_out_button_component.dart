import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/navigation.dart';
import '../../../../core/helpers/token_secure_storage_helper.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/constance.dart';
import '../../../../core/utils/styles/app_colors.dart';
import '../controllers/profile/profile_bloc.dart';
import '../../../register/presentation/screens/login_screen.dart';
import '../../../../generated/locale_keys.g.dart';

class SignOutButtonComponent extends StatelessWidget {
  const SignOutButtonComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0.w),
      height: 56.0.h,
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.deleteColor,
          ),
          borderRadius: BorderRadius.circular(5.0.r)),
      child: MaterialButton(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.backgroundColorDark
            : AppColors.backgroundColorLight,
        onPressed: () async {
          navigateAndFinish(context, LoginScreen());
          context.read<ProfileBloc>().add(
                SignOutEvent(
                  token: token!,
                ),
              );
          token = await TokenSecureStorageHelper.deleteSecureToken();
        },
        textColor: AppColors.deleteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.logout_outlined),
            AppSize.sizedBoxW5(context),
            Text(
              LocaleKeys.signOut.tr(),
              style: TextStyle(
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
