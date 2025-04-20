import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/app_text_styles.dart';
import '../utils/app_strings.dart';
import '../widgets/adaptive_circular_progress_indicator.dart';
import '../widgets/my_sized_box.dart';

extension StringExtension on String? {
  bool get isNullOrEmpty => this == null || this == '';
}

extension RequestFocusOnFocusNode on BuildContext {
  void requestFocus(FocusNode node) => FocusScope.of(this).requestFocus(node);
}

extension UnfocusKeyboard on BuildContext {
  void unfocusKeyboard() => FocusScope.of(this).unfocus();
}

enum CustomDialogStates { warning, success, error }

extension ShowCustomAnimatedDialog on BuildContext {
  String _dialogTitle(CustomDialogStates state) {
    String title;
    switch (state) {
      case CustomDialogStates.error:
        title = AppStrings.opps;
        break;
      case CustomDialogStates.warning:
        title = AppStrings.warning;
        break;

      case CustomDialogStates.success:
        title = AppStrings.success;
        break;
    }
    return title;
  }

  void showAnimatedDialog({
    required CustomDialogStates state,
    required String message,
    VoidCallback? onAction,
    String actionText = 'Done',
    bool barrierDismissible = true,
  }) {
    showGeneralDialog(
      context: this,
      barrierDismissible: barrierDismissible,
      barrierLabel: '',
      pageBuilder: (context, _, __) => const SizedBox.shrink(),
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder:
          (context, animation1, animation2, widget) => Material(
            type: MaterialType.transparency,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation1),
              child: FadeTransition(
                opacity: Tween<double>(
                  begin: 0.5,
                  end: 1.0,
                ).animate(animation1),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(
                      right: 16.w,
                      left: 16.w,
                      top: 24.h,
                      bottom: 8.h,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(24.r)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          _dialogTitle(state),
                          style: AppTextStyles.font18Bold,
                        ),
                        MySizedBox.height8,
                        Flexible(
                          child: Text(
                            message,
                            style: AppTextStyles.font14Regular.copyWith(
                              color: AppColors.color242424,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        MySizedBox.height16,
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: onAction ?? () => context.pop(),
                            child: Text(
                              actionText,
                              style: AppTextStyles.font16SemiBold.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}

extension ShowLoadingDialog on BuildContext {
  void showLoadingDialog() {
    showAdaptiveDialog(
      context: this,
      barrierDismissible: false,
      builder: (_) => const _LoadingWidget(),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  // ignore: unused_element_parameter
  const _LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // height: 80.h,
        // width: 80.h,
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        child: const AdaptiveCircularProgressIndicator(
          strokeWidth: 5,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}

extension PopTopMostRoute on BuildContext {
  void popTop() => Navigator.of(this, rootNavigator: true).pop();
}
