import 'package:ecommerceshop/data/constant/path_collection.dart';
import 'package:ecommerceshop/data/controller/load_more_controller.dart';
import 'package:ecommerceshop/data/model/message_model.dart';
import 'package:ecommerceshop/helper/load_more_helper.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen(this.chatterId);

  final String? chatterId;
  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState
    extends LoadMoreStatefulHelper<MessageModel, MessageScreen> {
  @override
  LoadMoreController<MessageModel> init() {
    return LoadMoreController(
        id: widget.chatterId,
        field: 'chatterId',
        pathCollection: kPathCollectionMessage,
        fromJson: MessageModel.fromJson);
  }

  @override
  Widget itemBuilder(MessageModel data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 80,
        margin: EdgeInsets.only(left: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(data.message ?? ''),
      ),
    );
  }
}
