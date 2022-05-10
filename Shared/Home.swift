//
//  Home.swift
//  DesignCodeChallengeOne
//
//  Created by Dillon Lucas on 5/9/22.
//

import Foundation
import SwiftUI

struct Home: View {
    
    @State var showProfile = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            
            Color
                .gray
                .opacity(0.5)
                .ignoresSafeArea(.all)
            
            HomeView(showProfile: $showProfile)
                .padding(.top, 44)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
                .offset(y: showProfile ? -450 : 0)
                .rotation3DEffect(.degrees(showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10, y: 0, z: 0))
                .scaleEffect(showProfile ? 0.9 : 1)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: showProfile)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: viewState)
                .ignoresSafeArea(.all)
            
            
            MenuView()
                .background(.black.opacity(0.001)) // This makes the element invisible but you can still interact
                //  if opacity is 0 then you can not interact with an element
                .offset(y: showProfile ? 0 : screen.height)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: showProfile)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: viewState)

                .onTapGesture {
                    self.showProfile.toggle()
                }
                .gesture(
                    DragGesture().onChanged { value in
                        self.viewState = value.translation
                        
                    }.onEnded { value in
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
        
        Group {
            Home()
                .previewInterfaceOrientation(.portrait)
            Home()
                .previewInterfaceOrientation(.portrait)
        }
    }
}

struct AvatarView: View {
    @Binding var showProfile: Bool
    var body: some View {
        Button(action: { self.showProfile.toggle() }) {
            Image("Avatar")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        }
    }
}

let screen = UIScreen.main.bounds
