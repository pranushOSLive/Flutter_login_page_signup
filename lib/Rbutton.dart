import 'package:flutter/material.dart';

class RtBB extends StatelessWidget {
  Function onPressed;
  Widget widget;
  RtBB({Key? key, required this.widget, required this.onPressed})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.35),
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        // ignore: deprecated_member_use
        child: FlatButton(
            onPressed: () {
              onPressed();
            },
            height: MediaQuery.of(context).size.height / 12,
            shape: const StadiumBorder(),
            color: Colors.white.withOpacity(0.4),
            child: Center(
              child: widget,
            )),
      ),
    );
  }
}
