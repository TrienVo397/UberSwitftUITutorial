//
//  HomeView.swift
//  UberSwitftUITutorial
//
//  Created by kiet on 14/09/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        UberMapViewRepresentable()
            .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
