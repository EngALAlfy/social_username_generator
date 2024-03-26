import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:social_user_generator/screens/saved_screen.dart';
import 'package:social_user_generator/utils/extensions.dart';
import 'package:social_user_generator/utils/markdown_widget.dart';
import 'package:social_user_generator/utils/share_app.dart';

class Config {
  /// API secret passphrase
  static const String apiSecret =
      "ajksd4nakDFSsjndjDF4Skan%as643Dfg64cs4adsDF86ks,4slSFH";
  static String baseApiUrl = "https://social-generate.almorbeh.com/api";

  /// Strings in the app
  static String appTitle = "app_title";

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
      "name": "insta",
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
  static String facebook = "facebook";
  static String instagram = "instagram";
  static String tiktok = "tiktok";
  static String twitter = "twitter";
  static String youtube = "youtube";
  static String snapchat = "snapchat";

  // Drawer
  static String share = "share";
  static String privacy = "privacy";
  static String exit = "exit";
  static String rate = "rate";
  static String about = "about";
  static String saved = "saved";
  static String terms = "terms";

  // Generator screen
  static String enterCustomWord = "enter_custom_word";
  static String generateScreenTitle = "generate_screen_title";
  static String usernameLength = "username_length";
  static String includeNumbers = "include_numbers";
  static String includeSpecialCharacters = "include_special_characters";
  static String customWord = "custom_word";
  static String generate = "generate";

  // Result screen
  static String resultScreenTitle = "result_screen_title";
  static String save = "save";
  static String copy = "copy";
  static String usernameSaved = "username_saved";
  static String usernameCopied = "username_copied";
  static String errorHappened = "error_happened";

  // Saved screen
  static String savedScreenTitle = "saved_screen_title";
  static String noData = "no_data";
  static String usernameRemoved = "username_removed";
  static String remove = "remove";

  // Random strings for app
  static String notAccepted = "not_accepted";
  static String okay = "okay";
  static String lang = "lang";
  static const String shareSubject = "";
  static const String shareMessage = "";
}
