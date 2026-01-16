//
//  OpenContentView.swift
//  CartySwift
//
//  Created by GZTD-03-01959 on 2025/12/31.
//

import SwiftUI
import Combine

struct OpenContentView: View {
    @ObservedObject var openController = OpenController();
    var body: some View {
        VStack(spacing: 20)
        {
            Text(openController.infoText)
            HStack(spacing: 25)
            {
                Button(action: {
                    print("loadAd");
                    openController.loadAd();
                }) {
                    Text("Load Ad")
                        .padding()
                }
                
                Button(action: {
                    openController.showAd();
                })
                {
                    Text("Show Ad")
                        .padding()
                }
            }
            
        }
        .navigationTitle("Open")
    }
}

#Preview {
    OpenContentView()
}
