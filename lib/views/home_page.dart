import 'package:flutter/material.dart';
import 'package:funny_number/components/number_picker_widget.dart';
import 'package:funny_number/controllers/home_page_controller.dart';
import 'package:funny_number/utilities/constants.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class HomePage extends StatelessWidget {
  final HomePageController _homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryDarkColor,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          buildBody(),
          Obx(() {
            return _homePageController.isApiResultReady
                ? const SizedBox()
                : buildLoadingIndicator();
          }),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text(
        kAppTitle,
        style: kBoldTextStyle,
      ),
    );
  }

  Widget buildLoadingIndicator() {
    return Container(
      alignment: Alignment.center,
      color: Colors.black.withOpacity(0.8),
      child: LoadingIndicator(
        indicatorType: Indicator.ballClipRotatePulse,
        color: kPrimaryWhiteColor,
      ),
    );
  }

  SafeArea buildBody() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildExplanationCard(),
            SizedBox(height: Get.height * 0.04),
            buildNumberCard(),
            SizedBox(height: Get.height * 0.04),
            buildButtons(),
          ],
        ),
      ),
    );
  }

  Card buildExplanationCard() {
    return Card(
      color: kPrimaryColor,
      margin: EdgeInsets.zero,
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        child: GetBuilder<HomePageController>(
          builder: (_) => Text(
            kExplanationText,
            style: kMediumTextStyle.copyWith(
              color: kPrimaryWhiteColor
                  .withOpacity(_homePageController.animation.value),
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }

  Card buildNumberCard() {
    return Card(
      color: kPrimaryColor,
      margin: EdgeInsets.zero,
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
        child: Row(
          children: [
            ///Used four different Obx widgets instead of wrapping Row with a single Obx.
            ///Because this solution prevents redrawing the whole row widget with its children.
            ///When a user scrolls one of the spinners, only the spinning widget will be drawn.
            Obx(() {
              return NumberPickerWidget(
                currentValue: _homePageController.firstNumber,
                onChanged: _homePageController.firstNumberOnChanged,
              );
            }),
            Obx(() {
              return NumberPickerWidget(
                currentValue: _homePageController.secondNumber,
                onChanged: _homePageController.secondNumberOnChanged,
              );
            }),
            Obx(() {
              return NumberPickerWidget(
                currentValue: _homePageController.thirdNumber,
                onChanged: _homePageController.thirdNumberOnChanged,
              );
            }),
            Obx(() {
              return NumberPickerWidget(
                currentValue: _homePageController.fourthNumber,
                onChanged: _homePageController.fourthNumberOnChanged,
              );
            }),
          ],
        ),
      ),
    );
  }

  Row buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: _homePageController.onPressedGetResultButton,
          child: const Text(
            kGetResultText,
            style: kBoldTextStyle,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryColor),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0)),
            elevation: MaterialStateProperty.all(4.0),
          ),
        ),
        ElevatedButton(
          onPressed: _homePageController.onPressedGetRandomButton,
          child: const Text(
            kGetRandomText,
            style: kBoldTextStyle,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryColor),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0)),
            elevation: MaterialStateProperty.all(4.0),
          ),
        ),
      ],
    );
  }
}
