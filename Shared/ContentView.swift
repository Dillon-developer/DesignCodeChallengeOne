//
//  ContentView.swift
//  Shared
//
//  Created by Dillon Lucas on 5/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default, value: show)
            
            BottomCardView()
                .blur(radius: show ? 20 : 0)
                .animation(.default, value: show)
            
            
            BackCardView()
                .background(Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotation3DEffect(.degrees(10), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5), value: viewState)
                .animation(.easeInOut(duration: 0.5), value: show)
            
            BackCardView()
                .background(Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotation3DEffect(.degrees(5), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3), value: viewState)
                .animation(.easeInOut(duration: 0.3), value: show)
                            
            CardView()
                .offset(x: viewState.width, y: viewState.height)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.2, dampingFraction: 0.6, blendDuration: 0), value: viewState)
                .onTapGesture { self.show.toggle() }
                .gesture(
                    DragGesture().onChanged { value in
                        self.viewState = value.translation
                        //self.show = true
                        
                    }
                    .onEnded {value in
                        self.viewState = .zero
                    }
                )
                    
                    
                
            
            
        }.onAppear {
            print(show)
        }
      }
            
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Certificate")
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo1")
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
        
        .frame(width: 340.0, height: 220.0)
        .background(.black)
        .cornerRadius(20)
        .shadow(radius: 20)
        // blend mode doesnt work correctly without the shadow radius
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width: 340, height: 220).blendMode(.hardLight)
        
        
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack() {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20){
            
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(20)
                .opacity(0.1)
            
            Text("the certified proof that Lucas has Completed the UI Design course with approval of their Design+Code Instructor.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(20)
        .shadow(radius: 20)
        .offset(x: 0, y: 500)
    }
}
