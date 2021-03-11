//
//  HomeView.swift
//  Designcode
//
//  Created by Curtis Lee on 11/03/2021.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
                // The shared value is then called here having been declared at the component level
                AvatarView(showProfile: $showProfile)
            }
            .padding(.horizontal)
            .padding(.top, 30)
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false)) // This prevent the need to declare a state if there is no state present in the current view
    }
}
