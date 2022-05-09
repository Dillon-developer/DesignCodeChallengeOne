//
//  MenuView.swift
//  DesignCodeChallengeOne
//
//  Created by Dillon Lucas on 5/9/22.
//

import Foundation
import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16) {
                Text("Meng - 28% Complete")
                    .font(.caption)
                
                    Color
                    .white
                    .frame(width: 38, height: 6)
                    .cornerRadius(3)
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(.black.opacity(0.08))
                    .cornerRadius(3)
                    .frame(width: 150, height: 24)
                    .background(.black.opacity(0.1))
                    .cornerRadius(30)
                
                MenuRow(title: "Account", icon: "gear")
                MenuRow(title: "Billing", icon: "creditcard")
                MenuRow(title: "Sign out", icon: "person.crop.circle")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.9177305698, green: 0.9177305698, blue: 0.9177305698, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
            .padding(.horizontal, 30)
            .overlay(
                Image("Avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset(y: -150)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 20)
            )
        }
        .padding(.bottom, 30)
    }
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}



struct MenuRow: View {
    
    var title: String
    var icon: String
    
    
    var body: some View {
        HStack(spacing: 16) {
            
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large).foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
            
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)
        }
    }
}
