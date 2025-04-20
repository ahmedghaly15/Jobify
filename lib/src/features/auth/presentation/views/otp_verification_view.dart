// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:jobify/src/core/helpers/extensions.dart';

// import '../../../../core/utils/app_strings.dart';
// import '../../../../core/widgets/adaptive_circular_progress_indicator.dart';
// import '../../../../core/widgets/primary_button.dart';
// import '../providers/otp_verification_provider.dart';
// import 'widgets/auth_sub_title.dart';
// import 'widgets/auth_title.dart';
// import 'widgets/email_verification_pin_put.dart';
// import 'widgets/have_acc_questions.dart';

// @RoutePage()
// class OtpVerificationView extends StatelessWidget {
//   const OtpVerificationView({super.key, required this.email});

//   final String email;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24.w),
//         child: CustomScrollView(
//           slivers: [
//             const SliverToBoxAdapter(
//               child: AuthTitle(title: AppStrings.verifyYourEmail),
//             ),
//             SliverToBoxAdapter(
//               child: AuthSubTitle(
//                 subTitle: '${AppStrings.enterTheSentVerificationCode}: $email',
//               ),
//             ),
//             SliverFillRemaining(
//               hasScrollBody: false,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const EmailVerificationPinput(),
//                   Container(
//                     margin: EdgeInsets.only(bottom: 24.h),
//                     child: ResendOtpConsumer(email: email),
//                   ),
//                   const VerifyOtpConsumerButton(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class VerifyOtpConsumerButton extends ConsumerWidget {
//   const VerifyOtpConsumerButton({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final verifyOtpResult = ref.watch(otpVerificationProvider);
//     _listener(ref, context);
//     return PrimaryButton(
//       text: AppStrings.verify,
//       onPressed: () {
//         ref.read(otpVerificationProvider.notifier).verifyOtp();
//       },
//       child: verifyOtpResult?.whenOrNull(
//         loading:
//             () => SizedBox.square(
//               dimension: 24.h,
//               child: const AdaptiveCircularProgressIndicator(),
//             ),
//       ),
//     );
//   }

//   void _listener(WidgetRef ref, BuildContext context) {
//     ref.listen(otpVerificationProvider, (_, current) {
//       current?.whenOrNull(
//         error: (error, _) {
//           context.showAnimatedDialog(
//             state: CustomDialogStates.error,
//             message: error.toString(),
//           );
//         },
//         data:
//             (_) => context.showAnimatedDialog(
//               state: CustomDialogStates.success,
//               message: AppStrings.otpVerifiedSuc,
//               onAction: () {},
//             ),
//       );
//     });
//   }
// }

// class ResendOtpConsumer extends ConsumerWidget {
//   const ResendOtpConsumer({super.key, required this.email});

//   final String email;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     _listener(ref, context);
//     return HaveAccQuestion(
//       question: AppStrings.didntReceiveCode,
//       onPressed: () => ref.read(resendOtpProvider.notifier).resendOtp(email),
//       buttonText: AppStrings.resend,
//     );
//   }

//   void _listener(WidgetRef ref, BuildContext context) {
//     ref.listen(resendOtpProvider, (_, current) {
//       current?.whenOrNull(
//         loading: () => context.showLoadingDialog(),
//         data: (_) {
//           context.popTop();
//           context.showAnimatedDialog(
//             state: CustomDialogStates.success,
//             message: AppStrings.otpResentSuc,
//           );
//         },
//         error: (error, _) {
//           context.popTop();
//           context.showAnimatedDialog(
//             state: CustomDialogStates.error,
//             message: error.toString(),
//           );
//         },
//       );
//     });
//   }
// }
