//
//  UpdateStore.swift
//  Designcode
//
//  Created by Curtis Lee on 12/03/2021.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
