//
//  MapViewActionButton.swift
//  UberSwitftUITutorial
//
//  Created by kiet on 16/09/2023.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState: MapViewState
    var body: some View {
        Button{
            withAnimation(.spring()){
                actionForState(mapState)
            }        } label: {
                Image(systemName:imageNameForState(mapState))
                .font(.title)//possible to use font for image
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .topLeading)
        
    }
    func actionForState(_ state: MapViewState){
        switch state {
        case .noInput:
            print("DEBUG: No Input")
        case .searchingForLocation:
            mapState = .noInput
        case .locationSelected:
            print("DEBUG: Clear Map View...")
            mapState = .noInput
        }
    }
    func imageNameForState(_ state: MapViewState) -> String{
        switch state {
        case .noInput:
            return "line.3.horizontal"
        case .searchingForLocation, .locationSelected:
            return "arrow.left"
        }
    }
}

struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(mapState: .constant(.noInput))
    }
}
