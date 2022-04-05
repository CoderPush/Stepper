import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/config/routes/routes.dart';
import 'package:stepper/presentation/home/views/page_item.dart';
import 'package:stepper/presentation/home/views/profile_item.dart';

class StepperAppBar extends StatelessWidget {
  const StepperAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: maxAppBarHeight,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset('assets/images/avatar.png'),
          ...pages(context),
          const Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: ProfileItem(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> pages(BuildContext context) {
    List<PageData> list = [
      PageData(
          title: area,
          onClick: () {
            Navigator.of(context).pushNamed(RouteNames.area);
          }),
      PageData(
          title: calendar,
          onClick: () {
            Navigator.of(context).pushNamed(RouteNames.calendar);
          }),
    ];

    return list.map((pageData) => PageItem(pageData: pageData)).toList();
  }
}
