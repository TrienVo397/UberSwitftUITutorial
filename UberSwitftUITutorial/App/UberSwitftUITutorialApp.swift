//
//  UberSwitftUITutorialApp.swift
//  UberSwitftUITutorial
//
//  Created by kiet on 14/09/2023.
//

import SwiftUI

@main
struct UberSwitftUITutorialApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView(showLocationSearchView: .constant(false))
                .environmentObject(locationViewModel)// allow to utilize this singular instance of the locationSearchViewModel(note that @StateObject var locationViewModel = LocationSearchViewModel() shows in LocationSearchView and UberMapViewRepresentable so this environmentObject to bind them to be used across multiple places in the app
            // this is call CASTING
        }
    }
}
