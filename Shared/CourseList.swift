//
//  CourseList.swift
//  DesignCodeChallengeOne
//
//  Created by Dillon Lucas on 5/13/22.
//

import SwiftUI

struct CourseList: View {
    @State var show = false
    @State var show2 = false
    
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 30.0) {
                CourseView(show: $show)
                    .frame(height: show ? screen.height : 280)
                    .frame(maxWidth: show ? .infinity : screen.width - 60)
                    
                GeometryReader { geometry in
                    CourseView(show: self.$show2)
                        .offset(y: self.show2 ? -geometry.frame(in: .global).minY : 0)
                }
                .frame(height: show2 ? screen.height : 280)
                .frame(maxWidth: show2 ? .infinity : screen.width - 60)
                
            }
            .frame(width: screen.width)
            
        }
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @Binding var show: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 30.0) {
                Text("Take your SwiftUl app to the App Store with advanced techniques like API date packages and eMS")
                
                Text("About this course")
                    .font(.title)
                    .bold()
                
                Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
            }
            .padding(30)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280, alignment: .top)
            .offset(y: show ? 460 : 0)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
            .opacity(show ? 1 : 0)
            
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("SwiftUI Advanced")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        Text("20 Sections")
                            .foregroundColor(.white.opacity(0.7))
                    }
                    Spacer()
                    ZStack {
                        Image("Logo1")
                            .opacity(show ? 0 : 1)
                        
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .frame(width: 36, height: 36)
                        .background(.black)
                        .clipShape(Circle())
                        .opacity(show ? 1 : 0)
                    }
                    
                }
                Spacer()
                Image("Card4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment: .top)
            }
            .padding(show ? 30 : 20)
            .padding(.top, show ? 30 : 0)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
            .background(.purple)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .purple.opacity(0.5), radius: 20, x: 0, y: 20)
            
            .onTapGesture {
//                withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
                    self.show.toggle()
                //}
                
                
        }
            
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: show)

        .edgesIgnoringSafeArea(.all)
        
    }
     
}
