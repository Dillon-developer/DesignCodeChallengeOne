//
//  UpdateList.swift
//  DesignCodeChallengeOne
//
//  Created by Dillon Lucas on 5/10/22.
//

import SwiftUI






struct UpdateList: View {
    
    var body: some View {
        
        NavigationView {
            
            List(updateData) { update in
                
                NavigationLink(destination: Text(update.text)) {
                    
                    HStack {
                        
                        Image(update.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .background(.black)
                            .cornerRadius(10)
                            .padding(.trailing, 4)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text(update.title)
                                .font(.system(size: 20, weight: .bold))
                            
                            Text(update.text)
                                .lineLimit(2)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Text(update.date)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 8)
                    
                }
            }
            .navigationTitle(Text("Updates"))
        }
        
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Card1", title: "SwiftUI Advanced", text: "Advanced Techniques in SwiftUI", date: "Jan 1"),
    Update(image: "Card2", title: "Webflow", text: "Design and Animate High flow landing pages", date: "Oct 17"),
    Update(image: "Card3", title: "ProtoPie", text: "Prototype Animations and Interactions Quickly", date: "Aug 27"),
    Update(image: "Card4", title: "SwiftUI", text: "Learn to code custom UIs", date: "Jun 26"),
    Update(image: "Card5", title: "Framer Playground", text: "Create powerful animations and interactions with the FramerX code editor", date: "Jul 11"),
]
