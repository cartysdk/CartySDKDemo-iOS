//
//  BannerContentView.swift
//  CartySwift
//
//  Created by GZTD-03-01959 on 2025/12/31.
//

import SwiftUI

struct BannerContentView: View {
    let bannerView = BannerView();
    var body: some View {
        @ObservedObject var bannerController = bannerView.bannerController;
        VStack(spacing: 20)
        {
            bannerView.frame(width: 320,height: 50)
            Text(bannerController.infoText)
            Button(action: {
                print("loadAd and Show");
                bannerController.loadAd();
            }) {
                Text("Load Ad")
                    .padding()
            }
            
        }
        .navigationTitle("Banner")
    }
}

#Preview {
    BannerContentView()
}
