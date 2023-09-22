//
//  HomeView.swift
//  UberSwitftUITutorial
//
//  Created by kiet on 14/09/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var mapState = MapViewState.noInput
    
    var body: some View {
        ZStack(alignment: .top) {
            UberMapViewRepresentable(mapState: $mapState)
                .ignoresSafeArea()
            
            if mapState == .searchingForLocation {//show locationMapView
                LocationSearchView(mapState: $mapState)
            }
            else if mapState == .noInput{
                LocationSearchActivationView()// show activation view
                    .padding(.top, 60.0)
                    .onTapGesture {
                        withAnimation(.spring()){
                            mapState = .searchingForLocation
                        }
                    }

            }
            MapViewActionButton(mapState: $mapState)
                .padding(.leading)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
