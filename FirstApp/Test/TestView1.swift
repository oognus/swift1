//
//  TestView1.swift
//  FirstApp
//
//  Created by oognus on 2020/11/11.
//

import SwiftUI

struct TestView1: View {
    @State var showingProfile = false
    
    var body: some View {
        NavigationView {
            VStack {
//                Text("Hello World")
//                NavigationLink(destination: TestView2()) {
//                    Text("Do Something")
//                }
                Button(action: { self.showingProfile.toggle() }) {
                    Text("BTN")
                }
                
                Text("Hello World")
                    .sheet(isPresented: $showingProfile) {
                        TestView2()
                    }
            }
        }
        

//        .sheet(isPresented: $showingProfile) {
//            ProfileHost()
//                .environmentObject(self.userData)
//        }
        
    }
}

struct TestView1_Previews: PreviewProvider {
    static var previews: some View {
        TestView1()
    }
}
