//
//  RewardedVideoContentView.swift
//  CartySwift
//
//  Created by GZTD-03-01959 on 2025/12/31.
//

import SwiftUI
import CartySDK
import Combine

struct RewardedVideoContentView: View {
    @ObservedObject var rewardedVideoController = RewardedVideoController();
    var body: some View {
        VStack(spacing: 20)
        {
            Text(rewardedVideoController.infoText)
            HStack(spacing: 25)
            {
                Button(action: {
                    print("loadAd");
                    rewardedVideoController.loadAd();
                }) {
                    Text("Load Ad")
                        .padding()
                }
                
                Button(action: {
                    rewardedVideoController.showAd();
                })
                {
                    Text("Show Ad")
                        .padding()
                }
            }
            
        }
        .navigationTitle("RewardedVideo")
    }
}

#Preview {
    RewardedVideoContentView()
}
