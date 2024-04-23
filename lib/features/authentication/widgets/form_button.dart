import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final bool disabled;

  const FormButton({
    super.key,
    required this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: disabled ? Colors.grey : Theme.of(context).primaryColor,
        ),
        duration: const Duration(milliseconds: 300),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(seconds: 300),
          style: TextStyle(
            color: disabled ? Colors.grey.shade50 : Colors.white,
          ),
          child: const Text(
            'Next',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
