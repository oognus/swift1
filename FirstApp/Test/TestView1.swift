//
//  TestView1.swift
//  FirstApp
//
//  Created by oognus on 2020/11/11.
//

import SwiftUI
import PartialSheet

struct TestView1: View {
    
//    @EnvironmentObject var partialSheet: PartialSheetManager
    @State private var showModal: Bool = false
    var body: some View {
        
        Button(action: {
            self.showModal = true
        }, label: {
            Text("Button")
        })
        .sheet(isPresented: $showModal, content: {
            TestView2()
        })


//        VStack {
//            Button(
//                action: {
//                    self.partialSheet.showPartialSheet {
//                        AnimationSheetView()
//                    }
//                },
//                label: {
//                    Text("Show Partial Sheet")
//                }
//            )
//        }
    }
}

struct AnimationSheetView: View {
    
    @State private var explicitScale: CGFloat = 1
    @State private var implicitScale: CGFloat = 1
    @State private var noScale: CGFloat = 1
    
    var body: some View {
        VStack {
          Text("Tap to animate explicitly")
            .padding()
            .background(Color.green)
            .cornerRadius(5)
            .scaleEffect(explicitScale)
            .onTapGesture {
              withAnimation {
                explicitScale = CGFloat.random(in: 0.5..<1.5)
              }
            }
            
            Text("Tap to animate implicitly")
              .padding()
              .background(Color.orange)
              .cornerRadius(5)
              .scaleEffect(implicitScale)
              .animation(.default)
              .onTapGesture {
                implicitScale = CGFloat.random(in: 0.5..<1.5)
              }
            
            Text("Tap to change with no animation")
              .padding()
              .background(Color.red)
              .cornerRadius(5)
              .scaleEffect(noScale)
              .onTapGesture {
                noScale = CGFloat.random(in: 0.5..<1.5)
              }
        }
      }
}

struct TestView1_Previews: PreviewProvider {
    static var previews: some View {
        TestView1()
    }
}
