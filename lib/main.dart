import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:social_user_generator/screens/social_username_generator_screen.dart';
import 'package:social_user_generator/services/api_service.dart';
import 'package:social_user_generator/utils/config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
  MobileAds.instance.initialize(),
  initialize(),
  // ApiService.instance.init(),
  ]);
  runApp(const SocialUsernameGeneratorApp());
}

class SocialUsernameGeneratorApp extends StatelessWidget {
  const SocialUsernameGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Config.appTitle,
      theme: ThemeData(
        textTheme: GoogleFonts.cairoTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SocialUsernameGeneratorScreen(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'),
      ],
      locale: const Locale('ar'),
    );
  }
}
