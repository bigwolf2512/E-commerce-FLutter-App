import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/constant/path_spref.dart';
import '../../data/repo/pref_repo.dart';
import '../../design/extension/double_extension.dart';
import '../../share/constant/constant.dart';
import '../../share/widget/button_flat.dart';
import 'components/events_list.dart';
import 'components/list_store_widget.dart';
import 'components/most_finding_list.dart';
import 'components/title_widget.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final PrefRepo repo = Get.find();
  List<Widget> _listHomeScreenBodyWidget = <Widget>[];

  @override
  void initState() {
    super.initState();
    if (repo.sharedPreferences.containsKey(kPathPrefUserIsSeller)) {
      if (repo.sharedPreferences.getBool(kPathPrefUserIsSeller) ?? false) {
        _listHomeScreenBodyWidget
          ..add(_buildAppBar())
          ..add(_buildDiscount())
          ..add(_buildDiscount())
          ..add(_buildDiscount())
          ..add(TitleWidget(title: 'Your products on sale'))
          ..add(_buildListMostFinding());
      } else {
        _listHomeScreenBodyWidget
          ..add(_buildAppBar())
          ..add(_buildDiscount())
          ..add(ListStoreScreen());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _listHomeScreenBodyWidget.length,
          (index) => _listHomeScreenBodyWidget[index],
        ),
      ),
    );
  }

  Widget _buildListEvent() {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 0.12.h,
      width: 1.0.w,
      padding: const EdgeInsets.only(right: 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListEventObject(
            pageID: index,
          );
        },
      ),
    );
  }

  Widget _buildListMostFinding() {
    return Container(
      height: 0.2.h,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListMostFinding(
            pageID: index,
          );
        },
      ),
    );
  }

  Widget _buildHeaderMostFinding() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              children: const [
                TextSpan(
                    text: "Most Finding For You",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: "See more",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: kBodyTextColor.withOpacity(0.5))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRecommendedFood() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              children: const [
                TextSpan(
                    text: "Recommended Food",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: "See more",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: kBodyTextColor.withOpacity(0.5))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiscount() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 0.15.h,
      width: 0.95.w,
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: const [
            TextSpan(
              text: "A Summer Surpise\n",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            TextSpan(
              text: "Cashback 20%",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              width: 0.4.w,
              height: 0.13.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kSecondaryColor,
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search for products",
                    icon: Image.asset(
                      "assets/icons/find.png",
                      fit: BoxFit.fill,
                      height: 0.05.w,
                    ),
                    border: InputBorder.none),
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
