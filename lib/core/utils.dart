
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marina_mobility/core/extensions.dart';
import 'package:marina_mobility/presentation/resources/app_strings.dart';
import 'package:marina_mobility/presentation/resources/app_values.dart';

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;
bool isTab(BuildContext context) => MediaQuery.of(context).size.width < 1300 && MediaQuery.of(context).size.width >= 650;

void hideKeyboard(){
  FocusManager.instance.primaryFocus?.unfocus();
}

_isCurrentDialogShowing(BuildContext context) => ModalRoute.of(context)?.isCurrent != true;

dismissDialog(BuildContext context){
  if(_isCurrentDialogShowing(context)){
    Navigator.of(context, rootNavigator: true).pop(true);
  }
}

Future<dynamic> displayErrorDialog({
  required BuildContext context,
  required String message,
  String? title
}) async {
  dismissDialog(context);
  if (!Platform.isIOS) {
    return showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(title.orEmpty().isEmpty ? AppStrings.error : title!),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text(AppStrings.ok),
            onPressed: () => {
              Navigator.pop(dialogContext),
            },
          ),
        ],
      ),
    );
  }

  return showCupertinoDialog(
    context: context,
    builder: (dialogContext) => CupertinoAlertDialog(
      title: Text(title.orEmpty().isEmpty ? AppStrings.error : title!),
      content: Text(message),
      actions: <Widget>[
        CupertinoDialogAction(
          child: const Text(AppStrings.ok),
          onPressed: () => {
            Navigator.pop(dialogContext),
          },
        ),
      ],
    ),
  );
}

showPopupLoading(BuildContext context, {String? message}) {
  showDialog(context: context,
      builder: (BuildContext context) =>
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.2),
            child: Center(
              child: Container(
                height: AppSize.s100.r,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(AppSize.s14.sp),
                    boxShadow: const [BoxShadow(color: Colors.black26)]
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Platform.isIOS ? CupertinoActivityIndicator(color: Colors.white, radius: AppSize.s16.h) : SizedBox(width: AppSize.s30.r, height: AppSize.s30.r, child: const CircularProgressIndicator(color: Colors.blue)),
                      AppSize.s10.verticalSpace,
                      DefaultTextStyle(style: const TextStyle(color: Colors.white),
                      child: Text(message ?? AppStrings.pleaseWait))
                    ],
                  ),
                ),
              ),
            ),
          ));
}