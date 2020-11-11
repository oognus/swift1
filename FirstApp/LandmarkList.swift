//
//  LandmarkList.swift
//  FirstApp
//
//  Created by oognus on 2020/11/09.
//

import SwiftUI

struct LandmarkList: View {
    
    var test: String = "TEST"
    
    init() {
        print("LandmarkListInit")
        
        test = "TTTT"
    }
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly, label: {
                    Text(self.test)
                })
                
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(UserData())
    }
}
