//
//  LocationSearchView.swift
//  UberSwitftUITutorial
//
//  Created by kiet on 16/09/2023.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var StartLocation = ""
    @Binding var showLocationSearchView: Bool
    @EnvironmentObject var locationViewModel: LocationSearchViewModel

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
                
                TextField("Where to?", text: $locationViewModel.queryFragment)
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
                    ForEach(locationViewModel.results, id: \.self){ result
                        in LocationSearchResultCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                locationViewModel.selectLocation(result)
                                showLocationSearchView.toggle()
                            }
                    }
                    
                }
            }
        }.background(.white)
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(showLocationSearchView: .constant(false))
    }
}
