import 'package:flutter/cupertino.dart';

import '../../../design/extension/double_extension.dart';
import '../../../share/constant/constant.dart';
import '../../../share/widget/button_flat.dart';

class CartAndNotification extends StatelessWidget {
  const CartAndNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        ButtonFlat(
          color: kSecondaryColor,
          itemsNumber: 0,
          padding: 0.025.w,
          icon: Icon(CupertinoIcons.chat_bubble_2),
        ),
        SizedBox(width: 0.03.w),
        ButtonFlat(
          color: kSecondaryColor,
          itemsNumber: 0,
          padding: 0.025.w,
          icon: Icon(CupertinoIcons.shopping_cart),
        ),
        SizedBox(width: 0.03.w),
        ButtonFlat(
          color: kSecondaryColor,
          itemsNumber: 12,
          padding: 0.025.w,
          icon: Icon(CupertinoIcons.bell),
        ),
        SizedBox(width: 10),
      ]),
    );
  }
}
