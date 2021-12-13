import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkPurple,
        title: const Text(about),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: screenMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: screenLargePadding),
              const Text(
                stepper,
                style: TextStyle(color: purple, fontSize: largeFontSize),
              ),
              const SizedBox(height: screenSmallPadding),
              const Text(
                coderpush,
                style: TextStyle(color: moreIconColor),
              ),
              const SizedBox(height: screenLargePadding),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: screenMediumPadding),
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(largeBorderRadius),
                  color: blueGrey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(version),
                    Text(
                      '1.0.1',
                      style: TextStyle(color: moreIconColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: screenLargePadding),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: screenMediumPadding,
                  vertical: screenMediumPadding,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(largeBorderRadius),
                  color: blueGrey,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(developer),
                        Text(
                          developerName,
                          style: TextStyle(color: moreIconColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: screenLargePadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(productDesigner),
                        Text(
                          designerName,
                          style: TextStyle(color: moreIconColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: screenLargePadding),
                    const Text(
                      aboutText,
                      style: TextStyle(color: moreIconColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
