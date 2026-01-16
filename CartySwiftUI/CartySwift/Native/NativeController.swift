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
    var iconImage:UIImage = UIImage()
    let nativeAd = CTNativeAd()
    
    override init() {
        super.init();
        nativeAd.placementid = "281217152610"
        nativeAd.delegate = self
    }
    
    func loadAd()
    {
        infoText = "Start load Ad"
        nativeAd.load();
    }
    
    func showAd()
    {
        if(nativeAd.isReady())
        {
            infoText = "Start show Ad"
            canShow = true;
        }
        else
        {
            infoText = "Ad not Ready"
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
