import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Config {
  /// Strings in the app
  static const String appTitle = "تخمين يوزرات انستا، تويتر، سناب";

  static const String facebook = "فيسبوك";
  static const String instagram = "انستجرام";
  static const String tiktok = "تيك توك";
  static const String twitter = "تويتر";
  static const String youtube = "يوتيوب";
  static const String snapchat = "سناب شات";

  static const String share = "مشاركة التطبيق";
  static const String privacy = "سياسة الخصوصية";
  static const String exit = "خروج";
  static const String rate = "تقييم التطبيق";
  static const String about = "حول التطبيق";

  /// lists
  static List<Map<String, dynamic>> drawerItems = [
    {
      'title': Config.share,
      'icon': Icons.share,
      'callback': () {
        // Add share functionality here
      },
    },
    {
      'title': Config.rate,
      'icon': Icons.star,
      'callback': () {
        // Add rate functionality here
      },
    },
    {
      'title': Config.about,
      'icon': Icons.info,
      'callback': () {
        // Add about functionality here
      },
    },
    {
      'title': Config.privacy,
      'icon': Icons.lock,
      'callback': () {
        // Add privacy functionality here
      },
    },
    {
      'title': Config.exit,
      'icon': Icons.exit_to_app,
      'callback': () {
        // Add exit functionality here
      },
    },
  ];


  static const List socialBtns = [
    {
      "name": "facebook",
      "title": Config.facebook,
      "color": Colors.blue,
      "icon": FontAwesomeIcons.facebook,
    },
    {
      "name": "tiktok",
      "title": Config.tiktok,
      "color": Colors.black,
      "icon": FontAwesomeIcons.tiktok,
    },
    {
      "name": "twitter",
      "title": Config.twitter,
      "color": Colors.lightBlue,
      "icon": FontAwesomeIcons.twitter,
    },
    {
      "name": "youtube",
      "title": Config.youtube,
      "color": Colors.red,
      "icon": FontAwesomeIcons.youtube,
    },
    {
      "name": "instagram",
      "title": Config.instagram,
      "color": Colors.purple,
      "icon": FontAwesomeIcons.instagram,
    },
    {
      "name": "snapchat",
      "title": Config.snapchat,
      "color": Colors.orangeAccent,
      "icon": FontAwesomeIcons.snapchat,
    },

  ];
}
