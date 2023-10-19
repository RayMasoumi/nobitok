import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/strings.dart';

import '../../constants/styles.dart';

class AddDocumentFAB extends StatelessWidget {
  const AddDocumentFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'AddDocumentFAB',
      backgroundColor: kGreenColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(kCreateNewDocumentScreenRoute);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            MdiIcons.fileDocumentEditOutline,
            size: 24.r,
            color: Colors.white,
          ),
          Text(
            'ایجاد پرونده جدید',
            style: kTitle15TextStyle.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
