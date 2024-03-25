import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:social_user_generator/screens/social_username_generator_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    MobileAds.instance.initialize(),
    initialize(),
    // ApiService.instance.init(),
  ]);
  await EasyLocalization.ensureInitialized();
  runApp( EasyLocalization(
          supportedLocales: [Locale('ar')],
          path: 'assets/translations',
          child: Phoenix(child: SocialUsernameGeneratorApp()),
  )
  );
}

class SocialUsernameGeneratorApp extends StatelessWidget {
  const SocialUsernameGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.cairoTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Builder(builder: (context) {
        return const SocialUsernameGeneratorScreen();
      }),
    );
  }
}
