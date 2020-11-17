//
//  TestView5.swift
//  FirstApp
//
//  Created by oognus on 2020/11/15.
//

import SwiftUI

struct TestView5<Content: View>: View {
    let content: Content
    init(@ViewBuilder content: () -> Content) {
        print("__5__")
        self.content = content()
    }
    
    var body: some View {
        content
    }
}

struct TestView5_Previews: PreviewProvider {
    static var previews: some View {
        TestView5{
            Text("!")
        }
    }
}
