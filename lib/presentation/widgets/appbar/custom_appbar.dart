import 'package:core/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({this.centerTitle, super.key, this.title, this.actions, this.leading, this.backgroundColor});

  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool? centerTitle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: title != null ? Text(title!) : null,
      titleTextStyle: context.titleLarge.copyWith(fontFamily: GoogleFonts.poppins().fontFamily),
      actions: actions,
      leading: leading,
      backgroundColor: context.whiteColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
