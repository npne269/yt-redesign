import 'package:flutter/material.dart';
import 'package:ytredesign/TabsPage/HomeTab.dart';
import 'package:ytredesign/data.dart';
import 'package:ytredesign/globals.dart';

class ContentPage extends StatelessWidget {
  final List<Widget> tabPage = [
    HomeTab(),
    Center(child: Text('No Videos')),
    Center(child: Text('No Playlist')),
    Center(child: Text('No Channel')),
    Center(child: Text('All rights reserved')),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          children: [
            //Header
            Header(),
            SizedBox(
              height: 10,
            ),
            MainContent(),
            //Tabs content
            Expanded(
              child: TabBarView(
                children: [...tabPage.map((tabs) => tabs)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  void openDrawer(context) => Scaffold.of(context).openDrawer();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        screenSize.width <= 1480
            ? IconButton(
                icon: Icon(
                  Icons.menu,
                  color: dimText,
                ),
                onPressed: () => openDrawer(context))
            : Container(),
        Icon(
          Icons.search,
          color: dimText,
          size: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextField(
            cursorColor: dimText,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search...',
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        RaisedButton(
          onPressed: () => print('Lets create some thing'),
          child: Text('Create'),
          color: Colors.amber,
        ),
        SizedBox(
          width: 20,
        ),
        CircleAvatar(
          maxRadius: 18,
          backgroundImage: AssetImage('images/logo.png'),
        ),
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/banner.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0)),
          ),
          Positioned(top: 165, child: BannerHeader()),
        ],
      ),
    );
  }
}

class BannerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
            ),
            image: DecorationImage(
              image: AssetImage(
                'images/logo.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
            ),
            Text(
              'FlutterIt',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 40,
              width: 600,
              child: TabBar(
                labelPadding: EdgeInsets.symmetric(horizontal: 10),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.amberAccent,
                tabs: [
                  ...myTabs.map(
                    (e) => Tab(
                      iconMargin: EdgeInsets.zero,
                      child: Text(e),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
