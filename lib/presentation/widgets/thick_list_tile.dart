import 'package:flutter/material.dart';

class ThickListTile extends StatelessWidget {
  const ThickListTile({
    super.key,
    required this.leading,
    required this.trailing,
  });

  final Widget leading;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
// * list tile leading:
      leading: leading,
// * list tile trailing:
      trailing: trailing,
    );
  }
}
