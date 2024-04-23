import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthButton extends StatelessWidget {
  final FaIcon icon;
  final String label;
  final void Function(BuildContext) onTabFunction;

  const AuthButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTabFunction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTabFunction(context),
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: icon,
              ),
              Text(
                label,
                textAlign: TextAlign.center,
              ),
            ],
          )
        ),
      ),
    );
  }
}
