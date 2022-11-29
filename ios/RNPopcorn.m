////
////  RNPopcorn.m
////  Popcon
////
////  Created by 이진국 on 2022/11/17.
////
//
//#import "RNPopcorn.h"
//#import <React/RCTLog.h>
//#import <AppTrackingTransparency/AppTrackingTransparency.h>
//#import <AdSupport/AdSupport.h>
//#import <AdPopcornSSP/AdPopcornSSP.h>
//#import <AdPopcornSSP/AdPopcornSSPInterstitialAd.h>
//
//
//@implementation RNPopcorn
//
//AdPopcornSSPInterstitialAd *_sspInterstitialAd;
//
//RCT_EXPORT_MODULE(RNPopcon)
//
//+ (BOOL)requiresMainQueueSetup
//{
//  return YES;
//}
//
//- (id)init {
//  RCTLogInfo(@"on Popcorn Init!!");
//
//  if (@available(iOS 14.5, *)) {
//      [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//          _sspInterstitialAd = [[AdPopcornSSPInterstitialAd alloc] initWithKey:@"397261446" placementId:@"iOS_INTERSTITIAL" viewController:self];
//          _sspInterstitialAd.delegate = self;
//        });
//      }];
//  } else {
//    dispatch_async(dispatch_get_main_queue(), ^{
//      _sspInterstitialAd = [[AdPopcornSSPInterstitialAd alloc] initWithKey:@"397261446" placementId:@"iOS_INTERSTITIAL" viewController:self];
//      _sspInterstitialAd.delegate = self;
//    });
//  }
//
//  return self;
//}
//
//RCT_EXPORT_METHOD(logTest)
//{
//  RCTLogInfo(@"여기서부터 시작이지~");
//}
//
//RCT_EXPORT_METHOD(initPopcorn)
//{
//  RCTLogInfo(@"ad popcorn initialize ");
////  [AdPopcornSSP sharedInstance].initializeDelegate = self;
////  [AdPopcornSSP initializeSDK:@"397261446"];
//}
//
//RCT_EXPORT_METHOD(feed)
//{
//  RCTLogInfo(@"openFeed~~!");
//  [_sspInterstitialAd loadRequest];
////  [_sspInterstitialAd presentFromViewController:self];
//}
//
//
////전면광고 델리게이트 구현
//-(void)APSSPInterstitialAdLoadSuccess:(AdPopcornSSPInterstitialAd *)interstitialAd
//{
//  NSLog(@"InterstitialAd Loading Success");
//  [_sspInterstitialAd presentFromViewController:self];
//}
//
//-(void)APSSPInterstitialAdLoadFail:(AdPopcornSSPInterstitialAd *)interstitialAd error:(AdPopcornSSPError *)error
//{
//  NSLog(@"InterstitialAd Loading Failed, ErrorCode : %@", error);
//}
//
//-(void)APSSPInterstitialAdClosed:(AdPopcornSSPInterstitialAd *)interstitialAd
//{
//  NSLog(@"InterstitialAd Closed");
//}
//
//-(void)APSSPInterstitialAdClicked:(AdPopcornSSPInterstitialAd *)interstitialAd
//{
//  NSLog(@"InterstitialAd Clicked");
//}
//
//@end
