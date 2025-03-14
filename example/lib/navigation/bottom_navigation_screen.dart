import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIconFixedIndex = 0;
  int _selectedTextFixedIndex = 0;
  int _selectedCircleFixedIndex = 0;

  int _selectedIconFloatingIndex = 0;
  int _selectedTextFloatingIndex = 0;
  int _selectedCircleFloatingIndex = 0;

  final Color activeColor = HexColor(primary500);
  final Color inactiveColor = HexColor(neutral500);

  void _onItemIconFixedTapped(int index) {
    setState(() {
      _selectedIconFixedIndex = index;
    });
  }

  void _onItemTextFixedTapped(int index) {
    setState(() {
      _selectedTextFixedIndex = index;
    });
  }

  void _onItemCircleTapped(int index) {
    setState(() {
      _selectedCircleFixedIndex = index;
    });
  }

  void _onItemIconFloatingTapped(int index) {
    setState(() {
      _selectedIconFloatingIndex = index;
    });
  }

  void _onItemTextFloatingTapped(int index) {
    setState(() {
      _selectedTextFloatingIndex = index;
    });
  }

  void _onItemCircleFloatingTapped(int index) {
    setState(() {
      _selectedCircleFloatingIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(neutral050),
      appBar: THeader.nested(
        title: 'Bottom Navigation',
        enableCenterTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBreadcrumbs(
                items: [
                  TBreadcrumbItem(
                    onTap: () {},
                    icon: SvgPicture.asset(Assets.svg.home),
                  ),
                  TBreadcrumbItem(
                    onTap: () {},
                    label: 'Navigation',
                  ),
                  TBreadcrumbItem(
                    onTap: () {},
                    label: 'Bottom Navigation',
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TAccordion(
                title: "Icon Fixed",
                titleStyle: TFontBold.headline.copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(neutral300),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 20, bottom: 8),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildNavIconFixed(0),
                            _buildNavIconFixed(1),
                            _buildNavIconFixed(2),
                          ],
                        ),
                        SizedBox(height: 25,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TAccordion(
                title: "With Text Fixed",
                titleStyle: TFontBold.headline.copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(neutral300),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 20, bottom: 8),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildNavTextFixed(0),
                            _buildNavTextFixed(1),
                            _buildNavTextFixed(2),
                          ],
                        ),
                        SizedBox(height: 25,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TAccordion(
                title: "Circle Fixed",
                titleStyle: TFontBold.headline.copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(neutral300),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 20, bottom: 8),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildNavCircleFixed(0),
                            _buildNavCircleFixed(1),
                            _buildNavCircleFixed(2),
                          ],
                        ),
                        SizedBox(height: 25,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TAccordion(
                title: "Icon Floating",
                titleStyle: TFontBold.headline.copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(neutral300),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 20, bottom: 8),
                    margin: EdgeInsets.symmetric(horizontal: 55),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(42),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildNavIconFloating(0),
                              _buildNavIconFloating(1),
                              _buildNavIconFloating(2),
                            ],
                          ),
                        ),
                        SizedBox(height: 25,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TAccordion(
                title: "With Text Floating",
                titleStyle: TFontBold.headline.copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(neutral300),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 20, bottom: 8),
                    margin: EdgeInsets.symmetric(horizontal: 55),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(42),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildNavTextFloating(0),
                              _buildNavTextFloating(1),
                              _buildNavTextFloating(2),
                            ],
                          ),
                        ),
                        SizedBox(height: 25,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TAccordion(
                title: "Circle Floating",
                titleStyle: TFontBold.headline.copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(neutral300),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 20, bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 55),
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(55),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildNavCircleFloating(0),
                              _buildNavCircleFloating(1),
                              _buildNavCircleFloating(2),
                            ],
                          ),
                        ),
                        SizedBox(height: 25,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavIconFixed(int index) {
    String assets = Assets.svg.home;
    switch (index) {
      case 0:
        assets = Assets.svg.homeOutline;
        break;
      case 1:
        assets = Assets.svg.briefcase;
      case 2:
        assets = Assets.svg.userCircle;
    }
    return GestureDetector(
      onTap: () => _onItemIconFixedTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            assets,
            colorFilter: ColorFilter.mode(
              _selectedIconFixedIndex == index ? activeColor : inactiveColor,
              BlendMode.srcIn,
            ),
          ),
          if (_selectedIconFixedIndex == index)
            Container(
              margin: EdgeInsets.only(top: 5),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: activeColor,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNavTextFixed(int index) {
    String assets = Assets.svg.home;
    switch (index) {
      case 0:
        assets = Assets.svg.homeOutline;
        break;
      case 1:
        assets = Assets.svg.briefcase;
      case 2:
        assets = Assets.svg.userCircle;
    }
    return GestureDetector(
      onTap: () => _onItemTextFixedTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            assets,
            colorFilter: ColorFilter.mode(
              _selectedTextFixedIndex == index ? activeColor : inactiveColor,
              BlendMode.srcIn,
            ),
          ),
          Text(
            'Label',
            style: TFontRegular.caption1.copyWith(
              color: _selectedTextFixedIndex == index
                  ? activeColor
                  : inactiveColor,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildNavCircleFixed(int index) {
    String assets = Assets.svg.home;
    switch (index) {
      case 0:
        assets = Assets.svg.homeOutline;
        break;
      case 1:
        assets = Assets.svg.briefcase;
      case 2:
        assets = Assets.svg.userCircle;
    }
    return GestureDetector(
      onTap: () => _onItemCircleTapped(index),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _selectedCircleFixedIndex == index
              ? activeColor
              : Colors.transparent,
        ),
        padding: EdgeInsets.all(12),
        child: SvgPicture.asset(
          assets,
          colorFilter: ColorFilter.mode(
            _selectedCircleFixedIndex == index ? Colors.white : inactiveColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  Widget _buildNavIconFloating(int index) {
    String assets = Assets.svg.home;
    switch (index) {
      case 0:
        assets = Assets.svg.homeOutline;
        break;
      case 1:
        assets = Assets.svg.briefcase;
      case 2:
        assets = Assets.svg.userCircle;
    }
    return GestureDetector(
      onTap: () => _onItemIconFloatingTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            assets,
            colorFilter: ColorFilter.mode(
              _selectedIconFloatingIndex == index ? activeColor : inactiveColor,
              BlendMode.srcIn,
            ),
          ),
          if (_selectedIconFloatingIndex == index)
            Container(
              margin: EdgeInsets.only(top: 5),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: activeColor,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNavTextFloating(int index) {
    String assets = Assets.svg.home;
    switch (index) {
      case 0:
        assets = Assets.svg.homeOutline;
        break;
      case 1:
        assets = Assets.svg.briefcase;
      case 2:
        assets = Assets.svg.userCircle;
    }
    return GestureDetector(
      onTap: () => _onItemTextFloatingTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            assets,
            colorFilter: ColorFilter.mode(
              _selectedTextFloatingIndex == index ? activeColor : inactiveColor,
              BlendMode.srcIn,
            ),
          ),
          Text(
            'Label',
            style: TFontRegular.caption1.copyWith(
              color: _selectedTextFloatingIndex == index
                  ? activeColor
                  : inactiveColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavCircleFloating(int index) {
    String assets = Assets.svg.home;
    switch (index) {
      case 0:
        assets = Assets.svg.homeOutline;
        break;
      case 1:
        assets = Assets.svg.briefcase;
      case 2:
        assets = Assets.svg.userCircle;
    }
    return GestureDetector(
      onTap: () => _onItemCircleFloatingTapped(index),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _selectedCircleFloatingIndex == index
              ? activeColor
              : Colors.transparent,
        ),
        padding: EdgeInsets.all(12),
        child: SvgPicture.asset(
          assets,
          colorFilter: ColorFilter.mode(
            _selectedCircleFloatingIndex == index ? Colors.white : inactiveColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
