//
//  NativeTemplateContentView.swift
//  CartySwift
//
//  Created by GZTD-03-01959 on 2025/12/31.
//

import SwiftUI

struct NativeTemplateContentView: View
{
    @ObservedObject var nativeController = NativeController();
    @State private var updateIndex:Int = 0
    
    var body: some View {
        VStack(spacing: 20)
        {
            VStack()
            {
                if(nativeController.canShow)
                {
                    NativeView(nativeController: nativeController,updateIndex: $updateIndex);
                }
            }
            .frame(width: UIScreen.main.bounds.width,height: 250)
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
                    if(nativeController.showAd())
                    {
                        updateIndex+=1
                    }
                })
                {
                    Text("Show Ad")
                        .padding()
                }
            }
            
        }
        .navigationTitle("Native")
        .onAppear()
        {
            nativeController.isTemplate = true;
            nativeController.setup()
        }
        .onDisappear()
        {
            nativeController.canShow = false;
            nativeController.infoText = "";
        }
    }
}


#Preview {
    NativeContentView()
}
