import 'package:flutter/material.dart';
import 'package:funny_number/utilities/constants.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerWidget extends StatelessWidget {
  NumberPickerWidget({required this.currentValue, required this.onChanged});

  final int currentValue;
  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      value: currentValue,
      minValue: 0,
      maxValue: 9,
      itemWidth: Get.width * 0.2,
      textStyle: kMediumTextStyle,
      selectedTextStyle: kBoldTextStyle.copyWith(fontSize: 40),
      onChanged: onChanged,
    );
  }
}
