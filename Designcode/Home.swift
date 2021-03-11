//
//  Home.swift
//  Designcode
//
//  Created by Curtis Lee on 11/03/2021.
//

import SwiftUI

struct Home: View {
    @State var showProfile = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all) // Prevents default space on top and bottom
            
            HomeView(showProfile: $showProfile) // The shared state value is then called here having been declared at the component level
                .padding(.top, 44)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .offset(y: showProfile ? -450 : 0)
                .rotation3DEffect(Angle(degrees: showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10, y: 0, z: 0))
                .scaleEffect(showProfile ? 0.9 : 1)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .background(Color.black.opacity(0.001)) // Makes it hidden, but keeps it interactive
                .offset(y: showProfile ? 0 : screen.height) // Will now offset y pos based on adapative screen height
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showProfile.toggle()
                }
            .gesture(
                DragGesture().onChanged { value in
                    self.viewState = value.translation
                }
                .onEnded { value in
                    if self.viewState.height > 50 {
                        self.showProfile = false
                    }
                    self.viewState = .zero
                }
            )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct AvatarView: View {
    // Binding declares a value in this component from another view
    // Creates a shared relationship between main view and component view state
    // This example delcares the need for a boolean state
    @Binding var showProfile: Bool
    
    var body: some View {
        Button(action: { self.showProfile.toggle() }) {
            Image("Avatar")
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        }
    }
}


// Helps you create dynamic sizing / spacing etc for different screen sizes
// By declaring this outside of the main body view, this constant can now be used in any file
let screen = UIScreen.main.bounds
