import 'package:flutter/material.dart';

class GradientElevatedButtonWidget extends StatelessWidget {
  const GradientElevatedButtonWidget({
    super.key,
    required this.data,
    required this.onTap, required this.gradient,
  });

  final String data;
  final void Function() onTap;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient:  gradient,
        ),
        child: Text(data),
      ),
    );
  }
}
