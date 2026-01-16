//
//  OpenController.swift
//  CartySwift
//
//  Created by GZTD-03-01959 on 2025/12/31.
//

import Foundation
import Combine
import CartySDK

class OpenController:NSObject,CTAppOpenAdDelegate,ObservableObject
{
    @Published var infoText:String = "";
    let openAd = CTAppOpenAd()
    override init() {
        super.init();
        openAd.placementid = "281217152630";
        openAd.delegate = self;
    }
    func loadAd()
    {
        infoText = "Start load Ad"
        openAd.load();
    }
    func showAd()
    {
        if(openAd.isReady())
        {
            infoText = "Start show Ad"
            openAd.show()
        }
        else
        {
            infoText = "Ad not Ready"
        }
    }
    func ctOpenAdDidLoad(_ ad: CTAppOpenAd) {
        infoText = "Ad loaded"
    }
    
    func ctOpenAdLoadFail(_ ad: CTAppOpenAd, withError error: any Error) {
        infoText = "Ad load fail \(error)"
    }
    
    func ctOpenAdDidShow(_ ad: CTAppOpenAd) {
        infoText = "Ad did show"
    }
    
    func ctOpenAdShowFail(_ ad: CTAppOpenAd, withError error: any Error) {
        infoText = "Ad show fail \(error)"
    }
    
    func ctOpenAdDidClick(_ ad: CTAppOpenAd) {
        infoText = "Ad click"
    }
    
    func ctOpenAdDidDismiss(_ ad: CTAppOpenAd) {
        infoText = "Ad close"
    }
}
