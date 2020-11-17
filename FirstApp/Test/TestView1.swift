//
//  TestView1.swift
//  FirstApp
//
//  Created by oognus on 2020/11/11.
//

//test

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
//        Home()
//        BS()
    }
}

import BottomSheet

struct BS: View {
    @State var isPresented: Bool = false
    var body: some View {
        NavigationView {
            List(0..<20) {
                Text("\($0)")
            }
            .bottomSheet(isPresented: $isPresented, height: 300) {
                List(20..<40) { Text("\($0)") }
            }
            .navigationBarTitle("Bottom Sheet")
            .navigationBarItems(
                trailing: Button(action: { self.isPresented = true }) {
                    Text("Show")
                }
            )
        }
    }
}

import MapKit

struct Home: View {
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 13.086, longitude: 80.2789), latitudinalMeters: 10000, longitudinalMeters: 10000)
    @State var offset : CGFloat = 0
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
                   
           Map(coordinateRegion: $region)
               .ignoresSafeArea(.all, edges: .all)
           
           /// to read frame height...
           
           GeometryReader{reader in
           
               VStack{
                   
                   BottomSheet(offset: $offset, value: (-reader.frame(in: .global).height + 150))
                       .offset(y: reader.frame(in: .global).height - 140)
                   // adding gesture....
                       .offset(y: offset)
                       .gesture(DragGesture().onChanged({ (value) in
                           
                           withAnimation{
                               
                               // checking the direction of scroll....
                               
                               // scrolling upWards....
                               // using startLocation bcz translation will change when we drag up and down....
                               
                               if value.startLocation.y > reader.frame(in: .global).midX{
                                   
                                   if value.translation.height < 0 && offset > (-reader.frame(in: .global).height + 150){
                                       
                                       offset = value.translation.height
                                   }
                               }
                               
                               if value.startLocation.y < reader.frame(in: .global).midX{

                                   if value.translation.height > 0 && offset < 0{
                                       
                                       offset = (-reader.frame(in: .global).height + 150) + value.translation.height
                                   }
                               }
                           }
                           
                       }).onEnded({ (value) in
                           
                           withAnimation{
                               
                               // checking and pulling up the screen...
                               
                               if value.startLocation.y > reader.frame(in: .global).midX{
                                   
                                   if -value.translation.height > reader.frame(in: .global).midX{
                                       
                                       offset = (-reader.frame(in: .global).height + 150)
                                       
                                       return
                                   }
                                   
                                   offset = 0
                               }
                               
                               if value.startLocation.y < reader.frame(in: .global).midX{
                                   
                                   if value.translation.height < reader.frame(in: .global).midX{
                                       
                                       offset = (-reader.frame(in: .global).height + 150)
                                       
                                       return
                                   }
                                   
                                   offset = 0
                               }
                           }
                       }))
               }
           }
           .ignoresSafeArea(.all, edges: .bottom)
       })
   }
}

struct BottomSheet : View {
    @State var txt = ""
    @Binding var offset : CGFloat
    var value : CGFloat

    var body: some View{
       
        VStack{
           
            Capsule()
            .fill(Color.gray.opacity(0.5))
            .frame(width: 50, height: 5)
            .padding(.top)
            .padding(.bottom,5)

            HStack(spacing: 15){
               
                Image(systemName: "magnifyingglass")
                .font(.system(size: 22))
                .foregroundColor(.gray)

                TextField("Search Place", text: $txt) { (status) in
                   
                    withAnimation{
                       
                        offset = value
                    }
                } onCommit: {

                }

            }
            .padding(.vertical,10)
            .padding(.horizontal)
            // BlurView....
            // FOr Dark Mode Adoption....
            .background(BlurView(style: .systemMaterial))
            .cornerRadius(15)
            .padding()

            ScrollView(.vertical, showsIndicators: false, content: {
               
               LazyVStack(alignment: .leading, spacing: 15, content: {
                   ForEach(1...15, id: \.self) { count in
                       
                       Text("Searched Place")
                       
                       Divider()
                        .padding(.top,10)
                   }
               })
               .padding()
               .padding(.top)
            })
        }
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(15)
    }
}

struct BlurView : UIViewRepresentable {
    var style : UIBlurEffect.Style
    func makeUIView(context: Context) -> UIVisualEffectView{
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
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
