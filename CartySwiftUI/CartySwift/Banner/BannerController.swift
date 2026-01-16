//
//  BannerController.swift
//  CartySwiftUI
//
//  Created by GZTD-03-01959 on 2025/12/31.
//

import Foundation
import Combine
import CartySDK
import SwiftUI

class BannerController:NSObject,CTBannerAdDelegate,ObservableObject
{
    @Published var infoText:String = "";
    let bannerAd = CTBannerAd()
    override init() {
        super.init();
        bannerAd.placementid = "281217152640";
        bannerAd.bannerSize = CTBannerSizeType320x50;
        bannerAd.delegate = self;
    }
    func loadAd()
    {
        infoText = "Start load Ad"
        bannerAd.load();
    }
    
    func ctBannerAdDidLoad(_ ad: CTBannerAd) {
        infoText = "Ad loaded"
    }
    
    func ctBannerAdLoadFail(_ ad: CTBannerAd, withError error: any Error) {
        infoText = "Ad load fail \(error)"
    }
    
    func ctBannerAdDidShow(_ ad: CTBannerAd) {
        infoText = "Ad did show"
    }
    
    func ctBannerAdShowFail(_ ad: CTBannerAd, withError error: any Error) {
        infoText = "Ad show fail \(error)"
    }
    
    func ctBannerAdDidClick(_ ad: CTBannerAd) {
        infoText = "Ad click"
    }
    
    func ctBannerAdDidClose(_ ad: CTBannerAd) {
        infoText = "Ad close"
    }
}

struct BannerView: UIViewRepresentable
{
    typealias UIViewType = CTBannerAd
    let bannerController = BannerController()

    func makeUIView(context: Context) -> CTBannerAd {
        return bannerController.bannerAd;
    }

    func updateUIView(_ uiView: CTBannerAd, context: Context) {
        
    }
}
