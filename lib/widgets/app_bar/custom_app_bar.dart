import 'package:flutter/material.dart';
import 'package:movieapp/core/app_export.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
          key: key,
        );

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      //toolbarHeight: height ?? 85.v,
      //automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        mediaQueryData.size.width,
        height ?? 85.v,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgOutline:
        return Container(
          height: 64.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.whiteA700,
            border: Border.all(
              color: theme.colorScheme.onPrimaryContainer,
              width: 1.h,
            ),
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgOutline,
}
