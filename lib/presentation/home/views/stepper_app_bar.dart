import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/config/routes/routes.dart';
import 'package:stepper/presentation/home/views/page_item.dart';
import 'package:stepper/presentation/home/views/profile_item.dart';

class StepperAppBarSetting {
  final EdgeInsets padding;
  final Function()? onHomeClick;
  final bool showProfile;

  final String svgIconPath;

  const StepperAppBarSetting({
    this.svgIconPath = 'assets/svg/stepper_logo.svg',
    this.padding = const EdgeInsets.only(
      left: screenMediumPadding,
      bottom: screenSmallPadding,
      top: screenMediumPadding,
    ),
    this.onHomeClick,
    this.showProfile = true,
  });
}

class StepperAppBar extends StatelessWidget {
  final StepperAppBarSetting setting;

  const StepperAppBar({
    Key? key,
    this.setting = const StepperAppBarSetting(),
  }) : super(key: key);

  EdgeInsets get padding => setting.padding;

  Function()? get onHomeClick => setting.onHomeClick;

  String get svgIconPath => setting.svgIconPath;

  bool get showProfile => setting.showProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: maxAppBarHeight,
      ),
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _homeIcon(
            onTap: onHomeClick,
          ),
          const SizedBox(
            width: screenMediumPadding,
          ),
          ...pages(context),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: showProfile ? const ProfileItem() : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _homeIcon({
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        svgIconPath,
        width: stepperTabBarIconSize,
      ),
    );
  }

  List<Widget> pages(BuildContext context) {
    List<PageData> list = [
      PageData(
        title: area,
        onClick: () {
          Navigator.of(context).pushNamed(RouteNames.area);
        },
      ),
      PageData(
        title: calendar,
        onClick: () {
          Navigator.of(context).pushNamed(RouteNames.calendar);
        },
      ),
    ];

    return list.map((pageData) => PageItem(pageData: pageData)).toList();
  }
}
