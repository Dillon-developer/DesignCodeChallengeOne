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
        VStack(spacing: 16) {
            MenuRow(title: "Account", icon: "gear")
            MenuRow(title: "Billing", icon: "creditcard")
            MenuRow(title: "Sign out", icon: "person.crop.circle")
        }
        .frame(maxWidth: .infinity)
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
                .imageScale(.large)
            
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)
        }
    }
}
