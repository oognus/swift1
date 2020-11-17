//
//  FirstAppApp.swift
//  FirstApp
//
//  Created by oognus on 2020/11/09.
//

import SwiftUI
//import PartialSheet

import PartialSheet


@main
struct FirstApp: App {
    
    init() {
        print("__init__")
    }
    
    let sheetManager: PartialSheetManager = PartialSheetManager()

    
    var body: some Scene {
        WindowGroup {
            TestView4()
//            TestView1()
//                .environmentObject(sheetManager)
//            LandmarkList()
//                .environmentObject(UserData())
        }
    }
}

struct FirstApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
