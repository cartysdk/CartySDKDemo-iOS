//
//  InterstitialContentView.swift
//  CartySwift
//
//  Created by GZTD-03-01959 on 2025/12/31.
//

import SwiftUI

struct InterstitialContentView: View {
    @ObservedObject var interstitialController = InterstitialController();
    var body: some View {
        VStack(spacing: 20)
        {
            Text(interstitialController.infoText)
            HStack(spacing: 25)
            {
                Button(action: {
                    print("loadAd");
                    interstitialController.loadAd();
                }) {
                    Text("Load Ad")
                        .padding()
                }
                
                Button(action: {
                    interstitialController.showAd();
                })
                {
                    Text("Show Ad")
                        .padding()
                }
            }
            
        }
        .navigationTitle("Interstitial")
    }
}

#Preview {
    InterstitialContentView()
}
