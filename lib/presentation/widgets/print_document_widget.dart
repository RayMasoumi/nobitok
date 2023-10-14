import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';
import 'info_card_widget.dart';

class PrintDocumentWidget extends StatelessWidget {
  const PrintDocumentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO print
      },
      child: InfoCardWidget(
        color: kBlue300Color,
        horizontalPadding: 14,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              MdiIcons.fileDocumentMultipleOutline,
              color: Colors.white,
              size: 24,
            ),
            Text(
              'چاپ پرونده',
              style: kBold13TextStyle.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
