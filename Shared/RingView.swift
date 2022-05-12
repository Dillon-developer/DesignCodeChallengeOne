//
//  RingView.swift
//  DesignCodeChallengeOne
//
//  Created by Dillon Lucas on 5/12/22.
//

import SwiftUI

struct RingView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    .black.opacity(0.1),
                    style: StrokeStyle(lineWidth: 8)
                )
                .frame(width: 44, height: 44)
            
            
            
            Circle()
                .trim(from: 0.3, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [.green, .cyan, .blue]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
                )
                .rotationEffect(.degrees(90))
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                .frame(width: 44, height: 44)
            .shadow(color: .blue.opacity(0.1), radius: 3, x: 0, y: 3)
            
            
            Text("82%")
                .font(.subheadline)
                .fontWeight(.bold)
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
