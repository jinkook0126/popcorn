package com.popcon;

import android.util.Log;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.igaworks.ssp.AdPopcornSSP;
import com.igaworks.ssp.SSPErrorCode;
import com.igaworks.ssp.part.interstitial.AdPopcornSSPInterstitialAd;
import com.igaworks.ssp.part.interstitial.listener.IInterstitialLoadEventCallbackListener;
import com.igaworks.ssp.part.interstitial.listener.IInterstitialShowEventCallbackListener;
import com.igaworks.ssp.part.video.AdPopcornSSPInterstitialVideoAd;
import com.igaworks.ssp.part.video.listener.IInterstitialVideoAdEventCallbackListener;

public class RNPopconModule extends ReactContextBaseJavaModule {
    private static ReactApplicationContext reactContext;
    private AdPopcornSSPInterstitialAd interstitialAd;
    private AdPopcornSSPInterstitialVideoAd interstitialVideoAd;


    RNPopconModule (ReactApplicationContext context) {
        super(context);
        reactContext = context;
        interstitialAd = new AdPopcornSSPInterstitialAd(context);
        interstitialVideoAd= new AdPopcornSSPInterstitialVideoAd (context);
        interstitialAd.setPlacementId("INTERSTITIAL");
        interstitialVideoAd.setPlacementId("VIDEO");
    }

    @ReactMethod
    public void init(){
        Log.d("jinqook","init!");
        if(!AdPopcornSSP.isInitialized(reactContext.getCurrentActivity())) {
            AdPopcornSSP.init(reactContext.getCurrentActivity());
        }
    }

    @ReactMethod
    public void video(){
        interstitialVideoAd.setNetworkScheduleTimeout(10);
        interstitialVideoAd.setEventCallbackListener(new IInterstitialVideoAdEventCallbackListener() {
            @Override
            public void OnInterstitialVideoAdLoaded() {
                interstitialVideoAd.showAd();
                Log.d("jinqook","비디오 로드");
            }

            @Override
            public void OnInterstitialVideoAdLoadFailed(SSPErrorCode sspErrorCode) {
                Log.d("jinqook","비디오 에러: "+sspErrorCode.getErrorMessage());
            }

            @Override
            public void OnInterstitialVideoAdOpened() {
                Log.d("jinqook","비디오 오픈");
            }

            @Override
            public void OnInterstitialVideoAdOpenFalied() {
                Log.d("jinqook","비디오 오픈실패...");
            }

            @Override
            public void OnInterstitialVideoAdClosed() {

            }

            @Override
            public void OnInterstitialVideoAdClicked() {

            }
        });
        interstitialVideoAd.loadAd();
    }


    @ReactMethod
    public void feed(){
        Log.d("jinqook","feed!");
        interstitialAd.setCurrentActivity(reactContext.getCurrentActivity());
        interstitialAd.setInterstitialLoadEventCallbackListener(new IInterstitialLoadEventCallbackListener(){

            @Override
            public void OnInterstitialLoaded() {
                interstitialAd.showAd();
                Log.d("jinqook","로드 완료");
            }

            @Override
            public void OnInterstitialReceiveFailed(SSPErrorCode sspErrorCode) {
                Log.d("jinqook","로드 실패 : "+sspErrorCode);

            }
        });
        interstitialAd.setInterstitialShowEventCallbackListener(new IInterstitialShowEventCallbackListener() {

            @Override
            public void OnInterstitialOpened() {
                Log.d("jinqook","AD 오픈");
            }

            @Override
            public void OnInterstitialOpenFailed(SSPErrorCode errorCode) {
                Log.d("jinqook","opened 에러 :"+errorCode.getErrorMessage());
            }

            @Override
            public void OnInterstitialClosed(int CloseEvent) {
                // UNKNOWN = 0;
                // CLICK_CLOSE_BTN = 1;
                // PRESSED_BACK_KEY = 2;
                // SWIPE_RIGHT_TO_LEFT = 3;
                // SWIPE_LEFT_TO_RIGHT = 4;
                // AUTO_CLOSE = 5;
            }

            @Override
            public void OnInterstitialClicked() {
            }
        });
        interstitialAd.loadAd();
    }

    @NonNull
    @Override
    public String getName() {
        return "RNPopcon";
    }
}
