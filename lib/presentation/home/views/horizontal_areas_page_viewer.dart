import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/config/routes/routes.dart';
import 'package:stepper/data/models/area.dart';
import 'package:stepper/presentation/home/views/rating_indicator.dart';
import 'package:stepper/presentation/utils.dart';

class HorizontalAreasPageViewerSetting {
  final double iconSize;
  final Color iconColor;

  const HorizontalAreasPageViewerSetting({
    this.iconSize = fifty,
    this.iconColor = Colors.white,
  });
}

class HorizontalAreasPageViewer extends StatefulWidget {
  final List<AreasPageData> data;
  final HorizontalAreasPageViewerSetting setting;

  const HorizontalAreasPageViewer({
    Key? key,
    required this.data,
    this.setting = const HorizontalAreasPageViewerSetting(),
  }) : super(key: key);

  @override
  State<HorizontalAreasPageViewer> createState() =>
      _HorizontalAreasPageViewerState();
}

class _HorizontalAreasPageViewerState extends State<HorizontalAreasPageViewer> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _iconController({
    required IconData icon,
    Function()? onClick,
  }) {
    return InkWell(
      onTap: onClick,
      child: Icon(
        icon,
        size: widget.setting.iconSize,
        color: widget.setting.iconColor,
      ),
    );
  }

  void _slideLeft() {
    int currentPage = _pageController.page as int;

    if (currentPage > 0) {
      _pageController.animateToPage(
        currentPage - 1,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );
    }
  }

  void _slideRight() {
    int currentPage = _pageController.page as int;

    if (currentPage < widget.data.length - 1) {
      _pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _iconController(
          icon: Icons.keyboard_arrow_left,
          onClick: _slideLeft,
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return SizedBox(
                height: constraints.maxWidth / 3,
                child: PageView.builder(
                  scrollBehavior: const ScrollBehavior().copyWith(
                      dragDevices: <PointerDeviceKind>{
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.touch
                      }),
                  controller: _pageController,
                  itemBuilder: (ctx, index) {
                    return AreasPageWidget(data: widget.data[index]);
                  },
                  itemCount: widget.data.length,
                ),
              );
            },
          ),
        ),
        _iconController(
          icon: Icons.keyboard_arrow_right,
          onClick: _slideRight,
        ),
      ],
    );
  }
}

class AreasPageData {
  List<Area> list;

  AreasPageData({
    required this.list,
  });
}

class AreasPageWidget extends StatelessWidget {
  final AreasPageData data;

  const AreasPageWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Row(
          children: data.list
              .map(
                (data) => _item(
                  data,
                  constraints.maxWidth / 3,
                ),
              )
              .toList(),
        );
      },
    );
  }

  Widget _item(Area data, double itemWidth) {
    return AreaPageItem(
      area: data,
      itemWidth: itemWidth,
    );
  }
}

class AreaPageItem extends StatelessWidget {
  final Area area;
  final double itemWidth;

  const AreaPageItem({
    Key? key,
    required this.area,
    required this.itemWidth,
  }) : super(key: key);

  void _onAreaItemTap(BuildContext context, Area area) {
    Navigator.pushNamed(context, RouteNames.postList, arguments: area);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: itemWidth,
      height: itemWidth,
      padding: const EdgeInsets.all(
        screenMediumPadding,
      ),
      child: InkWell(
        onTap: () => _onAreaItemTap(context, area),
        child: Container(
          decoration: BoxDecoration(
            color: darkGrey,
            borderRadius: BorderRadius.circular(largeBorderRadius),
          ),
          padding: const EdgeInsets.all(
            screenMediumPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    area.name,
                    style: TextStyle(
                      fontSize: largeFontSize,
                      fontWeight: FontWeight.bold,
                      color: getAreaTheme(area.type)[2],
                    ),
                  ),
                  RatingIndicator(
                    indicatorText: sliderValues[area.rating],
                    indicatorWidth: itemWidth * 0.6 / 3 - screenSmallPadding,
                    indicatorHeight: itemWidth * 0.02,
                    indicatorPadding: indicatorPadding,
                    area: area,
                  ),
                ],
              ),
              const SizedBox(
                height: screenMediumPadding,
              ),
              Flexible(
                child: AutoSizeText(
                  area.description,
                  style: const TextStyle(
                    fontSize: mediumFontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
