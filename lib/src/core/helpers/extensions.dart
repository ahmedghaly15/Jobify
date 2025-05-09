import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/job.dart';
import '../theming/app_colors.dart';
import '../theming/app_text_styles.dart';
import '../utils/app_assets.dart';
import '../utils/app_strings.dart';
import '../utils/enums.dart';
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
  void showAnimatedDialog({
    CustomDialogStates? state,
    String? message,
    VoidCallback? onAction,
    String actionText = 'Done',
    bool barrierDismissible = true,
    Widget? content,
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
                      color:
                          isDarkModeActive
                              ? AppColors.color1f283b
                              : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(24.r)),
                    ),
                    child:
                        content ??
                        _AnimatedDialogContent(
                          state: state,
                          message: message,
                          onAction: onAction,
                          actionText: actionText,
                        ),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}

class _AnimatedDialogContent extends StatelessWidget {
  const _AnimatedDialogContent({
    this.state,
    this.message,
    this.onAction,
    this.actionText,
  });

  final CustomDialogStates? state;
  final String? message;
  final VoidCallback? onAction;
  final String? actionText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(_dialogTitle(state!), style: AppTextStyles.font18Bold),
        if (message != null) ...[
          MySizedBox.height8,
          Flexible(
            child: Text(
              message!,
              style: AppTextStyles.font14Regular,
              textAlign: TextAlign.center,
            ),
          ),
        ],
        MySizedBox.height16,
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: onAction ?? () => context.popTop(),
            child: Text(
              actionText!,
              style: AppTextStyles.font16SemiBold.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

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

extension ShowAdaptiveDialog<T> on BuildContext {
  Future<T?> displayAdaptiveDialog({
    Widget Function(BuildContext)? builder,
    bool barrierDismissible = true,
    String? contentText,
    Widget? contentWidget,
    List<Widget>? actions,
    VoidCallback? yesOnPressed,
  }) {
    return showAdaptiveDialog<T?>(
      context: this,
      barrierDismissible: barrierDismissible,
      builder:
          builder ??
          (_) => AlertDialog.adaptive(
            backgroundColor:
                isDarkModeActive ? AppColors.color1f283b : Colors.white,
            icon: Image.asset(Assets.jobifyIcon, height: 40.h, width: 40.h),
            content: contentWidget ?? Text(contentText!),
            contentTextStyle: AppTextStyles.font16Regular,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            actions:
                actions ??
                [
                  TextButton(
                    onPressed: () => Navigator.of(this).pop(),
                    child: const Text(AppStrings.no),
                  ),
                  TextButton(
                    onPressed: yesOnPressed,
                    child: const Text(AppStrings.yes),
                  ),
                ],
          ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color:
              context.isDarkModeActive ? AppColors.color1f283b : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        child: const AdaptiveCircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}

extension PopTopMostRoute on BuildContext {
  void popTop() => Navigator.of(this, rootNavigator: true).pop();
}

extension SearchFilterExtension on SearchFilter {
  JobStatus? toJobStatus() {
    switch (this) {
      case SearchFilter.pending:
        return JobStatus.pending;
      case SearchFilter.interview:
        return JobStatus.interview;
      case SearchFilter.declined:
        return JobStatus.declined;
      case SearchFilter.all:
        return null;
    }
  }
}

extension StringCapitalization on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension EnumName on JobStatus {
  String get enumName {
    switch (this) {
      case JobStatus.pending:
        return AppStrings.pending;
      case JobStatus.interview:
        return AppStrings.interview;
      case JobStatus.declined:
        return AppStrings.declined;
    }
  }
}

extension EnumNameMode on JobMode {
  String get enumName {
    switch (this) {
      case JobMode.fullTime:
        return AppStrings.fullTime;
      case JobMode.partTime:
        return AppStrings.partTime;
      case JobMode.freelance:
        return AppStrings.freelance;
      case JobMode.internship:
        return AppStrings.internship;
    }
  }
}

extension FormatStringDate on String {
  String formatToDate() {
    final DateTime parsedDate = DateTime.parse(this);
    return DateFormat.yMMMMd().format(parsedDate);
  }
}

extension ShowMyToast on BuildContext {
  void showToast(String message) => ScaffoldMessenger.of(this).showSnackBar(
    SnackBar(
      backgroundColor: Colors.black54,
      elevation: 0,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.startToEnd,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8.w,
        children: [
          Image.asset(Assets.jobifyIcon, height: 32.h, width: 32.h),
          Expanded(
            child: Text(
              message,
              style: AppTextStyles.font14Medium.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}

extension CheckDarkThemeActivation on BuildContext {
  bool get isDarkModeActive => Theme.of(this).brightness == Brightness.dark;
}
