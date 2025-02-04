//
//  AppState.swift
//  Mandala
//
//  Created by Martin List on 24.06.22.
//

import Foundation
import ComposableArchitecture

struct AppState: Equatable {
    var summaryState: SummaryState = SummaryState()
    var formState: FormState?
    var isPresentingForm: Bool = false
    var path: [Store<EntryState, EntryAction>] = []
}
