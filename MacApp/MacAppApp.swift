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
    AppCenter.start(withAppSecret: "9ef8efca-f926-4422-aa50-aefb02f6832b", services: [
      Analytics.self,
      Crashes.self,
    ])

    
  }
