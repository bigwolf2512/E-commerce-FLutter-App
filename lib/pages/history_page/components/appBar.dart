import 'package:ecommerceshop/route_helper/route_helper.dart';
import 'package:flutter/material.dart';

AppBar appBar(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return AppBar(
    shadowColor: Colors.transparent,
    title: Row(
      children: [
        GestureDetector(
          onTap: () => RouteHelper().getPersonalPage(context),
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            height: size.height * 0.05,
            width: size.height * 0.05,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepOrange,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://scontent.fsgn5-12.fna.fbcdn.net/v/t39.30808-6/275626876_3076796902573541_8189424536756048255_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=3S5z9NyLBRwAX8a56GW&_nc_ht=scontent.fsgn5-12.fna&oh=00_AT_f_rHLj0ww3eh6a2JMhTdtvQ5KMVl6xImUL-seIduR4A&oe=62991911'),
                    fit: BoxFit.cover)),
          ),
        ),
        Text(
          "Your Orders",
          style: TextStyle(color: Colors.black),
        ),
      ],
    ),
    backgroundColor: Theme.of(context).bottomAppBarColor,
  );
}
