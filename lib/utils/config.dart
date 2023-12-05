import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:social_user_generator/screens/saved_screen.dart';
import 'package:social_user_generator/utils/extensions.dart';
import 'package:social_user_generator/utils/markdown_widget.dart';
import 'package:social_user_generator/utils/share_app.dart';

class Config {
  /// API secret passphrase
  static const String apiSecret = "ajksd4nakDFSsjndjDF4Skan%as643Dfg64cs4adsDF86ks,4slSFH";
  static String baseApiUrl = "https://social-generate.almorbeh.com/api";

  /// Strings in the app
  static String appTitle = "app_title".tr();

  /// lists
  static List<Map<String, dynamic>> drawerItems = [
    {
      'title': Config.saved,
      'icon': Icons.bookmarks_outlined,
      'callback': (BuildContext context) {
        const SavedScreen().launch(context,
            pageRouteAnimation: PageRouteAnimation.values.getRandomElement());
      },
    },
    {
      'title': Config.share,
      'icon': Icons.share,
      'callback': (BuildContext context) {
        shareApp();
      },
    },
    {
      'title': Config.rate,
      'icon': Icons.star,
      'callback': (BuildContext context) {
        openAppForReview();
      },
    },
    {
      'title': Config.terms,
      'icon': Icons.check,
      'callback': (BuildContext context) {
        showInDialog(
          context,
          title: Text(Config.terms),
          builder: (_) => MarkdownWidget(mdFileName: "terms.md"),
        );
      },
    },
    {
      'title': Config.about,
      'icon': Icons.info,
      'callback': (BuildContext context) {
        showInDialog(
          context,
          title: Text(Config.about),
          builder: (_) => MarkdownWidget(mdFileName: "about.md"),
        );
      },
    },
    {
      'title': Config.privacy,
      'icon': Icons.lock,
      'callback': (BuildContext context) {
        showConfirmDialogCustom(
          context,
          title: Config.privacy,
          dialogType: DialogType.ACCEPT,
          height: 500,
          width: maxScreenWidth,
          customCenterWidget: MarkdownWidget(mdFileName: "privacy.md"),
          onCancel: (p0) {
            SystemNavigator.pop(animated: true);
          },
          onAccept: (p0) {},
          positiveText: Config.okay,
          negativeText: Config.notAccepted,
        );
      },
    },
    {
      'title': Config.exit,
      'icon': Icons.exit_to_app,
      'callback': (BuildContext context) {
        SystemNavigator.pop(animated: true);
      },
    },
  ];

  static List socialBtns = [
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

  // Main screen
  static String facebook = "facebook".tr();
  static String instagram = "instagram".tr();
  static String tiktok = "tiktok".tr();
  static String twitter = "twitter".tr();
  static String youtube = "youtube".tr();
  static String snapchat = "snapchat".tr();

  // Drawer
  static String share = "share".tr();
  static String privacy = "privacy".tr();
  static String exit = "exit".tr();
  static String rate = "rate".tr();
  static String about = "about".tr();
  static String saved = "saved".tr();
  static String terms = "terms".tr();

  // Generator screen
  static String enterCustomWord = "enterCustomWord".tr();
  static String generateScreenTitle = "generateScreenTitle".tr();
  static String usernameLength = "usernameLength".tr();
  static String includeNumbers = "includeNumbers".tr();
  static String includeSpecialCharacters = "includeSpecialCharacters".tr();
  static String customWord = "customWord".tr();
  static String generate = "generate".tr();

  // Result screen
  static String resultScreenTitle = "resultScreenTitle".tr();
  static String save = "save".tr();
  static String copy = "copy".tr();
  static String usernameSaved = "usernameSaved".tr();
  static String usernameCopied = "usernameCopied".tr();
  static String errorHappened = "errorHappened".tr();

  // Saved screen
  static String savedScreenTitle = "savedScreenTitle".tr();
  static String noData = "noData".tr();
  static String usernameRemoved = "usernameRemoved".tr();
  static String remove = "remove".tr();

  // Random strings for app
  static String notAccepted = "notAccepted".tr();
  static String okay = "okay".tr();
  static const String shareSubject = "";
  static const String shareMessage = "";

}
