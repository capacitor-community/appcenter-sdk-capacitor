//
//  AppCenterCapacitorSharedExampleApp.swift
//  AppCenterCapacitorSharedExample
//
//  Created by John Borges on 12/28/24.
//

import SwiftUI

import AppCenter
import AppCenterCapacitorShared

@main
struct AppCenterCapacitorSharedExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    AppCenterCapacitorShared.configureWithSettings()
                    AppCenter.logLevel = .verbose
                    AppCenter.enabled = true
                }
        }
    }
}
