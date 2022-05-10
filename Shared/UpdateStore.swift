//
//  UpdateStore.swift
//  DesignCodeChallengeOne
//
//  Created by Dillon Lucas on 5/10/22.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
    
}

