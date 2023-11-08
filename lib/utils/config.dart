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
  static const String appTitle = "تخمين يوزرات انستا، تويتر، سناب";

  /// main screen
  static const String facebook = "فيسبوك";
  static const String instagram = "انستجرام";
  static const String tiktok = "تيك توك";
  static const String twitter = "تويتر";
  static const String youtube = "يوتيوب";
  static const String snapchat = "سناب شات";

  /// drawer
  static const String share = "مشاركة التطبيق";
  static const String privacy = "سياسة الخصوصية";
  static const String exit = "خروج";
  static const String rate = "تقييم التطبيق";
  static const String about = "حول التطبيق";
  static const String saved = "المحفوظات";
  static const String terms = "الشروط والاحكام";

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
          title: const Text(Config.terms),
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
          title: const Text(Config.about),
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

  /// generator screen
  static const String enterCustomWord = "ادخل كلمة خاصة";
  static const String generateScreenTitle = "توليد يوزر لــ ";
  static const String usernameLength = "طول اليوزر نيم";
  static const String includeNumbers = "تضمين ارقام";
  static const String includeSpecialCharacters = "تضمين حروف خاصة";
  static const String customWord = "مثال : mohammed";

  static const String generate = "بدء توليد الاسم";

  /// result screen
  static const String resultScreenTitle = "يوزرات لــ ";
  static const String save = "حفظ";
  static const String copy = "نسخ";

  static const String usernameSaved = "تم حفظ اليوزر بنجاح";
  static const String usernameCopied = "تم نسخ اليوزر بنجاح";

  static const String errorHappened = "خدث خطأ ما";

  /// saved screen
  static const String savedScreenTitle = "المحفوظات";
  static const String noData = "لا يوجد بيانات متاحة";
  static const String usernameRemoved = "تم حذف اليوزر بنجاح";
  static const String remove = "حذف";

  /// random strings for app
  static const String notAccepted = "غير موافق";
  static const String okay = "اوكي";
  static const String shareSubject = "";
  static const String shareMessage = "";

}
