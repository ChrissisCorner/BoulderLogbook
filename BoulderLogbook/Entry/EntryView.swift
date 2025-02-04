//
//  EntryView.swift
//  BoulderLogbook
//
//  Created by Martin List on 14.07.22.
//

import SwiftUI
import ComposableArchitecture
import Charts

struct EntryView: View {
    let store: Store<EntryState, EntryAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            List {
                Section {
                    EntryViewChart(entry: viewStore.entry)
                }
                Section {
                    Button {
                        viewStore.send(.edit(viewStore.entry))
                    } label: {
                        Label {
                            Text("Edit")
                        } icon: {
                            Image(systemName: "pencil")
                        }
                    }
                    Button(role: .destructive) {
                        viewStore.send(.delete(viewStore.entry))
                    } label: {
                        Label {
                            Text("Delete")
                        } icon: {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle(Text(viewStore.entry.date, style: .date))
        }
    }
}

struct EntryViewChart: View {
    let entry: LogbookData.Entry
    
    var body: some View {
        Chart {
            ForEach(BoulderGrade.allCases.reversed(), id: \.self) { grade in
                BarMark(
                    x: .value("Grade", grade.gradeDescription),
                    y: .value("Tops", entry.numberOfGrades(for: grade))
                )
                .foregroundStyle(by: .value("Grade", grade.gradeDescription))
            }
        }
        .chartForegroundStyleScale([
            BoulderGrade.yellow.gradeDescription: BoulderGrade.yellow.color,
            BoulderGrade.green.gradeDescription: BoulderGrade.green.color,
            BoulderGrade.black.gradeDescription: BoulderGrade.black.color,
            BoulderGrade.orange.gradeDescription: BoulderGrade.orange.color,
            BoulderGrade.red.gradeDescription: BoulderGrade.red.color,
            BoulderGrade.blue.gradeDescription: BoulderGrade.blue.color
        ])
        .chartLegend(.hidden)
        .frame(height: 200)
        .padding()
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EntryView(
                store: Store(
                    initialState: .init(entry: LogbookData.Entry.sampleEntries[0]),
                    reducer: entryReducer,
                    environment: EntryEnvironment()
                )
            )
        }
    }
}
