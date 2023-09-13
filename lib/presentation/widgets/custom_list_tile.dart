import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
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
