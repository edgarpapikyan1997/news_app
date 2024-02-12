import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forestvpn_test/utils/extensions/context_extensions.dart';
import 'package:forestvpn_test/utils/extensions/widget_extension.dart';

import '../../utils/themes/app_colors.dart';

class CustomAppBar extends StatefulWidget {
  final Widget? icon;
  final String? title;
  final String? endTitle;
  final bool textColor;
  final VoidCallback? onEndTitlePressed;

  const CustomAppBar({
    Key? key,
    this.icon,
    this.title = '',
    this.endTitle = '',
    this.textColor = false,
    this.onEndTitlePressed,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.white,
      leadingWidth: 16,
      leading: widget.icon!,
      centerTitle: true,
      title: Text(widget.title!, style: context.theme.headline4),
      actions: [
        GestureDetector(
          onTap: widget.onEndTitlePressed,
          child: Text(widget.endTitle!, style: context.theme.headline4),
        ),
      ],
    ).paddingOnly(left: 16, right: 20);
  }
}
