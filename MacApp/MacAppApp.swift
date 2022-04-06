//
//  MacAppApp.swift
//  MacApp
//
//  Created by admin on 06/04/22.
//
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

import SwiftUI

@main
struct MacAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Start App Center
    AppCenter.start(withAppSecret: "<APP SECRET HERE>", services: [
      Analytics.self,
      Crashes.self,
    ])

    
  }
