import 'package:core/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({required this.centerTitle, super.key, this.title, this.actions, this.leading, this.backgroundColor});

  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: title != null ? Text(title!) : null,
      actions: actions,
      leading: leading,
      backgroundColor: backgroundColor,
      elevation: context.elevationNormal,
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
