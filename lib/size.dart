import 'package:flutter/material.dart';

Size displaySize(BuildContext context) {
  //debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  //debugPrint('Height = ' + displaySize(context).height.toString());
  return displaySize(context).height -
      MediaQuery.of(context).padding.top -
      kToolbarHeight;
}

double displayWidth(BuildContext context) {
  //debugPrint('Width = ' + displaySize(context).width.toString());
  return displaySize(context).width;
}
