import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funny_number/controllers/home_page_controller.dart';
import 'package:funny_number/utilities/constants.dart';
import 'package:get/get.dart';

class ResultModalBottomSheet extends StatelessWidget {
  final HomePageController _homePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: const Radius.circular(22.0),
            topRight: const Radius.circular(22.0),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: kIconSize),
                  Text(
                    _homePageController.result.head ?? kErrorText,
                    style: kBoldTextStyle,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    highlightColor: Colors.transparent,
                    child: SvgPicture.asset(
                      kCloseIconPath,
                      width: kIconSize,
                      color: kPrimaryWhiteColor.withOpacity(1.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              Text(
                _homePageController.result.body ?? kCheckConnectionText,
                style: kMediumTextStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
