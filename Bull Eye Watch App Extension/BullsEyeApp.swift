//
//  BullsEyeApp.swift
//  Bull Eye Watch App Extension
//
//  Created by  cindy on 2021/3/24.
//

import SwiftUI

@main
struct BullsEyeApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
