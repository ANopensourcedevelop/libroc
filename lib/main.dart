import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:libroc/home.dart';
import 'package:libroc/localization/locale_constant.dart';
import 'package:libroc/localization/localizations_delegate.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (
        int id,
        String title,
        String body,
        String payload,
      ) async {});
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('Notification payload - $payload');
    }
  });
  runApp(Start());
}

class Start extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_StartState>();
    state.setLocale(newLocale);
  }

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            child: child,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          );
        },
        locale: _locale,
        localizationsDelegates: [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''), // English, no country code
          const Locale('tr', ''), // Turkish, no country code
          const Locale('it', ''),
          const Locale('de', ''),
          const Locale('fr', ''),
          const Locale('hi', ''),
          const Locale('ja', ''),
          const Locale('pt', ''),
          const Locale('ru', ''),
          const Locale('ar', ''),
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale?.languageCode == locale?.languageCode &&
                supportedLocale?.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales?.first;
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFF293d32),
          primaryColor: Color(0xFF293d32),
          accentColor: Color(0xFF568394),
        ),
        home: Home());
  }
}
