//
//  MedixenViewModel.swift
//  Medixen
//
//  Created by sergio shaon on 17/2/22.
//

import SwiftUI

class MedixenViewModel: ObservableObject{
    private(set) var medixen: MedixenModel
    init(_ meditation: MedixenModel) {
        medixen = meditation
    }

}
