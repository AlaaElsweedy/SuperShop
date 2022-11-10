import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';

class ShowCircularLoading extends StatelessWidget {
  const ShowCircularLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: const Center(
        child: CircularProgressIndicator(
          backgroundColor: AppColors.backgroundProgressIndicatorColorDark,
        ),
      ),
    );
  }
}

class ShowLinearLoading extends StatelessWidget {
  const ShowLinearLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSize.paddingHorizontal10,
      child: LinearProgressIndicator(
        backgroundColor:
            Theme.of(context).progressIndicatorTheme.refreshBackgroundColor,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

class ShowBarLinearLoading extends StatelessWidget {
  const ShowBarLinearLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: LinearProgressIndicator(
            minHeight: 20.h,
            backgroundColor:
                Theme.of(context).progressIndicatorTheme.refreshBackgroundColor,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}

class ShowError extends StatelessWidget {
  final NetworkExceptions networkExceptions;

  const ShowError({
    super.key,
    required this.networkExceptions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: Text(NetworkExceptions.getErrorMessage(networkExceptions)),
      ),
    );
  }
}

showToastError(NetworkExceptions errorMessage) {
  return Fluttertoast.showToast(
    msg: NetworkExceptions.getErrorMessage(errorMessage),
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColors.toastErrorColor,
    textColor: AppColors.toastTextMessageColor,
    fontSize: 16.0.sp,
  );
}

showSuccessMessage(String message) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColors.toastSuccessColor,
    textColor: AppColors.toastTextMessageColor,
    fontSize: 16.0.sp,
  );
}
