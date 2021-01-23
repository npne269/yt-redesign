import 'package:flutter/material.dart';
import 'package:ytredesign/data.dart';
import 'package:ytredesign/globals.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: secColor,
      ),
      child: ListView(
        children: [
          //title
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.red,
            ),
            title: Text(
              'Youtube',
              style: TextStyle(
                fontSize: 18,
                color: dimText,
              ),
            ),
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),

          //all main Icons
          ...myNavList.map((item) => getAllList(item)),

          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Text(
              'CHANNELS',
              style: headStyle,
            ),
          ),
          Divider(),

          //showing only 5 channels
          if (channelList.length <= 5)
            ...channelList.map((item) => getAllList(item))
          else
            ...channelList.sublist(0, 5).map((e) => getAllList(e)),

          //showing show more if channel list is more then 5
          (channelList.length > 5)
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'SHOW ${channelList.length - 5} More..',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : Container(),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'MORE',
              style: headStyle,
            ),
          ),
          ...othersList.map((e) => getAllList(e))
        ],
      ),
    );
  }

  Widget getAllList(item) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Icon(
              item['icon'],
              color: dimText,
            ),
            SizedBox(
              width: 10,
            ),
            Text(item['text'], style: TextStyle(color: dimText))
          ],
        ),
      );
}
