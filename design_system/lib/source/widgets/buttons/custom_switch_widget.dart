import 'package:flutter/material.dart';

class CustomSwitchWidget extends StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;
  const CustomSwitchWidget({
    Key? key,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
    );
  }
}
