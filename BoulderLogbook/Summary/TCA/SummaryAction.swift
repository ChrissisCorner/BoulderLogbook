//
//  SummaryAction.swift
//  Mandala
//
//  Created by Martin List on 24.06.22.
//

import Foundation

enum SummaryAction: Equatable {
    case onAppear
    case fetch
    case receiveLogbookEntries(result: Result<LogbookData, Never>)
    case summarySectionAction(id: Double, action: SummarySectionAction)
}
