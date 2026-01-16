//
//  NativeContentView.swift
//  CartySwift
//
//  Created by GZTD-03-01959 on 2025/12/31.
//

import SwiftUI

struct NativeContentView: View
{
    @ObservedObject var nativeController = NativeController();
    var body: some View {
        VStack(spacing: 20)
        {
            VStack()
            {
                if(nativeController.canShow)
                {
                    NativeView(nativeController: nativeController);
                }
            }
            .frame(width: 300,height: 250)
            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
            Text(nativeController.infoText)
                .frame(maxHeight: 44)
            HStack(spacing: 25)
            {
                Button(action: {
                    nativeController.loadAd()
                }) {
                    Text("Load Ad")
                        .padding()
                }
                
                Button(action: {
                    nativeController.showAd()
                })
                {
                    Text("Show Ad")
                        .padding()
                }
            }
            
        }
        .navigationTitle("Native")
    }
}


#Preview {
    NativeContentView()
}
