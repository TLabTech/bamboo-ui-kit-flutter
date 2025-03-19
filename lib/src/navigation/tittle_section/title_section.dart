import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';

class TTitleSection extends StatelessWidget {
  final String title;
  final String? description;
  final Widget? icon;
  final VoidCallback? onPressed;
  final String? buttonText;
  final Color? buttonColor;

  const TTitleSection({
    super.key,
    required this.title,
    this.description,
    this.icon,
    this.onPressed,
    this.buttonText,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: icon,
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TFontBold.headline(context).copyWith(
                        color: HexColor(
                          neutral900,
                        ),
                      ),
                    ),
                    if (description != null)
                      Text(
                        description!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TFontRegular.caption2(context).copyWith(
                          color: HexColor(
                            neutral500,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 12),
          child: buttonText != null
              ? GestureDetector(
                  onTap: onPressed,
                  child: Text(
                    buttonText!,
                    style: TFontBold.body(context).copyWith(
                      color: buttonColor ?? HexColor(primary500),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: onPressed,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.more_horiz),
                  ),
                ),
        ),
      ],
    );
  }
}
