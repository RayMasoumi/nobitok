import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/horizontal_padding.dart';
import '../widgets/padded_divider.dart';
import '../widgets/searchbar_widget.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: HorizontalPadding(
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
// * searchbar:
            const SearchbarWidget(
              isHomeScreen: true,
            ),
// * first divider:
            const PaddedDivider(
              topPadding: 12,
              bottomPadding: 12,
            ), // * end of first divider
          ],
        ),
      ),
    );
  }
}
