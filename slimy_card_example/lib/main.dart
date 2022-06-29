// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slimy_card/slimy_card.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

//@CodeWithFlexz on Instagram

//AmirBayat0 on Github
//Programming with Flexz on Youtube

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "SlimyCard Package Example",
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: _buildAppBar(),
      body: Center(
        child: StreamBuilder<Object>(
            initialData: false,
            stream: slimyCard.stream,
            builder: (context, snapshot) {
              return ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: <Widget>[
                  const SizedBox(height: 100),
                  SlimyCard(
                    bottomCardHeight: 110,
                    topCardWidget: _topCardWidget(
                      (snapshot.data) ? 'image Address' : 'image Address',
                      (snapshot.data) ? true : false,
                    ),
                    bottomCardWidget: _bottomCardWidget(),
                  ),
                ],
              );
            }),
      ),
    );
  }

  /// APP BAR  WIDGET
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xff5959ff),
      centerTitle: true,
      title: const Text("SlimyCard Package Example"),
    );
  }

  /// TOP CARD WIDGET
  Widget _topCardWidget(String imagePath, bool isOpen) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          height: isOpen ? 85 : 78,
          width: isOpen ? 85 : 78,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isOpen ? 100 : 20),
            image: DecorationImage(
                image: AssetImage(imagePath), fit: BoxFit.fitHeight),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          'Your Name',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(height: 8),
        Text(
          'Your Career',
          style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  /// BOTTOM CARD WIDGET
  Widget _bottomCardWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
                text: 'Social name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  TextSpan(
                    text: ' on Instagram',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ]),
          ),
          SizedBox(height: 6),
          RichText(
            text: TextSpan(
                text: 'Social name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  TextSpan(
                    text: ' on Youtube',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ]),
          ),
          SizedBox(height: 6),
          RichText(
            text: TextSpan(
                text: 'Social name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  TextSpan(
                    text: ' on Github',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
