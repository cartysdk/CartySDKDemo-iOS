//
//  OpenController.swift
//  CartySwift
//
//  Created by GZTD-03-01959 on 2025/12/31.
//

import Foundation
import Combine
import CartySDK

class InterstitialController:NSObject,CTInterstitialAdDelegate,ObservableObject
{
    @Published var infoText:String = "";
    let interstitialAd = CTInterstitialAd()
    override init() {
        super.init();
        interstitialAd.placementid = "281217152620";
        interstitialAd.delegate = self;
    }
    func loadAd()
    {
        infoText = "Start load Ad"
        interstitialAd.load();
    }
    func showAd()
    {
        if(interstitialAd.isReady())
        {
            infoText = "Start show Ad"
            interstitialAd.show()
        }
        else
        {
            infoText = "Ad not Ready"
        }
    }
    
    func ctInterstitialAdDidLoad(_ ad: CTInterstitialAd) {
        infoText = "Ad loaded"
    }
    
    func ctInterstitialAdLoadFail(_ ad: CTInterstitialAd, withError error: any Error) {
        infoText = "Ad load fail \(error)"
    }
    
    func ctInterstitialAdDidShow(_ ad: CTInterstitialAd) {
        infoText = "Ad did show"
    }
    
    func ctInterstitialAdShowFail(_ ad: CTInterstitialAd, withError error: any Error) {
        infoText = "Ad show fail \(error)"
    }
    
    func ctInterstitialAdDidClick(_ ad: CTInterstitialAd) {
        infoText = "Ad click"
    }
    
    func ctInterstitialAdDidDismiss(_ ad: CTInterstitialAd) {
        infoText = "Ad close"
    }
}
