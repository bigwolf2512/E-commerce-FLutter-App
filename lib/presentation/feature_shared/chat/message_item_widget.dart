import 'package:ecommerceshop/data/model/message_model.dart';
import 'package:ecommerceshop/share/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.data});

  final MessageModel data;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          data.sendByBuyer ? Alignment.centerLeft : Alignment.centerRight,
      child: data.sendByBuyer
          ? Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 24),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      data.message ?? '',
                      style: context.textTheme.titleMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              margin: EdgeInsets.only(left: 8),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                data.message ?? '',
                style: context.textTheme.titleMedium
                    ?.copyWith(color: Colors.white),
              ),
            ),
    );
  }
}
