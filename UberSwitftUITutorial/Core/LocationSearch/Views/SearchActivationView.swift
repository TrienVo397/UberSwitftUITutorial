//
//  SearchActivationView.swift
//  UberSwitftUITutorial
//
//  Created by kiet on 16/09/2023.
//

import SwiftUI

struct SearchActivationView: View {
    var body: some View {
        HStack{
            
            Rectangle()
                .fill(Color.black)
                .frame(width: 8, height: 8)
                .padding(.horizontal)
            
            Text("Where to?")
                .foregroundColor(Color(.darkGray))
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64, height: 50)
        .background(
            Rectangle()
            .fill(Color.white)
            .shadow(color: .black,radius: 6)
            )
    }
}

struct SearchActivationView_Previews: PreviewProvider {
    static var previews: some View {
        SearchActivationView()
    }
}
