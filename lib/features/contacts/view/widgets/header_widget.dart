import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTapNew;
  const HeaderWidget({
    super.key,
    required this.onTapNew,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Contacts",
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      backgroundColor: Colors.deepPurple,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: ElevatedButton(
            onPressed: onTapNew,
            child: Text(
              "New",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
