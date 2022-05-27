import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app_const/app_const.dart';

class ListEventObject extends StatelessWidget {
  final int pageID;

  const ListEventObject({
    Key? key,
    required this.pageID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        //  RouteHelper.getItemsPageView (context, pageID);
      },
      child: SizedBox(
        height: size.height * 0.12,
        width: size.height * 0.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: size.height * 0.08,
              width: size.height * 0.08,
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
