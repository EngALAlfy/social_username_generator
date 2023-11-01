import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:social_user_generator/screens/service_generate_screen.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(Config.appTitle),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      drawer: _appDrawer(),
      body: _appSocialBtns(),
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
        child: Container(
          // color: Colors.primaries.getRandomElement(),
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
                text,
                style: TextStyle(color: color), // Set the button text color
              ),
            ],
          ),
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
            DrawerHeader(
                decoration: const BoxDecoration(color: Colors.purple),
                child: Container(
                  height: 200,
                )),
            Expanded(
              child: LiveList(
                delay:  Duration.zero,
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

  Widget _drawerItem(String title, IconData icon, VoidCallback onTap,
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
            title,
            style:
                const TextStyle(color: Colors.white), // Set the item text color
          ),
          leading: Icon(
            icon,
            color: Colors.white, // Set the icon color
          ),
          onTap: onTap,
        ),
      ),
    );
  }

  _appSocialBtns() {
    return Center(
      child: LiveGrid(
        padding: const EdgeInsets.only(top: 0),
        delay: const Duration(seconds: 1),
        showItemInterval: const Duration(milliseconds: 400),
        itemBuilder:
            (BuildContext context, int index, Animation<double> animation) {
          var btn = Config.socialBtns.elementAt(index);
          return _buildSocialButton(
              btn["title"], btn["icon"], btn["name"], btn["color"], animation);
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
    );
  }
}
