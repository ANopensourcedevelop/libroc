import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).accentColor),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.mail, color: Theme.of(context).accentColor),
                    Text(
                      'Mail address',
                      style: TextStyle(color: Theme.of(context).accentColor),
                    )
                  ],
                ),
                InkWell(
                  child: Text(
                    'an.opensourcedevelop@gmail.com',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  onTap: () {
                    launch(
                      'an.opensourcedevelop@gmail.com',
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).accentColor),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.link,
                      color: Theme.of(context).accentColor,
                    ),
                    Text(
                      'GitHub address',
                      style: TextStyle(color: Theme.of(context).accentColor),
                    )
                  ],
                ),
                InkWell(
                    child: Text(
                      'https://github.com/ANopensourcedevelop?tab=repositories',
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                    onTap: () {
                      launch(
                        'https://github.com/ANopensourcedevelop?tab=repositories',
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
