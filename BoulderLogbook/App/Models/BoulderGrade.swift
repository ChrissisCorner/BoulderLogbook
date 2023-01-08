//
//  BoulderGrade.swift
//  Mandala
//
//  Created by Martin List on 25.06.22.
//

import Foundation
import SwiftUI

enum BoulderGrade: Int, Codable, CaseIterable {
    case yellow
    case orange
    case blue
    case green
    case red
    case black
    
    var gradeDescription: String {
        switch self {
        case .yellow: return "Yellow"
        case .orange: return "Orange"
        case .blue: return "Blue"
        case .green: return "Green"
        case .red: return "Red"
        case .black: return "Black"

        }
    }
    
    var color: Color {
        switch self {
        case .blue: return .kletterarenaBlue
        case .red: return .kletterarenaRed
        case .orange: return .kletterarenaOrange
        case .black: return .kletterarenaBlack
        case .yellow: return .kletterarenaYellow
        case .green: return .kletterarenaGreen
        }
    }
    
    static var chartForegroundStyleScale: KeyValuePairs<String, Color> = [
        BoulderGrade.yellow.gradeDescription: BoulderGrade.yellow.color,
        BoulderGrade.green.gradeDescription: BoulderGrade.green.color,
        BoulderGrade.black.gradeDescription: BoulderGrade.black.color,
        BoulderGrade.orange.gradeDescription: BoulderGrade.orange.color,
        BoulderGrade.red.gradeDescription: BoulderGrade.red.color,
        BoulderGrade.blue.gradeDescription: BoulderGrade.blue.color
    ]
}
