import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import '../widgets/info_card_widget.dart';

class CustomerDocumentNumberWidget extends StatelessWidget {
  const CustomerDocumentNumberWidget({
    super.key,
    required this.docNumber,
  });

  final String docNumber;
  @override
  Widget build(BuildContext context) {
    return InfoCardWidget(
      horizontalPadding: 14,
      color: const Color(0xffC8C8C8),
      child: Center(
        child: Text(
          'شماره پرونده : $docNumber',
          style: kBold13TextStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
