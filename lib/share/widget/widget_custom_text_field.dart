import 'package:ecommerceshop/presentation/feature_shared/home/components/title_widget.dart';
import 'package:ecommerceshop/share/constant/constant.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget({
    super.key,
    this.onChanged,
    this.hint = '',
    this.text = '',
    required this.title,
    this.shouldShow = true,
  });

  final Function(String)? onChanged;
  final String hint;
  final String? text;
  final String title;
  final bool shouldShow;
  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  void initState() {
    super.initState();
    tedController.text = widget.text ?? '';
  }

  final tedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.shouldShow,
      child: Column(
        children: [
          TitleWidget(title: widget.title, showSeeMore: false),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                color: appBackgroundColor,
              ),
              child: TextField(
                  controller: tedController,
                  decoration: InputDecoration(
                      hintText: widget.hint,
                      icon: Icon(Icons.person, color: kPrimaryColor),
                      border: InputBorder.none),
                  onChanged: (value) => widget.onChanged?.call(value))),
        ],
      ),
    );
  }
}
