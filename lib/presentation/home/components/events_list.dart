import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../design/extension/double_extension.dart';
import '../../../share/constant/constant.dart';

class ListEventObject extends StatelessWidget {
  const ListEventObject({Key? key, required this.pageID}) : super(key: key);
  final int pageID;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //  RouteHelper.getItemsPageView (context, pageID);
      },
      child: SizedBox(
        height: 0.12.h,
        width: 0.1.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: 0.08.h,
              width: 0.08.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kSecondaryColor,
                  border: Border.all(
                    color: kPrimaryColor,
                  )),
              child: SvgPicture.asset(
                EventListIcons[pageID],
                color: kPrimaryColor,
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: EventListTitles[pageID],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: kBodyTextColor.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
