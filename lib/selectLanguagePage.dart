import 'package:flutter/material.dart';
import 'package:libroc/home.dart';
import 'package:libroc/localization/locale_constant.dart';
import 'package:libroc/size.dart';

class SelectLanguage extends StatefulWidget {
  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your native language?'),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                changeLanguage(context, 'en');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              });
            },
            child: flagContainer(context, 'English', 'united-kingdom.png'),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                changeLanguage(context, 'it');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              });
            },
            child: flagContainer(context, 'Italy', 'italy.png'),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                changeLanguage(context, 'tr');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              });
            },
            child: flagContainer(context, 'Turkey', 'turkey.png'),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                changeLanguage(context, 'de');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              });
            },
            child: flagContainer(context, 'Germany', 'germany.png'),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                changeLanguage(context, 'fr');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              });
            },
            child: flagContainer(context, 'France', 'france.png'),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                changeLanguage(context, 'hi');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              });
            },
            child: flagContainer(context, 'India', 'india.png'),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                changeLanguage(context, 'ja');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              });
            },
            child: flagContainer(context, 'Japan', 'japan.png'),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                changeLanguage(context, 'ar');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              });
            },
            child: flagContainer(context, 'Arabic', 'arabic.png'),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                changeLanguage(context, 'pt');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              });
            },
            child: flagContainer(context, 'Portugal', 'portugal.png'),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                changeLanguage(context, 'ru');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              });
            },
            child: flagContainer(context, 'Russia', 'russia.png'),
          )
        ],
      ),
    );
  }

  Container flagContainer(BuildContext context, String text, String path) {
    return Container(
      margin: EdgeInsets.all(10),
      color: Theme.of(context).accentColor,
      height: displayHeight(context) * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
          ),
          //lib\flagIcons\united-kingdom.svg
          Image(image: AssetImage('assets/flag-icons/$path'))
        ],
      ),
    );
  }
}
