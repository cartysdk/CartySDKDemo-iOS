//
//  OpenViewController.swift
//  CartySwift
//
//  Created by GZTD-03-01959 on 2026/1/5.
//

import UIKit
import CartySDK

class OpenViewController: UIViewController, CTAppOpenAdDelegate
{
    @IBOutlet var infoLabel:UILabel?
    let openAd = CTAppOpenAd()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        openAd.placementid = "281217152630"
        openAd.delegate = self
    }
    
    @IBAction func loadAd()
    {
        infoLabel?.text = "Start load Ad"
        openAd.load();
    }
    
    @IBAction func showAd()
    {
        if(openAd.isReady())
        {
            infoLabel?.text = "Start show Ad"
            openAd.show(self)
        }
        else
        {
            infoLabel?.text = "Ad not Ready"
        }
    }
    
    func ctOpenAdDidLoad(_ ad: CTAppOpenAd) {
        infoLabel?.text = "Ad loaded"
    }
    
    func ctOpenAdLoadFail(_ ad: CTAppOpenAd, withError error: any Error) {
        infoLabel?.text = "Ad load fail \(error)"
    }
    
    func ctOpenAdDidShow(_ ad: CTAppOpenAd) {
        infoLabel?.text = "Ad did show"
    }
    
    func ctOpenAdShowFail(_ ad: CTAppOpenAd, withError error: any Error) {
        infoLabel?.text = "Ad show fail \(error)"
    }
    
    func ctOpenAdDidClick(_ ad: CTAppOpenAd) {
        infoLabel?.text = "Ad click"
    }
    
    func ctOpenAdDidDismiss(_ ad: CTAppOpenAd) {
        infoLabel?.text = "Ad close"
    }
}
