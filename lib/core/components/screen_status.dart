import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supershop/core/error/network_exceptions.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';

showLoading() {
  return Container(
    color: AppColors.backgroundColorLight,
    child: const Center(
      child: CircularProgressIndicator(
        backgroundColor: AppColors.backgroundProgressIndicatorColorLight,
        color: AppColors.primaryColorLight,
      ),
    ),
  );
}

showError(NetworkExceptions errorMessage) {
  return Fluttertoast.showToast(
    msg: NetworkExceptions.getErrorMessage(errorMessage),
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColors.toastErrorColorLight,
    textColor: AppColors.toastTextMessageColorLight,
    fontSize: 16.0,
  );
}
