//
//  HomeView.swift
//  DesignCodeChallengeOne
//
//  Created by Dillon Lucas on 5/9/22.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @Binding var showProfile: Bool
    @State var showUpdate = false
    
    var body: some View {
        VStack {
            HStack{
                
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
                AvatarView(showProfile: $showProfile)
                
                Button(action: {self.showUpdate.toggle()}) {
                    Image(systemName: "bell")
                        .renderingMode(.original)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36, height: 36)
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
                    
                }
                .sheet(isPresented: $showUpdate) {
                    
                    UpdateList()
                }
                
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                WatchRingsView()
                    .padding(.horizontal, 30)
                    .padding(.bottom, 30)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 10, z: 0))
                            
                        }
                        .frame(width: 275, height: 275)
                    }
                }
                .padding(30)
                .padding(.bottom, 30)

            }
                
            
            Spacer()
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    var section: Section
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
                
            }
            
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
            
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct Section: Identifiable {
    
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
    
}
let sectionData = [
    Section(title: "Prototype designs in SwiftUI", text: "18 Sections", logo: "Logo1", image: Image("Card1"), color: Color("card1")),
    Section(title: "Building a SwiftUI App", text: "20 Sections", logo: "Logo2", image: Image("Card2"), color: Color("card2")),
    Section(title: "SwiftUI Advanced", text: "20 Sections", logo: "Logo3", image: Image("Card3"), color: Color("card3")),
    Section(title: "Extra Content", text: "5 Sections", logo: "Logo4", image: Image("Card4"), color: Color("card4")),
]

struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 30.0) {
            
            
            HStack(spacing: 12.0) {
                RingView(color1: Color.indigo, color2: Color.purple, color3: Color.indigo, width: 44, height: 44, percent: 89, show: .constant(true))
                
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("6 minutes left")
                        .bold()
                        .modifier(FontModifier(style: .subheadline))
                    
                    Text("Watched 10 mins today")
                        .modifier(FontModifier(style: .caption))
                    
                }
                
                
            }
            .padding(8)
            .background(.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 12.0) {
                RingView(color1: Color.blue, color2: Color.cyan, color3: Color.green, width: 32, height: 32, percent: 55, show: .constant(true))
                
                
            }
            .padding(8)
            .background(.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 12.0) {
                RingView(color1: Color.red, color2: Color.pink, color3: Color.red, width: 32, height: 32, percent: 20, show: .constant(true))
                
                
            }
            .padding(8)
            .background(.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
        }
    }
}
