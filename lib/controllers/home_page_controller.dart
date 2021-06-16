import 'package:flutter/material.dart';
import 'package:funny_number/components/result_modal_bottom_sheet.dart';
import 'package:funny_number/models/result.dart';
import 'package:funny_number/services/number_api.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePageController extends GetxController
    with SingleGetTickerProviderMixin {
  NumberApiService _numberApiService = NumberApiService();
  late Result _result;
  late AnimationController _controller;
  late Animation<double> _animation;
  late Tween<double> _tween;
  var _firstNumber = 0.obs;
  var _secondNumber = 0.obs;
  var _thirdNumber = 0.obs;
  var _fourthNumber = 0.obs;
  var _isApiResultReady = true.obs;

  Result get result => this._result;
  Animation<double> get animation => _animation;
  int get firstNumber => this._firstNumber.value;
  int get secondNumber => this._secondNumber.value;
  int get thirdNumber => this._thirdNumber.value;
  int get fourthNumber => this._fourthNumber.value;
  bool get isApiResultReady => _isApiResultReady.value;

  set firstNumber(value) => this._firstNumber.value = value;
  set secondNumber(value) => this._secondNumber.value = value;
  set thirdNumber(value) => this._thirdNumber.value = value;
  set fourthNumber(value) => this._fourthNumber.value = value;

  @override
  void onInit() {
    super.onInit();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _tween = Tween(begin: 0.0, end: 1.0);
    _animation = _tween.animate(
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut))
      ..addListener(() => update());
    _controller.repeat(reverse: true);
  }

  @override
  void onClose() {
    _controller.dispose();
    super.dispose();
  }

  void firstNumberOnChanged(int value) => firstNumber = value;
  void secondNumberOnChanged(int value) => secondNumber = value;
  void thirdNumberOnChanged(int value) => thirdNumber = value;
  void fourthNumberOnChanged(int value) => fourthNumber = value;

  void onPressedGetResultButton() async {
    _isApiResultReady.value = false;
    _result = await _numberApiService.getCurrentNumber(
        "$_firstNumber$_secondNumber$_thirdNumber$_fourthNumber");
    _isApiResultReady.value = true;

    await showCupertinoModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: Get.context!,
      useRootNavigator: true,
      elevation: 4.0,
      builder: (context) => ResultModalBottomSheet(),
    );
  }

  void onPressedGetRandomButton() async {
    _firstNumber.value = 9;
    await Future.delayed(const Duration(milliseconds: 100));
    _secondNumber.value = 9;
    await Future.delayed(const Duration(milliseconds: 100));
    _thirdNumber.value = 9;
    await Future.delayed(const Duration(milliseconds: 100));
    _fourthNumber.value = 9;

    _isApiResultReady.value = false;
    _result = await _numberApiService.getRandomNumber();
    _isApiResultReady.value = true;

    await showCupertinoModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: Get.context!,
      useRootNavigator: true,
      elevation: 4.0,
      builder: (context) => ResultModalBottomSheet(),
    );
  }
}
