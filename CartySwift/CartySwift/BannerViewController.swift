//
//  BannerViewController.swift
//  CartySwift
//
//  Created by GZTD-03-01959 on 2026/1/5.
//

import UIKit
import CartySDK

class BannerViewController: UIViewController,CTBannerAdDelegate
{
    @IBOutlet var infoLabel:UILabel?
    @IBOutlet var adView:UIView?
    let bannerAd = CTBannerAd()
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        if(adView != nil)
        {
            adView!.addSubview(bannerAd)
            bannerAd.center = CGPointMake(adView!.bounds.size.width/2.0, adView!.bounds.size.height/2.0)
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        bannerAd.placementid = "281217152640"
        bannerAd.rootViewController = self
        bannerAd.bannerSize = CTBannerSizeType320x50
        bannerAd.delegate = self
    }
    
    @IBAction func loadAd()
    {
        infoLabel?.text = "Start load Ad"
        bannerAd.load()
    }
    
    func ctBannerAdDidLoad(_ ad: CTBannerAd) {
        infoLabel?.text = "Ad loaded"
    }
    
    func ctBannerAdLoadFail(_ ad: CTBannerAd, withError error: any Error) {
        infoLabel?.text = "Ad load fail \(error)"
    }
    
    func ctBannerAdDidShow(_ ad: CTBannerAd) {
        infoLabel?.text = "Ad did show"
    }
    
    func ctBannerAdShowFail(_ ad: CTBannerAd, withError error: any Error) {
        infoLabel?.text = "Ad show fail \(error)"
    }
    
    func ctBannerAdDidClick(_ ad: CTBannerAd) {
        infoLabel?.text = "Ad click"
    }
    
    func ctBannerAdDidClose(_ ad: CTBannerAd) {
        infoLabel?.text = "Ad close"
    }
}
