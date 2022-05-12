//
//  RingView.swift
//  DesignCodeChallengeOne
//
//  Created by Dillon Lucas on 5/12/22.
//

import SwiftUI

struct RingView: View {
    var color1 = Color.green
    var color2 = Color.cyan
    var color3 = Color.blue
    var width: CGFloat = 88
    var height: CGFloat = 88
    var percent: CGFloat = 67
    @Binding var show: Bool
    
    
    var body: some View {
        let multiplier = width / 44
        let progress = 1 - percent / 100
        
        return ZStack {
            Circle()
                .stroke(
                    .black.opacity(0.1),
                    style: StrokeStyle(lineWidth: 8 * multiplier)
                )
                .frame(width: width, height: height)
            
            
            
            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [color1, color2, color3]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
                )
                .rotationEffect(.degrees(90))
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(color: .blue.opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
                //.animation(.interpolatingSpring(stiffness: 1, damping: 1.0), value: show)
            
            
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
                .onTapGesture {
                    self.show.toggle()
                }
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
