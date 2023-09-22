//
//  TabView.swift
//  UberSwitftUITutorial
//
//  Created by Trien Vo Hong on 22/09/2023.
//

import SwiftUI

struct TabView1: View{
    @Binding var showLocationSearchView: Bool
    var body: some View {
        
        TabView{
            HomeView(showLocationSearchView: $showLocationSearchView)
                .padding(.bottom, 8.0)
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
            Text("Weather")
                .tabItem {
                    Image(systemName: "sun.max.circle")
                    Text("Weather")
                }
            Text("Account")
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            
        }
        
    }
    
}

struct TabView1_Previews: PreviewProvider {
    static var previews: some View {
        TabView1(showLocationSearchView: .constant(false))
    }
}
