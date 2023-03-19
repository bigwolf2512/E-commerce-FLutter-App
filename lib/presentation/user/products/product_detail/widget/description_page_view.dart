import 'package:flutter/material.dart';

import '../../../../../share/constant/constant.dart';

class DescriptionPageView extends StatefulWidget {
  final String text;
  const DescriptionPageView({Key? key, required this.text}) : super(key: key);

  @override
  State<DescriptionPageView> createState() => _DescriptionPageViewState();
}

class _DescriptionPageViewState extends State<DescriptionPageView> {
  late String firstHalf;
  late String secondHalf;
  bool hidenText = true;
  double textHeight = 300;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        child: secondHalf.isEmpty
            ? Text(
                firstHalf,
                style: TextStyle(
                    overflow: TextOverflow.fade,
                    color: kTextColor,
                    fontSize: 18),
                textAlign: TextAlign.justify,
              )
            : Column(
                children: [
                  Text(
                    hidenText ? (firstHalf + "...") : (firstHalf + secondHalf),
                    style: TextStyle(
                        overflow: TextOverflow.fade, color: kTextColor),
                    textAlign: TextAlign.justify,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hidenText = !hidenText;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 80),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: hidenText
                                    ? 'See More Detail'
                                    : 'See Less Detail',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: kAccentColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ])),
                          ),
                          Icon(
                            hidenText
                                ? Icons.arrow_drop_down_outlined
                                : Icons.arrow_drop_up_outlined,
                            color: kAccentColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
