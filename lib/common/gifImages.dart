import 'dart:async';
import 'package:flutter/material.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import '../generated/l10n.dart';

class GifImages extends StatefulWidget {
  final String url;

  GifImages({required this.url});

  @override
  _GifImagesState createState() => _GifImagesState();
}

class _GifImagesState extends State<GifImages> {
  List<String> images = [
    AssetRes.appIcon,
    AssetRes.banner,
    AssetRes.banner2,
    AssetRes.banner3,
  ];
  int currentIndex = 0;
  int countImages = 3;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    // Start the timer to change the background image every 300 milliseconds
    timer = Timer.periodic(Duration(milliseconds: 900), (timer) {
      setState(() {
        // Update the currentIndex to show the next image in the list
        currentIndex < 3
            ? currentIndex = currentIndex + 1
            : currentIndex = currentIndex + 0;
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.appBarColor,
      appBar: AppBar(
        title: Text(
          S.current.termsOfUse,
          style: TextStyle(
            color: ColorRes.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Image.asset(images[currentIndex]),
      ),
    );
  }
}
