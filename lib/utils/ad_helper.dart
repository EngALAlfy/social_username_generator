import 'dart:io';

import 'package:flutter/foundation.dart';

class ADHelper{

  static const String _appIdAndroid = "ca-app-pub-6430891509102679~8319688193";
  static const String _appIdIOS = "ca-app-pub-4819873718844109~1515722377";

  static const String _adRewardAndroidDebug = "ca-app-pub-3940256099942544/5224354917";
  static const String _adFullAndroidDebug = "ca-app-pub-3940256099942544/1033173712";
  static const String _adBannerAndroidDebug = "ca-app-pub-3940256099942544/6300978111";

  static const String _adRewardAndroid = "ca-app-pub-6430891509102679/1024486257";
  static const String _adFullAndroid = "ca-app-pub-6430891509102679/4800079730" ;
  static const String _adBannerAndroid = "ca-app-pub-6430891509102679/5990954042";

  static const String _adRewardIOSDebug = "ca-app-pub-3940256099942544/1712485313";
  static const String _adFullIOSDebug = "ca-app-pub-3940256099942544/4411468910";
  static const String _adBannerIOSDebug = "ca-app-pub-3940256099942544/2934735716";

  static const String _adRewardIOS = "ca-app-pub-4819873718844109/3939130101";
  static const String _adFullIOS = "ca-app-pub-4819873718844109/4263946629";
  static const String _adBannerIOS = "ca-app-pub-4819873718844109/4525453460";

  static  String  adFull (){
    if(Platform.isIOS){
      if(kDebugMode){
        return _adFullIOSDebug;
      }else{
        return _adFullIOS;
      }
    }else if(Platform.isAndroid){
      if(kDebugMode){
        return _adFullAndroidDebug;
      }else{
        return _adFullAndroid;
      }
    }else{
      throw UnsupportedError("Ads Not Supported");
    }
  }

  static  String  adBanner (){
    if(Platform.isIOS){
      if(kDebugMode){
        return _adBannerIOSDebug;
      }else{
        return _adBannerIOS;
      }
    }else if(Platform.isAndroid){
      if(kDebugMode){
        return _adBannerAndroidDebug;
      }else{
        return _adBannerAndroid;
      }
    }else{
      throw UnsupportedError("Ads Not Supported");
    }

  }

  static  String  adReward () {
    if(Platform.isIOS){
      if(kDebugMode){
        return _adRewardIOSDebug;
      }else{
        return _adRewardIOS;
      }
    }else if(Platform.isAndroid){
      if(kDebugMode){
        return _adRewardAndroidDebug;
      }else{
        return _adRewardAndroid;
      }
    }else{
      throw UnsupportedError("Ads Not Supported");
    }
  }
}