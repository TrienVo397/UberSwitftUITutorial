//
//  HomeView.swift
//  UberSwitftUITutorial
//
//  Created by kiet on 14/09/2023.
//

import SwiftUI

struct HomeView: View {
    @Binding var showLocationSearchView : Bool
    @State private var mapState = MapViewState.noInput
    
    var body: some View {
        ZStack(alignment: .top) {
            UberMapViewRepresentable()
                .ignoresSafeArea()
            
            if mapState == .noInput {
                LocationSearchView(showLocationSearchView: $showLocationSearchView)
            }
            else if mapState == .searchingForLocation{
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
        HomeView(showLocationSearchView: .constant(false))
    }
}
