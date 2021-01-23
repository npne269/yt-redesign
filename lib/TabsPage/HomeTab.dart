import 'package:flutter/material.dart';
import 'package:ytredesign/data.dart';
import 'package:ytredesign/globals.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DisplayCardWidget(
              imgHeight: 300.0,
              imgWidth: 400.0,
              isRow: screenSize.width <= 1080 ? false : true,
              data: videoData[0],
            ),
            Spacer(),
            screenSize.width >= 1080 && screenSize.width <= 1230
                ? Container()
                : Column(
                    children: [
                      SmallChip(
                        label: '50M Subs',
                        icon: Icons.person,
                      ),
                      SmallChip(
                        label: '312 Videos',
                        icon: Icons.videocam,
                      ),
                      SmallChip(
                        label: '20B Views',
                        icon: Icons.visibility,
                      ),
                      SmallChip(
                        label: '150M Likes',
                        icon: Icons.thumb_up,
                      ),
                      SmallChip(
                        label: '8.5k Dislike',
                        icon: Icons.thumb_down,
                      ),
                    ],
                  )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Divider(),
        ),
        Text(
          'All Uploads',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 500,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              videoData.length,
              (index) => DisplayCardWidget(
                data: videoData[index],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class DisplayCardWidget extends StatelessWidget {
  final bool isRow;
  final double imgHeight;
  final double imgWidth;
  final Map data;

  const DisplayCardWidget({
    Key key,
    this.isRow = false,
    this.imgHeight = 180.0,
    this.imgWidth = 300.0,
    @required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return isRow
        ? Row(
            children: getmyList(),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: getmyList(),
            ),
          );
  }

  List<Widget> getmyList() => [
        Container(
          width: imgWidth,
          height: imgHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(
                  data['img'],
                ),
                fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          height: 40,
          width: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: imgWidth,
              child: Text(
                data['title'],
                style: TextStyle(fontSize: 26),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SmallChip(
                  label: data['views'],
                  icon: Icons.visibility_outlined,
                ),
                SmallChip(
                  label: data['time'],
                  icon: Icons.history,
                ),
                SmallChip(
                  label: data['likes'],
                  icon: Icons.thumb_up_outlined,
                ),
                SmallChip(
                  label: data['dislike'],
                  icon: Icons.thumb_down_outlined,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: imgWidth,
              child: Text(
                data['description'],
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  letterSpacing: 1.2,
                  height: 1.5,
                ),
              ),
            ),
          ],
        )
      ];
}

class SmallChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const SmallChip({
    Key key,
    @required this.label,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: dimText,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          label,
          style: TextStyle(
            color: dimText,
          ),
        ),
        SizedBox(
          width: 20,
          height: 30,
        )
      ],
    );
  }
}
