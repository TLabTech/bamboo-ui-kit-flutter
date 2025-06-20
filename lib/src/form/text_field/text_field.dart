import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bamboo_ui_kit/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum TextFieldType { defaultType, multiline, password, email }

class TTextField extends StatefulWidget {
  final String? labelText;
  final String hintText;
  final TextEditingController controller;
  final bool enableInstantDelete;
  final TextInputType textInputType;
  final Widget? leading;
  final ValueChanged<String> onChange;
  final bool? enabled;
  final bool readOnly;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final FocusNode? focusNode;
  final Widget? actionWidget;
  final Color? hintColor;
  final bool? autoFocus;
  final int maxLines;
  final int minLines;
  final String? errorMessage;
  final String? description;
  final double? height;
  final Color? backgroundColor;
  final List<TextInputFormatter>? inputFormatter;
  final String? helperText;
  final VoidCallback? onEditingComplete;
  final bool obscureText;
  final String? counterText;
  final TextFieldType type;
  final Widget? passwordVisibilityIcon;
  final Widget? passwordVisibilityOffIcon;
  final bool showPasswordToggle;
  final Widget? emailIcon;
  final bool showEmailIcon;

  const TTextField({
    super.key,
    this.labelText,
    required this.hintText,
    required this.controller,
    required this.onChange,
    this.enableInstantDelete = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.textInputType = TextInputType.text,
    this.leading,
    this.enabled,
    this.readOnly = false,
    this.borderColor,
    this.focusedBorderColor,
    this.actionWidget,
    this.hintColor,
    this.autoFocus,
    this.focusNode,
    this.errorMessage,
    this.description,
    this.inputFormatter,
    this.height,
    this.backgroundColor,
    this.helperText,
    this.onEditingComplete,
    this.obscureText = false,
    this.counterText,
    this.passwordVisibilityIcon,
    this.passwordVisibilityOffIcon,
    this.showPasswordToggle = true,
    this.emailIcon,
    this.showEmailIcon = true,
  }) : type = TextFieldType.defaultType;

  const TTextField.password({
    super.key,
    this.labelText,
    required this.hintText,
    required this.controller,
    required this.onChange,
    this.enableInstantDelete = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.textInputType = TextInputType.text,
    this.leading,
    this.enabled,
    this.readOnly = false,
    this.borderColor,
    this.focusedBorderColor,
    this.actionWidget,
    this.hintColor,
    this.autoFocus,
    this.focusNode,
    this.errorMessage,
    this.description,
    this.inputFormatter,
    this.height,
    this.backgroundColor,
    this.helperText,
    this.onEditingComplete,
    this.obscureText = true,
    this.counterText,
    this.passwordVisibilityIcon,
    this.passwordVisibilityOffIcon,
    this.showPasswordToggle = true,
    this.emailIcon,
    this.showEmailIcon = true,
  }) : type = TextFieldType.password;

  const TTextField.multiline({
    super.key,
    this.labelText,
    required this.hintText,
    required this.controller,
    required this.onChange,
    this.enableInstantDelete = false,
    this.maxLines = 4,
    this.minLines = 4,
    this.textInputType = TextInputType.text,
    this.leading,
    this.enabled,
    this.readOnly = false,
    this.borderColor,
    this.focusedBorderColor,
    this.actionWidget,
    this.hintColor,
    this.autoFocus,
    this.focusNode,
    this.errorMessage,
    this.description,
    this.inputFormatter,
    this.height,
    this.backgroundColor,
    this.helperText,
    this.onEditingComplete,
    this.obscureText = false,
    this.counterText,
    this.passwordVisibilityIcon,
    this.passwordVisibilityOffIcon,
    this.showPasswordToggle = true,
    this.emailIcon,
    this.showEmailIcon = true,
  }) : type = TextFieldType.multiline;

  const TTextField.email({
    super.key,
    this.labelText,
    required this.hintText,
    required this.controller,
    required this.onChange,
    this.enableInstantDelete = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.enabled,
    this.readOnly = false,
    this.borderColor,
    this.focusedBorderColor,
    this.actionWidget,
    this.hintColor,
    this.autoFocus,
    this.focusNode,
    this.errorMessage,
    this.description,
    this.inputFormatter,
    this.height,
    this.backgroundColor,
    this.helperText,
    this.onEditingComplete,
    this.counterText,
    this.textInputType = TextInputType.emailAddress,
    this.leading,
    this.obscureText = false,
    this.passwordVisibilityIcon,
    this.passwordVisibilityOffIcon,
    this.showPasswordToggle = true,
    this.emailIcon,
    this.showEmailIcon = true,
  }) : type = TextFieldType.email;

  @override
  TTextFieldState createState() => TTextFieldState();
}

class TTextFieldState extends State<TTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  Widget _buildEmailIcon() {
    if (widget.emailIcon != null) {
      return widget.emailIcon!;
    }
    return SvgPicture.asset(Assets.svg.envelope);
  }

  Widget _buildPasswordToggleIcon() {
    if (_obscureText) {
      return widget.passwordVisibilityOffIcon ??
          SvgPicture.asset(Assets.svg.eyeSlash);
    } else {
      return widget.passwordVisibilityIcon ??
          SvgPicture.asset(Assets.svg.eye);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    final hasError = widget.errorMessage != null;
    final borderColor = hasError
        ? theme.destructive
        : (widget.focusNode?.hasFocus ?? false)
            ? (widget.focusedBorderColor ?? theme.primary)
            : (widget.borderColor ?? theme.border);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              widget.labelText!,
              style: TFontRegular.body(context).copyWith(color: theme.foreground),
            ),
          ),
        Container(
          constraints:
              widget.maxLines > 1 ? const BoxConstraints(minHeight: 40) : null,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: widget.obscureText ? 0 : 6,
          ),
          child: Row(
            crossAxisAlignment: widget.maxLines > 1
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              if (widget.leading != null && widget.type != TextFieldType.email)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: widget.leading!,
                ),
              if (widget.type == TextFieldType.email && widget.showEmailIcon)
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: _buildEmailIcon(),
                ),
              if ((widget.leading == null && widget.type != TextFieldType.email) ||
                  (widget.type == TextFieldType.email && !widget.showEmailIcon))
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: SizedBox(),
                ),
              Expanded(
                child: TextFormField(
                  focusNode: widget.focusNode,
                  maxLines: widget.maxLines,
                  minLines: widget.minLines,
                  enabled: widget.enabled,
                  autofocus: widget.autoFocus ?? false,
                  onChanged: widget.onChange,
                  keyboardType: widget.textInputType,
                  inputFormatters: widget.inputFormatter,
                  style: TFontRegular.body(context),
                  readOnly: widget.readOnly,
                  controller: widget.controller,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    hintStyle: TFontRegular.body(context).copyWith(
                      color: widget.hintColor ?? HexColor(gray500),
                    ),
                    helperText: widget.helperText,
                    counterText: widget.counterText,
                  ),
                  onEditingComplete: widget.onEditingComplete,
                ),
              ),
              if (widget.obscureText && widget.showPasswordToggle)
                IconButton(
                  icon: _buildPasswordToggleIcon(),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              if (widget.actionWidget != null && !widget.obscureText)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: widget.actionWidget!,
                ),
              if (widget.enableInstantDelete &&
                  widget.controller.text.isNotEmpty)
                IconButton(
                  onPressed: () {
                    widget.controller.clear();
                    widget.onChange("");
                    setState(() {});
                  },
                  icon: const Icon(Icons.clear),
                  iconSize: 20,
                ),
            ],
          ),
        ),
        if (widget.description != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.description!,
              style: TFontRegular.footNote(context).copyWith(
                color: theme.foreground,
              ),
            ),
          ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.errorMessage!,
              style: TFontRegular.footNote(context).copyWith(
                color: theme.destructive,
              ),
            ),
          ),
      ],
    );
  }
}
