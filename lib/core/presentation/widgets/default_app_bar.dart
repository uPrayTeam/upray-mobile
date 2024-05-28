import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key, this.title, this.onBack});

  final String? title;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title!) : null,
      leading: onBack != null
          ? BackButton(
              onPressed: onBack,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
