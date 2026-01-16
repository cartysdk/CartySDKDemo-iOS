//
//  NativeTemplate.swift
//  CartySwiftUI
//
//  Created by GZTD-03-01959 on 2026/1/5.
//

import Foundation
import UIKit
import SwiftUI
import CartySDK

class NativeTemplate : UIView
{
    @IBOutlet var mainImageView:UIImageView?
    @IBOutlet var iconImageView:UIImageView?
    @IBOutlet var adChoiceImageView:UIImageView?
    @IBOutlet var titleLabel:UILabel?
    @IBOutlet var textLabel:UILabel?
    @IBOutlet var ctaLabel:UILabel?
}


struct NativeView: UIViewRepresentable
{
    typealias UIViewType = NativeTemplate
    var nativeController:NativeController

    func makeUIView(context: Context) -> NativeTemplate{
        return
          Bundle.main.loadNibNamed(
            "NativeTemplate",
            owner: nil,
            options: nil)?.first as! NativeTemplate

    }

    func updateUIView(_ uiView: NativeTemplate, context: Context) {
        let nativeAd = nativeController.nativeAd;
        var array:[UIView] = NSMutableArray() as! [UIView];
        if(uiView.ctaLabel != nil)
        {
            uiView.ctaLabel!.text = nativeAd.ctaText;
            array.append(uiView.ctaLabel!);
        }
        if(uiView.titleLabel != nil)
        {
            uiView.titleLabel!.text = nativeAd.title;
            array.append(uiView.titleLabel!);
        }
        if(uiView.textLabel != nil)
        {
            uiView.textLabel!.text = nativeAd.desc;
            array.append(uiView.textLabel!);
        }
        if(uiView.iconImageView != nil && nativeAd.iconImageURL != nil)
        {
            fetchRemoteImage(urlStr: nativeAd.iconImageURL!,iconImageView:uiView.iconImageView!)
            array.append(uiView.iconImageView!);
            
        }
        if(nativeAd.mediaView != nil)
        {
            uiView.mainImageView!.addSubview(nativeAd.mediaView!);
            setFullLayOut(view: nativeAd.mediaView!);
            array.append(uiView.mainImageView!);
        }
        if(uiView.adChoiceImageView != nil)
        {
            uiView.adChoiceImageView!.addSubview(nativeAd.adChoiceView!);
            setFullLayOut(view: nativeAd.adChoiceView!);
            nativeAd.adChoiceView!.frame = uiView.adChoiceImageView!.bounds;
            array.append(uiView.adChoiceImageView!);
        }
        nativeAd.registerContainer(uiView, withClickableViews: array)
    }
    
    func fetchRemoteImage(urlStr:String,iconImageView:UIImageView)
    {
        guard let url = URL(string: urlStr) else { return }
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let image = UIImage(data: data!){
                DispatchQueue.main.async{
                    iconImageView.image = image
                }
            }
            else{
                print(error ?? "")
            }
        }.resume()
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
}
