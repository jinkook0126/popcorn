//
//  Jinkook.m
//  Popcon
//
//  Created by 이진국 on 2022/11/23.
//

#import "Jinkook.h"
#import <React/RCTLog.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <AdSupport/AdSupport.h>
#import <AdPopcornSSP/AdPopcornSSP.h>
#import <AdPopcornSSP/AdPopcornSSPInterstitialAd.h>


@implementation Jinkook

#import <AdPopcornSSP/AdPopcornSSPInterstitialAd.h>

AdPopcornSSPInterstitialAd *_sspInterstitialAd;

- (id)init {
  RCTLogInfo(@"on Popcorn UIView Init!!");
  return self;
}

-(void) InitPop {
  RCTLogInfo(@"on Popcorn Init");
  _sspInterstitialAd = [[AdPopcornSSPInterstitialAd alloc] initWithKey:@"397261446" placementId:@"iOS_INTERSTITIAL" viewController:self];
  _sspInterstitialAd.delegate = self;
}

-(void) FeedPop {
  RCTLogInfo(@"on Popcorn Feed");
  if (@available(iOS 14.5, *)) {
      [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
        dispatch_async(dispatch_get_main_queue(), ^{
          [_sspInterstitialAd loadRequest];
        });
      }];
  } else {
    dispatch_async(dispatch_get_main_queue(), ^{
      [_sspInterstitialAd loadRequest];
    });
  }
}
//전면광고 델리게이트 구현
-(void)APSSPInterstitialAdLoadSuccess:(AdPopcornSSPInterstitialAd *)interstitialAd
{
  NSLog(@"InterstitialAd Loading Success");
  [_sspInterstitialAd presentFromViewController:self];
}

-(void)APSSPInterstitialAdLoadFail:(AdPopcornSSPInterstitialAd *)interstitialAd error:(AdPopcornSSPError *)error
{
  NSLog(@"InterstitialAd Loading Failed, ErrorCode : %@", error);
}

-(void)APSSPInterstitialAdClosed:(AdPopcornSSPInterstitialAd *)interstitialAd
{
  NSLog(@"InterstitialAd Closed");
}

-(void)APSSPInterstitialAdClicked:(AdPopcornSSPInterstitialAd *)interstitialAd
{
  NSLog(@"InterstitialAd Clicked");
}

@end
