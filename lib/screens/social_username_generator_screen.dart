import 'package:auto_animated/auto_animated.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:social_user_generator/generated/assets.dart';
import 'package:social_user_generator/screens/service_generate_screen.dart';
import 'package:social_user_generator/utils/ads.dart';
import 'package:social_user_generator/utils/config.dart';
import 'package:social_user_generator/utils/extensions.dart';

class SocialUsernameGeneratorScreen extends StatefulWidget {
  const SocialUsernameGeneratorScreen({super.key});

  @override
  SocialUsernameGeneratorScreenState createState() =>
      SocialUsernameGeneratorScreenState();
}

class SocialUsernameGeneratorScreenState
    extends State<SocialUsernameGeneratorScreen> {
  @override
  Widget build(BuildContext context) {
    return DoublePressBackWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Config.appTitle.tr(context: context)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        drawer: _appDrawer(),
        body: _appSocialBtns(),
      ),
    );
  }

  Widget _buildSocialButton(
    String text,
    IconData icon,
    String service,
    Color color,
    Animation<double> animation,
  ) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      // And slide transition
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -0.1),
          end: Offset.zero,
        ).animate(animation),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(icon),
              onPressed: () {
                ServiceGenerateScreen(service: service).launch(context,
                    pageRouteAnimation:
                        PageRouteAnimation.values.getRandomElement());
              },
              iconSize: 48.0,
              color: color, // Set the button icon color
            ),
            const SizedBox(height: 8.0),
            Text(
              text.tr(),
              style: TextStyle(color: color), // Set the button text color
            ),
          ],
        ),
      ),
    );
  }

  _appDrawer() {
    return Drawer(
      child: Container(
        color: Colors.lightBlue,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              padding: EdgeInsets.zero,
              child: SizedBox(
                height: 150,
                child: Image.asset(Assets.imagesLogo , height: 100,width: 100),
              ),
            ),
            const Divider(thickness: 1.5,endIndent: 20,indent: 20),
            Expanded(
              child: LiveList(
                delay: Duration.zero,
                showItemInterval: const Duration(milliseconds: 200),
                showItemDuration: const Duration(milliseconds: 200),
                itemBuilder: (BuildContext context, int index,
                    Animation<double> animation) {
                  var item = Config.drawerItems.elementAt(index);
                  return _drawerItem(
                      item["title"], item["icon"], item["callback"], animation);
                },
                itemCount: Config.drawerItems.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(String title, IconData icon, Function(BuildContext) onTap,
      Animation<double> animation) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      // And slide transition
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -0.1),
          end: Offset.zero,
        ).animate(animation),
        child: ListTile(
          title: Text(
            title.tr(),
            style:
                const TextStyle(color: Colors.white), // Set the item text color
          ),
          leading: Icon(
            icon,
            color: Colors.white, // Set the icon color
          ),
          onTap: () {
            onTap(context);
          },
        ),
      ),
    );
  }

  _appSocialBtns() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            16.height,
            adBanner(),
            16.height,
            LiveGrid(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 0),
              showItemInterval: const Duration(milliseconds: 400),
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                var btn = Config.socialBtns.elementAt(index);
                return _buildSocialButton(btn["title"], btn["icon"],
                    btn["name"], btn["color"], animation);
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 1,
                mainAxisExtent: 150,
              ),
              itemCount: Config.socialBtns.length,
            ),
            16.height,
            adBanner(size: AdSize.mediumRectangle),
            20.height,
          ],
        ),
      ),
    );
  }
}
