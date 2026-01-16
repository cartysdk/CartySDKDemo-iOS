//
//  CartySwiftApp.swift
//  CartySwift
//
//  Created by GZTD-03-01959 on 2025/12/31.
//

import SwiftUI
import CartySDK

// Define your custom AppDelegate
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
      CartyADSDK.sharedInstance().userid = "test userid";
      CartyADSDK.sharedInstance().start("abc123") {
          print("CartySDK finish");
      }
    return true
  }
}

@main
struct CartySwiftApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate;
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
