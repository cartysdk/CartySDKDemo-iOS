//
//  NativeController.swift
//  CartySwiftUI
//
//  Created by GZTD-03-01959 on 2025/12/31.
//

import Foundation
import Combine
import CartySDK
import SwiftUI

class NativeController:NSObject,CTNativeAdDelegate,ObservableObject
{
    @Published var infoText:String = ""
    @Published var canShow:Bool = false
    var isTemplate:Bool = false;
    var iconImage:UIImage = UIImage()
    var nativeAd:CTNativeAd = CTNativeAd();
    
    func setup()
    {
        nativeAd = CTNativeAd();
        if(isTemplate)
        {
            nativeAd.placementid = "281217152611"
        }
        else
        {
            nativeAd.placementid = "281217152610"
        }
        nativeAd.delegate = self
        canShow = false;
    }
    
    func loadAd()
    {
        infoText = "Start load Ad"
        nativeAd.load();
    }
    
    func showAd() -> Bool
    {
        if(nativeAd.isReady())
        {
            infoText = "Start show Ad"
            canShow = true
            return true
        }
        else
        {
            infoText = "Ad not Ready"
            return false
        }
    }
    
    func ctNativeAdDidLoad(_ ad: CTNativeAd) {
        infoText = "Ad loaded"
    }
    
    func ctNativeAdLoadFail(_ ad: CTNativeAd, withError error: any Error) {
        infoText = "Ad load fail \(error)"
    }
    
    func ctNativeAdDidShow(_ ad: CTNativeAd) {
        infoText = "Ad did show"
    }
    
    func ctNativeAdShowFail(_ ad: CTNativeAd, withError error: any Error) {
        infoText = "Ad show fail \(error)"
    }
    
    func ctNativeAdDidClick(_ ad: CTNativeAd) {
        infoText = "Ad click"
    }
    
}
