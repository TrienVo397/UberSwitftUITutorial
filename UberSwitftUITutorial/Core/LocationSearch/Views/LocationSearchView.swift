//
//  LocationSearchView.swift
//  UberSwitftUITutorial
//
//  Created by kiet on 16/09/2023.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var StartLocation = ""
    @State private var destinationLocation = ""
    @StateObject var viewModel = LocationSearchViewModel()
    
    var body: some View {
        VStack{
            //header view
        HStack{
            VStack{
                Circle()
                    .fill(Color(.systemGray))
                    .frame(width: 6,height: 6)
                Rectangle()
                    .fill(Color(.systemGray))
                    .frame(width: 1,height: 24)
                Rectangle()
                    .fill(.black)
                    .frame(width: 6,height: 6)
                
            }
            VStack{
                TextField("Current location", text: $StartLocation)
                    .frame(height: 32)
                    .background(Color(.systemGroupedBackground))
                    .padding(.trailing)
                
                TextField("Where to?", text: $viewModel.queryFragment)
                    .frame(height: 32)
                    .background(Color(.systemGroupedBackground))
                    .padding(.trailing)
            }
        }
        .padding(.horizontal)
        .padding(.top, 64)
        
            Divider()
                .padding(.vertical)
          
            //list view
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(0..<20, id: \.self){ _
                        in LocationSearchResultCell()
                        
                        
                    }
                    
                }
            }
        }.background(.white)
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView()
    }
}
