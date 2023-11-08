import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:social_user_generator/utils/ad_helper.dart';

Widget adBanner({size = AdSize.banner}) {
  // make ad object
  final BannerAd myBanner = BannerAd(
    adUnitId: ADHelper.adBanner(),
    request: const AdRequest(),
    size: size,
    listener: const BannerAdListener(),
  );
  // load the ad
  myBanner.load();
  // make ad widget
  final AdWidget adWidget = AdWidget(ad: myBanner);
  // add it to container
  final Center adContainer = Center(child: Container(
    alignment: Alignment.center,
    width: myBanner.size.width.toDouble(),
    height: myBanner.size.height.toDouble(),
    child: Center(child: adWidget),
  ),);

  return adContainer;
}

adReward(Function callback) {
  RewardedAd.load(
    adUnitId: ADHelper.adReward(),
    request: const AdRequest(),
    rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (reward) {
      reward.fullScreenContentCallback =
          FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
            ad.dispose();
          }, onAdFailedToShowFullScreenContent: (ad, error) {
            ad.dispose();
          });

      reward.show(
        onUserEarnedReward: (ad, reward) {
          callback();
        },
      );
    }, onAdFailedToLoad: (error) {
      if (kDebugMode) {
        print("11223 ad error : $error");
      }
    }),
  );
}

adFull() {
  InterstitialAd.load(
    adUnitId: ADHelper.adFull(),
    request: const AdRequest(),
    adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
      ad.fullScreenContentCallback =
          FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
            ad.dispose();
          }, onAdFailedToShowFullScreenContent: (ad, error) {
            ad.dispose();
          });

      ad.show();
    }, onAdFailedToLoad: (error) {
      if (kDebugMode) {
        print("11435523 ad error : $error");
      }
    }),
  );


}
