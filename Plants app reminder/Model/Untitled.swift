//
//  Untitled.swift
//  Planto
//
//  Created by Reem Abdullah Alnkhali  on 22/04/1446 AH.
//

import Foundation

struct Reminder: Identifiable {
    var id = UUID() // Unique identifier
    var plantName: String
    var selectedRoom: String
    var selectedLight: String
    var selectedWateringDays: String
    var selectedWater: String
    var isCompleted: Bool = false

    }

