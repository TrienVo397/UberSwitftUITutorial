//
//  HomeView.swift
//  UberSwitftUITutorial
//
//  Created by kiet on 14/09/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var showLocationSearchView = false
    
    var body: some View {
        ZStack(alignment: .top) {
            UberMapViewRepresentable()
                .ignoresSafeArea()
            
            if showLocationSearchView {
                LocationSearchView()
            }
            else{
                LocationSearchActivationView()
                    .padding(.top, 60.0)
                    .onTapGesture {
                        withAnimation(.spring()){
                            showLocationSearchView.toggle()
                        }
                    }

            }
            MapViewActionButton(showLocationSearchView: $showLocationSearchView)
                .padding(.leading)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
