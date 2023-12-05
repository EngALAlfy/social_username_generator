import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:social_user_generator/screens/result_screen.dart';
import 'package:social_user_generator/services/api_service.dart';
import 'package:social_user_generator/utils/ads.dart';
import 'package:social_user_generator/utils/config.dart';
import 'package:social_user_generator/utils/extensions.dart';
import 'package:social_user_generator/utils/toast_widget.dart';

class ServiceGenerateScreen extends StatefulWidget {
  final String service;

  const ServiceGenerateScreen({super.key, required this.service});

  @override
  State<ServiceGenerateScreen> createState() => _ServiceGenerateScreenState();
}

class _ServiceGenerateScreenState extends State<ServiceGenerateScreen> {
  int selectedLength = 8; // Default length
  bool useNumbers = true; // Default to include numbers
  bool useSpecialCharacters = false; // Default to exclude special characters
  String customWord = '';

  void _onLengthChanged(double value) {
    setState(() {
      selectedLength = value.toInt();
    });
  }

  void _onNumbersChanged(bool value) {
    setState(() {
      useNumbers = value;
    });
  }

  void _onSpecialCharactersChanged(bool value) {
    setState(() {
      useSpecialCharacters = value;
    });
  }

  void _onCustomWordChanged(String value) {
    setState(() {
      customWord = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayColor: Colors.blueGrey.withOpacity(0.4),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              "${Config.generateScreenTitle} ${widget.service.toUpperCase()}"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                16.height,
                adBanner(),
                16.height,
                 Text(
                  Config.usernameLength,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Slider(
                  value: selectedLength.toDouble(),
                  onChanged: _onLengthChanged,
                  min: 3,
                  max: 10,
                  divisions: 7,
                  label: selectedLength.toString(),
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      Config.includeNumbers,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Switch(
                      value: useNumbers,
                      onChanged: _onNumbersChanged,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      Config.includeSpecialCharacters,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Switch(
                      value: useSpecialCharacters,
                      onChanged: _onSpecialCharactersChanged,
                    ),
                  ],
                ),
                if (selectedLength > 3) ...[
                  const SizedBox(height: 20),
                   Text(
                    Config.enterCustomWord,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      autofocus: false,
                      maxLength: selectedLength <= 3 ? 2 : selectedLength - 3,
                      maxLines: 1,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                      onChanged: _onCustomWordChanged,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'[^a-zA-Z]')),
                      ],
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                      // Set font size and color
                      decoration: InputDecoration(
                        hintText: Config.customWord,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          // Set border radius
                          borderSide: const BorderSide(
                              color: Colors.grey), // Set border color
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          // Set border radius
                          borderSide: const BorderSide(
                              color: Colors.grey), // Set border color
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          // Set border radius
                          borderSide: const BorderSide(
                              color: Colors.blue), // Set border color on focus
                        ),
                      ),
                    ),
                  ),
                ],
                adBanner(),
                const SizedBox(height: 40),
                Center(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      await showFullAds();

                      context.loaderOverlay.show();

                      var result = generateUsernames();
                      if (result == null) {
                        return;
                      }

                      List<Map<String, bool>> verified =
                          await confirmResult(result);

                      if (mounted) {
                        context.loaderOverlay.hide();

                        ResultScreen(service: widget.service, result: verified)
                            .launch(context,
                                pageRouteAnimation: PageRouteAnimation.values
                                    .getRandomElement());
                      }
                    },
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    // Add your desired icon
                    label:  Text(
                      Config.generate,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blue), // Set button color
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0), // Set border radius
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24), // Set padding
                      ),
                    ),
                  ),
                ),
                16.height,
                adBanner(),
                16.height,
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String>? generateUsernames() {
    List<String> usernames = [];
    if (selectedLength <= 3) {
      customWord = "";
    }

    int baseLength = selectedLength;
    // get the base length without numbers or special characters
    if (useSpecialCharacters) {
      baseLength -= 1;
    }

    if (useNumbers) {
      baseLength -= 2;
    }

    if (customWord.isNotEmpty) {
      if (customWord.length > baseLength) {
        ToastWidget.showToast(
            context: context,
            text:
                "عند اضافة كلمة مخصصة يجب مراعاه الطول حيث 2 للارقام و 1 للعناصر الخاصة");
        return null;
      }

      baseLength -= customWord.length;
    }

    for (int i = 0; i < 5; i++) {
      String randomString = generateRandomString(baseLength);

      if (useSpecialCharacters) {
        randomString += '._'.getRandomChar();
      }

      if (useNumbers) {
        // Add a random number between 10 and 99 to the string
        randomString += (Random.secure().nextInt(89) + 10).toString();
      }

      if (customWord.isNotEmpty) {
        randomString = '$customWord$randomString';
      }

      usernames.add(randomString);
    }

    return usernames;
  }

  // Helper function to generate a random string of a specified length
  String generateRandomString(int length) {
    const characters = 'abcdefghijklmnopqrstuvwxyz';
    String randomString = '';
    for (int i = 0; i < length; i++) {
      randomString +=
          characters[DateTime.now().microsecondsSinceEpoch % characters.length];
    }
    return randomString;
  }

  Future<List<Map<String, bool>>> confirmResult(List<String> result) async {
    List<Map<String, bool>> verifyResult =
        result.map((e) => {e: false}).toList();
    if (ApiService.instance.canVerify) {
      var futures = result.map((username) =>
          ApiService.instance.confirmUsername(widget.service, username));
      verifyResult = await Future.wait(futures);
    }

    return verifyResult;
  }
}
