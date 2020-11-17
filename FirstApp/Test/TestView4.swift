//
//  TestView4.swift
//  FirstApp
//
//  Created by oognus on 2020/11/15.
//

import SwiftUI
import MapKit

struct TestView4_Previews: PreviewProvider {
    static var previews: some View {
        TestView4()
    }
}

struct TestView4: View {

    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 13.086, longitude: 80.2789), latitudinalMeters: 10000, longitudinalMeters: 10000)
    @State var offset: CGFloat = 0

    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            
            Map(coordinateRegion: $region)
                .ignoresSafeArea(.all, edges: .all)
            
            GeometryReader {reader in
                VStack {
                    BottomModal(offset: $offset, value: (-reader.frame(in: .global).height + 150))
                        .offset(y: reader.frame(in: .global).height - 150)
                        .offset(y: offset)
                        .animation(.spring())
                        .gesture(DragGesture().onChanged({ (value) in
                            if value.startLocation.y > reader.frame(in: .global).midX {
                                if value.translation.height < 0 && offset > (-reader.frame(in: .global).height + 150) {
                                    offset = value.translation.height
                                }
                            }
                            if value.startLocation.y < reader.frame(in: .global).midX {
                                if value.translation.height > 0 && offset < 0 {
                                    offset = (-reader.frame(in: .global).height + 150) + value.translation.height
                                }
                            }
                        }).onEnded({ (value) in
                            if value.startLocation.y > reader.frame(in: .global).midX {
                                
                                if -value.translation.height > reader.frame(in: .global).midX {
                                    offset = (-reader.frame(in: .global).height + 150)
                                    return
                                }
                                offset = 0
                            }
                            
                            if value.startLocation.y < reader.frame(in: .global).midX {
                                if value.translation.height < reader.frame(in: .global).midX {
                                    offset = (-reader.frame(in: .global).height + 150)
                                    return
                                }
                                offset = 0
                            }
                        }))
                }
            }
            .ignoresSafeArea(.all, edges: .bottom)
        })
        
    }
}

struct BottomModal: View {
    
    @State var txt: String = ""
    @Binding var offset: CGFloat
    var value: CGFloat
    
    var body: some View {
        VStack {
            Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(width: 50, height: 5)
                .padding(.top)
                .padding(.bottom, 5)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 22))
                    .foregroundColor(.gray)
                TextField("Search Place", text: $txt) { (status) in
                    withAnimation {
                        offset = value
                    }
                } onCommit: {
                    
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(15)
            .padding()
            
            ScrollView(.vertical, showsIndicators: false, content: {
                LazyVStack(alignment: .leading, spacing: 15, content: {
                    ForEach(1...10, id: \.self) { count in
                        /*@START_MENU_TOKEN@*/Text("Placeholder \(count)")/*@END_MENU_TOKEN@*/
                    }
                })
                .padding()
                .padding(.top)
            })
        }
        .background(Color.red)
    
    }
}


