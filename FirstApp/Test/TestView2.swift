//
//  TestView2.swift
//  FirstApp
//
//  Created by oognus on 2020/11/11.
//

import SwiftUI

struct TestView2: View {
    @State private var bottomSheetShown = false
    
    var body: some View {
        GeometryReader { geometry in
            Color.green
                .ignoresSafeArea()
            TestView3(isOpen: self.$bottomSheetShown, maxHeight: geometry.size.height) {
                VStack {
                    Text("test1")
                    Text("test2")
                }

            }
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct TestView2_Previews: PreviewProvider {
    static var previews: some View {
        TestView2()
    }
}
