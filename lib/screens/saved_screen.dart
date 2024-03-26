import 'package:auto_animated/auto_animated.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:social_user_generator/utils/ads.dart';
import 'package:social_user_generator/utils/config.dart';
import 'package:social_user_generator/utils/toast_widget.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  List<String>? saved;

  @override
  void initState() {
    super.initState();
    saved = getStringListAsync("usernames") ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(Config.savedScreenTitle.tr()),
      ),
      body: saved == null || saved?.isEmpty == true
          ?  Center(
              child: Text(
                Config.noData.tr(),
                style: TextStyle(fontSize: 18),
              ),
            )
          : LiveList(
        separatorBuilder: (context, index) => adBanner(),
              padding: const EdgeInsets.only(top: 0),
              showItemInterval: const Duration(milliseconds: 400),
              itemCount: saved!.length,
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                return FadeTransition(
                  opacity: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(animation),
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, -0.1),
                      end: Offset.zero,
                    ).animate(animation),
                    child: _buildResultTile(saved!.elementAt(index)),
                  ),
                );
              },
            ),
    );
  }

  Widget _buildResultTile(String username) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: DottedBorderWidget(
                    gap: 10,
                    child: Text(
                      username,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(indent: 10, endIndent: 10, height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      adFull();
                      await username.copyToClipboard();
                      if (!context.mounted) return;
                      ToastWidget.showToast(
                        context: context,
                        text: Config.usernameCopied.tr(),
                      );
                    },
                    icon: const Icon(Icons.content_copy),
                    label:  Text(
                      Config.copy.tr(),
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      try {
                        List<String> usernames =
                            getStringListAsync("usernames") ?? [];
                        usernames.remove(username);
                        usernames = usernames.toSet().toList();
                        await setValue("usernames", usernames);

                        setState(() {
                          saved = getStringListAsync("usernames") ?? [];
                        });

                        if (!context.mounted) return;
                        ToastWidget.showToast(
                          context: context,
                          text: Config.usernameRemoved.tr(),
                        );
                      } catch (e) {
                        if (!context.mounted) return;
                        ToastWidget.showToast(
                          context: context,
                          text: Config.errorHappened.tr(),
                          type: ToastType.error,
                        );
                      }
                    },
                    icon: const Icon(Icons.delete),
                    label:  Text(
                      Config.remove.tr(),
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
