//
//  FirstAppApp.swift
//  FirstApp
//
//  Created by oognus on 2020/11/09.
//

import SwiftUI



@main
struct FirstApp: App {
    
    init() {
        print("__init__")
    }
    
    var body: some Scene {
        WindowGroup {
            TestView1()
//            LandmarkList()
//                .environmentObject(UserData())
        }
    }
}
