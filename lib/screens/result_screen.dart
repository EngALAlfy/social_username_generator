import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:social_user_generator/utils/ads.dart';
import 'package:social_user_generator/utils/config.dart';
import 'package:social_user_generator/utils/toast_widget.dart';

class ResultScreen extends StatefulWidget {
  final List<Map<String , bool>> result;
  final String service;

  const ResultScreen({super.key, required this.result, required this.service});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${Config.resultScreenTitle} ${widget.service.toUpperCase()}"),
      ),
      body: LiveList(
        separatorBuilder: (context, index) {
          if(index == 1 || index == 3){
            return adBanner();
          }

          return const SizedBox();
        },
        padding: const EdgeInsets.only(top: 0),
        showItemInterval: const Duration(milliseconds: 400),
        itemCount: widget.result.length,
        itemBuilder:
            (BuildContext context, int index, Animation<double> animation) {
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
                child: _buildResultTile(widget.result.elementAt(index))),
          );
        },
      ),
    );
  }

  Widget _buildResultTile(Map<String , dynamic> username) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10), // Add rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Add shadow color
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // Add shadow offset
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
                    // color: username.values.first == true ? Colors.green : Colors.red,
                    gap: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Icon(username.values.first == true ? Icons.check : Icons.close_sharp , color: username.values.first == true ? Colors.green : Colors.red ,size: 30),
                        Text(
                          username.keys.first,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
                      await username.keys.first.copyToClipboard();
                      if (!context.mounted) return;
                      ToastWidget.showToast(context: context, text: Config.usernameCopied);
                    },
                    icon: const Icon(Icons.content_copy),
                    label:  Text(
                      Config.copy,
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      try{
                        adFull();
                        List<String> usernames = getStringListAsync("usernames") ?? [];
                        usernames.add(username.keys.first);
                        // check if username is exist
                        usernames = usernames.toSet().toList();
                        await setValue("usernames" , usernames);
                        if (!context.mounted) return;
                        ToastWidget.showToast(context: context, text: Config.usernameSaved);
                      }catch(e){
                        if (!context.mounted) return;
                        ToastWidget.showToast(context: context, text: Config.errorHappened,type: ToastType.error);
                      }
                    },
                    icon: const Icon(Icons.save),
                    label:  Text(
                      Config.save,
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
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
