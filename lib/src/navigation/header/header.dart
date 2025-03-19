import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/gen/assets.gen.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';
import 'package:flutter_svg/svg.dart';
import '../../fondation/hex_color.dart';

enum HeaderType { defaultType, nested, homepage, search, brand }

class THeader extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final String? hintText;
  final bool enableCenterTitle;
  final bool isBackButtonEnabled;
  final Widget? prefixAction;
  final List<Widget>? suffixAction;
  final Color? backgroundColor;
  final Color? iconColor;
  final HeaderType headerType;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Widget icon;

  const THeader({
    super.key,
    required this.title,
    this.titleStyle,
    this.enableCenterTitle = false,
    this.suffixAction,
    this.backgroundColor,
    this.iconColor,
  })  : headerType = HeaderType.defaultType,
        isBackButtonEnabled = false,
        subtitle = null,
        subtitleStyle = null,
        prefixAction = null,
        hintText = null,
        onChanged = null,
        onSubmitted = null,
        icon = const Icon(Icons.home, color: Colors.white);

  const THeader.nested({
    super.key,
    required this.title,
    this.titleStyle,
    this.enableCenterTitle = false,
    this.suffixAction,
    this.backgroundColor,
    this.prefixAction,
    this.iconColor,
  })  : headerType = HeaderType.nested,
        subtitle = null,
        subtitleStyle = null,
        isBackButtonEnabled = true,
        hintText = null,
        onChanged = null,
        onSubmitted = null,
        icon = const Icon(Icons.arrow_back_ios, color: Colors.white);

  const THeader.homepage({
    super.key,
    required this.title,
    this.titleStyle,
    this.subtitle,
    this.subtitleStyle,
    this.enableCenterTitle = false,
    this.suffixAction,
    this.backgroundColor,
    this.prefixAction,
  })  : headerType = HeaderType.homepage,
        isBackButtonEnabled = false,
        hintText = null,
        onChanged = null,
        iconColor = null,
        onSubmitted = null,
        icon = const Icon(Icons.arrow_back_ios, color: Colors.white);

  const THeader.search({
    super.key,
    this.backgroundColor,
    this.hintText,
    this.onSubmitted,
    this.onChanged,
    this.prefixAction,
    this.iconColor,
  })  : headerType = HeaderType.search,
        title = '',
        titleStyle = null,
        subtitle = null,
        subtitleStyle = null,
        suffixAction = null,
        enableCenterTitle = false,
        isBackButtonEnabled = true,
        icon = const Icon(Icons.arrow_back_ios, color: Colors.white);

  const THeader.brand({
    super.key,
    required this.icon,
    this.suffixAction,
    this.backgroundColor,
  })  : headerType = HeaderType.brand,
        title = '',
        titleStyle = null,
        isBackButtonEnabled = false,
        subtitle = null,
        subtitleStyle = null,
        prefixAction = null,
        enableCenterTitle = false,
        iconColor = null,
        hintText = null,
        onChanged = null,
        onSubmitted = null;

  @override
  State<THeader> createState() => _THeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _THeaderState extends State<THeader> {
  final TextEditingController _controller = TextEditingController();
  bool _isTextNotEmpty = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isTextNotEmpty = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 88.0,
      automaticallyImplyLeading: false,
      backgroundColor: widget.backgroundColor ?? Colors.white,
      surfaceTintColor: Colors.transparent,
      titleSpacing: 0,
      centerTitle: widget.enableCenterTitle,
      iconTheme: IconThemeData(color: HexColor(neutral900)),
      elevation: 0,
      leading: widget.isBackButtonEnabled
          ? (widget.prefixAction ??
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                  child: SvgPicture.asset(
                    Assets.svg.chevronLeft,
                    colorFilter: ColorFilter.mode(
                      widget.iconColor ?? HexColor(neutral900),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ))
          : null,
      title: _buildHeaderContent(),
      actions: widget.suffixAction,
    );
  }

  Widget _buildHeaderContent() {
    switch (widget.headerType) {
      case HeaderType.defaultType:
      case HeaderType.nested:
        return _buildDefaultOrNestedHeader();
      case HeaderType.homepage:
        return _buildHomepageHeader();
      case HeaderType.search:
        return _buildSearchHeader();
      case HeaderType.brand:
        return _buildBrandHeader();
    }
  }

  Widget _buildDefaultOrNestedHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        widget.title,
        style: widget.titleStyle ?? TFontRegular.title3(context),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildHomepageHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          if (widget.prefixAction != null) widget.prefixAction!,
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: widget.titleStyle ??
                      TFontRegular.title3(context)
                          .copyWith(color: HexColor(neutral900)),
                  textAlign: TextAlign.center,
                ),
                if (widget.subtitle != null)
                  Text(
                    widget.subtitle!,
                    style: widget.subtitleStyle ??
                        TFontRegular.caption2(context)
                            .copyWith(color: HexColor(neutral500)),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchHeader() {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, right: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 12.0),
              decoration: BoxDecoration(
                color: HexColor(neutral300).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(Assets.svg.magnifyingGlass),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        hintStyle: TFontRegular.caption1(context)
                            .copyWith(color: HexColor(neutral500)),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        widget.onChanged?.call(value);
                      },
                      onSubmitted: (value) {
                        widget.onSubmitted?.call(value);
                      },
                    ),
                  ),
                  if (_isTextNotEmpty)
                    IconButton(
                      icon: SvgPicture.asset(Assets.svg.xMark),
                      onPressed: () {
                        _controller.clear();
                      },
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: widget.icon,
    );
  }
}
