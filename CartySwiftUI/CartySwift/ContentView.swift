//
//  ContentView.swift
//  CartySwift
//
//  Created by GZTD-03-01959 on 2025/12/31.
//

import SwiftUI
import AppTrackingTransparency

struct ContentView: View {
    
    var body: some View {
        NavigationView
        {
            List()
            {
                NavigationLink(destination: NativeContentView())
                {
                    Text("Native")
                }
                NavigationLink(destination: BannerContentView())
                {
                    Text("Banner")
                }
                NavigationLink(destination: InterstitialContentView())
                {
                    Text("Interstitial")
                }
                NavigationLink(destination:RewardedVideoContentView())
                {
                    Text("RewardedVideo")
                }
                NavigationLink(destination: OpenContentView())
                {
                    Text("Open")
                }
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
            ATTrackingManager.requestTrackingAuthorization(completionHandler: {status in
                
            })
        }
    }
}

#Preview {
    ContentView()
}
