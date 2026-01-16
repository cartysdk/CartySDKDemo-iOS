//
//  RewardedVideoController.swift
//  CartySwift
//
//  Created by GZTD-03-01959 on 2025/12/31.
//

import Foundation
import Combine
import CartySDK

class RewardedVideoController:NSObject,CTRewardedVideoAdDelegate,ObservableObject
{
    @Published var infoText:String = "";
    let rewardedVideoAd = CTRewardedVideoAd()
    override init() {
        super.init();
        rewardedVideoAd.placementid = "281217152650";
        rewardedVideoAd.delegate = self;
    }
    func loadAd()
    {
        infoText = "Start load Ad"
        rewardedVideoAd.load();
    }
    func showAd()
    {
        if(rewardedVideoAd.isReady())
        {
            infoText = "Start show Ad"
            rewardedVideoAd.customRewardString = "customRewardString";
            rewardedVideoAd.show()
        }
        else
        {
            infoText = "Ad not Ready"
        }
    }
    
    func ctRewardedVideoAdDidLoad(_ ad: CTRewardedVideoAd) {
        infoText = "Ad loaded"
    }
    
    func ctRewardedVideoAdLoadFail(_ ad: CTRewardedVideoAd, withError error: any Error) {
        infoText = "Ad load fail \(error)"
    }
    
    func ctRewardedVideoAdDidShow(_ ad: CTRewardedVideoAd) {
        infoText = "Ad did show"
    }
    
    func ctRewardedVideoAdShowFail(_ ad: CTRewardedVideoAd, withError error: any Error) {
        infoText = "Ad show fail \(error)"
    }
    
    func ctRewardedVideoAdDidClick(_ ad: CTRewardedVideoAd) {
        infoText = "Ad click"
    }
    
    func ctRewardedVideoAdDidDismiss(_ ad: CTRewardedVideoAd) {
        if(infoText == "Ad Rewarded")
        {
            infoText = "Ad Rewarded & Ad close"
            return;
        }
        infoText = " Ad close"
    }
    
    func ctRewardedVideoAdDidEarnReward(_ ad: CTRewardedVideoAd, rewardInfo: [AnyHashable : Any]) {
        infoText = "Ad Rewarded"
    }
}
