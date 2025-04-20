import 'package:flutter/material.dart';

import '../../../../../core/theming/app_text_styles.dart';

class HaveAccQuestion extends StatelessWidget {
  const HaveAccQuestion({
    super.key,
    required this.question,
    required this.onPressed,
    required this.buttonText,
  });

  final String question, buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(question, style: AppTextStyles.font12Regular),
        TextButton(onPressed: onPressed, child: Text(buttonText)),
      ],
    );
  }
}
