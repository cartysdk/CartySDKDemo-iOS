//
//  NativeViewController.swift
//  CartySwift
//
//  Created by GZTD-03-01959 on 2026/1/5.
//

import UIKit
import CartySDK

class NativeViewController: UIViewController, CTNativeAdDelegate
{
    @IBOutlet var infoLabel:UILabel?
    @IBOutlet var adView:UIView?
    let nativeAd = CTNativeAd()
    var nativeView:NativeTemplate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nativeAd.placementid = "281217152610"
        nativeAd.rootViewController = self
        nativeAd.delegate = self
    }
    
    @IBAction func loadAd()
    {
        infoLabel?.text = "Start load Ad"
        nativeAd.load()
    }
    
    @IBAction func showAd()
    {
        if(!nativeAd.isReady())
        {
            infoLabel?.text = "Ad not Ready"
            return
        }
        
        infoLabel?.text = "Start show Ad"
        if(nativeView != nil)
        {
            nativeView?.removeFromSuperview()
        }
        nativeView = (Bundle.main.loadNibNamed(
            "NativeTemplate",
            owner: nil,
            options: nil)?.first as! NativeTemplate)
        if(nativeView == nil)
        {
            return
        }
        adView?.addSubview(nativeView!)
        setFullLayOut(view: nativeView!)
        var array:[UIView] = NSMutableArray() as! [UIView];
        if(nativeView!.ctaLabel != nil)
        {
            nativeView!.ctaLabel!.text = nativeAd.ctaText
            array.append(nativeView!.ctaLabel!)
        }
        if(nativeView!.titleLabel != nil)
        {
            nativeView!.titleLabel!.text = nativeAd.title
            array.append(nativeView!.titleLabel!)
        }
        if(nativeView!.textLabel != nil)
        {
            nativeView!.textLabel!.text = nativeAd.desc;
            array.append(nativeView!.textLabel!)
        }
        if(nativeView!.iconImageView != nil
           && nativeAd.iconImageURL != nil)
        {
            fetchRemoteImage(urlStr: nativeAd.iconImageURL!)
            array.append(nativeView!.iconImageView!)
        }
        if(nativeAd.mediaView != nil)
        {
            nativeView!.mainImageView!.addSubview(nativeAd.mediaView!)
            setFullLayOut(view: nativeAd.mediaView!)
            array.append(nativeView!.mainImageView!)
        }
        if(nativeView!.adChoiceImageView != nil)
        {
            nativeView!.adChoiceImageView!.addSubview(nativeAd.adChoiceView!)
            setFullLayOut(view: nativeAd.adChoiceView!)
            nativeAd.adChoiceView!.frame = nativeView!.adChoiceImageView!.bounds;
            array.append(nativeView!.adChoiceImageView!)
        }
        nativeAd.registerContainer(nativeView!, withClickableViews: array)
    }
    
    func setFullLayOut(view:UIView)
    {
        if(view.superview != nil)
        {
            view.translatesAutoresizingMaskIntoConstraints = false;
            let right = NSLayoutConstraint(item: view, attribute: .right, relatedBy:.equal, toItem:view.superview, attribute:.right, multiplier:1.0, constant: 0 )
            let left = NSLayoutConstraint(item: view, attribute: .left, relatedBy:.equal, toItem:view.superview, attribute:.left, multiplier:1.0, constant: 0 )
            let top = NSLayoutConstraint(item: view, attribute: .top, relatedBy:.equal, toItem:view.superview, attribute:.top, multiplier:1.0, constant: 0 )
            let bottom = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy:.equal, toItem:view.superview, attribute:.bottom, multiplier:1.0, constant: 0 )
            view.superview?.addConstraints([right,left,top,bottom])
        }
    }
    
    func fetchRemoteImage(urlStr:String)
    {
        guard let url = URL(string: urlStr) else { return }
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let image = UIImage(data: data!){
                DispatchQueue.main.async { [self] in
                    nativeView!.iconImageView?.image = image
                }
            }
            else{
                print(error ?? "")
            }
        }.resume()
    }
    
    func ctNativeAdDidLoad(_ ad: CTNativeAd) {
        infoLabel?.text = "Ad loaded"
    }
    
    func ctNativeAdLoadFail(_ ad: CTNativeAd, withError error: any Error) {
        infoLabel?.text = "Ad load fail \(error)"
    }
    
    func ctNativeAdDidShow(_ ad: CTNativeAd) {
        infoLabel?.text = "Ad did show"
    }
    
    func ctNativeAdShowFail(_ ad: CTNativeAd, withError error: any Error) {
        infoLabel?.text = "Ad show fail \(error)"
    }
    
    func ctNativeAdDidClick(_ ad: CTNativeAd) {
        infoLabel?.text = "Ad click"
    }
}
