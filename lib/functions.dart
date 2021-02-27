import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:libroc/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'main.dart';

class Functions {
  myShowAlertDialog(BuildContext context, String title, String message) {
    // set up the button
    Widget okButton = FlatButton(
      child: myText('OK', context),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Theme.of(context).accentColor,
      title: myText(title, context),
      content: myText(message, context),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Text myText(String title, context) => Text(
        title,
        style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
      );

  void myNotification() async {
    var _data;
    tz.initializeTimeZones();

    if (Variables.hourFromVariables == 1 ||
        Variables.hourFromVariables == null) {
      _data = tz.TZDateTime.now(tz.local).add(const Duration(hours: 1));
    } else if (Variables.hourFromVariables == 3) {
      _data = tz.TZDateTime.now(tz.local).add(const Duration(hours: 3));
    } else {
      _data = tz.TZDateTime.now(tz.local).add(const Duration(hours: 5));
    }

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'libroc',
      'libroc',
      'Channel for Alarm notification',
      importance: Importance.max,
      priority: Priority.high,
      icon: 'app_icon',
      sound: RawResourceAndroidNotificationSound('app_sound'),
      largeIcon: DrawableResourceAndroidBitmap('app_icon'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
      sound: 'app_sound_ios.wav',
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(0, 'Learning time',
        "It's time to repeat words", _data, platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  void insertNotificationTime(int hour) async {
    SharedPreferences spf = await SharedPreferences.getInstance();
    await spf.setInt('hour', hour);
    spf.reload();
  }

  void myGetNotificationTime() async {
    SharedPreferences spf = await SharedPreferences.getInstance();
    Variables.hourFromVariables = spf.getInt('hour');
  }

//----------------------------------------------------------------
}
