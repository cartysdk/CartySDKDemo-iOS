//
//  InterstitialViewController.swift
//  CartySwift
//
//  Created by GZTD-03-01959 on 2026/1/5.
//

import UIKit
import CartySDK

class InterstitialViewController: UIViewController,CTInterstitialAdDelegate
{
    @IBOutlet var infoLabel:UILabel?
    let interstitialAd = CTInterstitialAd()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        interstitialAd.placementid = "281217152620"
        interstitialAd.delegate = self
    }
    
    @IBAction func loadAd()
    {
        infoLabel?.text = "Start load Ad"
        interstitialAd.load()
    }
    
    @IBAction func showAd()
    {
        if(interstitialAd.isReady())
        {
            infoLabel?.text = "Start show Ad"
            interstitialAd.show(self)
        }
        else
        {
            infoLabel?.text = "Ad not Ready"
        }
    }
    
    func ctInterstitialAdDidLoad(_ ad: CTInterstitialAd) {
        infoLabel?.text = "Ad loaded"
    }
    
    func ctInterstitialAdLoadFail(_ ad: CTInterstitialAd, withError error: any Error) {
        infoLabel?.text = "Ad load fail \(error)"
    }
    
    func ctInterstitialAdDidShow(_ ad: CTInterstitialAd) {
        infoLabel?.text = "Ad did show"
    }
    
    func ctInterstitialAdShowFail(_ ad: CTInterstitialAd, withError error: any Error) {
        infoLabel?.text = "Ad show fail \(error)"
    }
    
    func ctInterstitialAdDidClick(_ ad: CTInterstitialAd) {
        infoLabel?.text = "Ad click"
    }
    
    func ctInterstitialAdDidDismiss(_ ad: CTInterstitialAd) {
        infoLabel?.text = "Ad close"
    }
}
