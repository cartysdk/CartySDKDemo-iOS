//
//  NativeView.swift
//  CartySwiftUI
//
//  Created by GZTD-03-01959 on 2026/3/2.
//

import Foundation
import UIKit
import SwiftUI
import CartySDK

struct NativeView: UIViewRepresentable
{
    typealias UIViewType = UIView
    var nativeController:NativeController
    @Binding var updateIndex: Int

    func makeUIView(context: Context) -> UIView{
        if(nativeController.nativeAd.isTemplate)
        {
            return nativeController.nativeAd.templateView!
        }
        else
        {
            return
              Bundle.main.loadNibNamed(
                "NativeTemplate",
                owner: nil,
                options: nil)?.first as! NativeTemplate
        }
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        let nativeAd = nativeController.nativeAd;
        if(nativeAd.isTemplate)
        {
            nativeAd.registerContainer(nativeAd.templateView!, withClickableViews: nil)
            return
        }
        let nativeTemplate:NativeTemplate = uiView as! NativeTemplate
        var array:[UIView] = NSMutableArray() as! [UIView];
        if(nativeTemplate.ctaLabel != nil)
        {
            nativeTemplate.ctaLabel!.text = nativeAd.ctaText;
            array.append(nativeTemplate.ctaLabel!);
        }
        if(nativeTemplate.titleLabel != nil)
        {
            nativeTemplate.titleLabel!.text = nativeAd.title;
            array.append(nativeTemplate.titleLabel!);
        }
        if(nativeTemplate.textLabel != nil)
        {
            nativeTemplate.textLabel!.text = nativeAd.desc;
            array.append(nativeTemplate.textLabel!);
        }
        if(nativeTemplate.iconImageView != nil && nativeAd.iconImageURL != nil)
        {
            fetchRemoteImage(urlStr: nativeAd.iconImageURL!,iconImageView:nativeTemplate.iconImageView!)
            array.append(nativeTemplate.iconImageView!);
            
        }
        if(nativeAd.mediaView != nil)
        {
            nativeTemplate.mainImageView!.addSubview(nativeAd.mediaView!);
            setFullLayOut(view: nativeAd.mediaView!);
            array.append(nativeTemplate.mainImageView!);
        }
        if(nativeTemplate.adChoiceImageView != nil)
        {
            nativeTemplate.adChoiceImageView!.addSubview(nativeAd.adChoiceView!);
            setFullLayOut(view: nativeAd.adChoiceView!);
            nativeAd.adChoiceView!.frame = nativeTemplate.adChoiceImageView!.bounds;
            array.append(nativeTemplate.adChoiceImageView!);
        }
        nativeAd.registerContainer(nativeTemplate, withClickableViews: array)
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
