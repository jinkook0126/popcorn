//
//  RNBridge.m
//  Popcon
//
//  Created by 이진국 on 2022/11/23.
//

#import "RNBridge.h"
#import <React/RCTLog.h>


@implementation RNBridge

Jinkook *jinkook;

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

- (id)init {
  RCTLogInfo(@"on Bridge Init!!");
  return self;
}

RCT_EXPORT_MODULE(RNBridge);

RCT_EXPORT_METHOD(jinkookInit)
{
  jinkook = [[Jinkook alloc] init];
  [jinkook InitPop];
}

RCT_EXPORT_METHOD(jinkookFeed)
{
  [jinkook FeedPop];
}

@end
