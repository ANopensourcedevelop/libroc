import 'package:flutter/material.dart';

import 'size.dart';

class MyText extends StatelessWidget {
  final String text;
  const MyText({this.text = 'Text'});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Theme.of(context).accentColor,
        fontSize: displayHeight(context) * 0.03,
      ),
    );
  }
}

class MyIcons extends StatelessWidget {
  final IconData iconName;
  const MyIcons({this.iconName});

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconName,
      size: displayHeight(context) * 0.06,
      color: Theme.of(context).accentColor,
    );
  }
}

class MyHomeMediaContainer extends StatelessWidget {
  final child;
  const MyHomeMediaContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context),
      height: displayHeight(context) * 0.4,
      //margin: EdgeInsets.symmetric(vertical: 9, horizontal: 5),
      margin: EdgeInsets.only(
        bottom: displayHeight(context) * 0.04,
        left: displayHeight(context) * 0.01,
        right: displayHeight(context) * 0.01,
      ),
      child: child,
    );
  }
}
