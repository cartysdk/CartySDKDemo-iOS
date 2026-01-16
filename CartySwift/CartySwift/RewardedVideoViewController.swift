//
//  RewardedVideoViewController.swift
//  CartySwift
//
//  Created by GZTD-03-01959 on 2026/1/5.
//

import UIKit
import CartySDK

class RewardedVideoViewController: UIViewController , CTRewardedVideoAdDelegate
{
    @IBOutlet var infoLabel:UILabel?
    let rewardedVideoAd = CTRewardedVideoAd()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        rewardedVideoAd.placementid = "281217152650"
        rewardedVideoAd.delegate = self
    }
    
    @IBAction func loadAd()
    {
        infoLabel?.text = "Start load Ad"
        rewardedVideoAd.load()
    }
    
    @IBAction func showAd()
    {
        if(rewardedVideoAd.isReady())
        {
            infoLabel?.text = "Start show Ad"
            rewardedVideoAd.customRewardString = "customRewardString"
            rewardedVideoAd.show(self)
        }
        else
        {
            infoLabel?.text = "Ad not Ready"
        }
    }
    
    func ctRewardedVideoAdDidLoad(_ ad: CTRewardedVideoAd) {
        infoLabel?.text = "Ad loaded"
    }
    
    func ctRewardedVideoAdLoadFail(_ ad: CTRewardedVideoAd, withError error: any Error) {
        infoLabel?.text = "Ad load fail \(error)"
    }
    
    func ctRewardedVideoAdDidShow(_ ad: CTRewardedVideoAd) {
        infoLabel?.text = "Ad did show"
    }
    
    func ctRewardedVideoAdShowFail(_ ad: CTRewardedVideoAd, withError error: any Error) {
        infoLabel?.text = "Ad show fail \(error)"
    }
    
    func ctRewardedVideoAdDidClick(_ ad: CTRewardedVideoAd) {
        infoLabel?.text = "Ad click"
    }
    
    func ctRewardedVideoAdDidDismiss(_ ad: CTRewardedVideoAd) {
        if(infoLabel?.text == "Ad Rewarded")
        {
            infoLabel?.text = "Ad Rewarded & Ad close"
            return;
        }
        infoLabel?.text = " Ad close"
    }
    
    func ctRewardedVideoAdDidEarnReward(_ ad: CTRewardedVideoAd, rewardInfo: [AnyHashable : Any]) {
        infoLabel?.text = "Ad Rewarded"
    }
}
