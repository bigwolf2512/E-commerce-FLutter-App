import 'package:flutter/material.dart';

class OnLoadingIndicator extends StatelessWidget {
  const OnLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                    child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                        ))),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: Text("Đang tải...")),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
