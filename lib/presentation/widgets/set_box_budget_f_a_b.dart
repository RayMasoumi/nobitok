import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/presentation/widgets/custom_image_widget.dart';

import '../../constants/styles.dart';

class SetBoxBudgetFAB extends StatelessWidget {
  const SetBoxBudgetFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 258.w,
      child: FloatingActionButton(
        heroTag: 'AddDocumentFAB',
        backgroundColor: const Color(0xff3988FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19),
        ),
        onPressed: () {
          //TODO  Navigator.of(context).pushNamed();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomImage(path: 'assets/icons/box.png'),
            SizedBox(
              width: 8.w,
            ),
            Text(
              'تعیین موجودی صندوق',
              style: kTitle15TextStyle.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
