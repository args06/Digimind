//
//  CollapsibleWheelPicker.swift
//  MiniKita
//
//  Created by Esther Gabriel Trivena on 21/05/24.
//

import SwiftUI

struct CollapsibleWheelPicker<SelectionValue1,SelectionValue2, Content, Label>: View where SelectionValue1: Hashable,SelectionValue2: Hashable, Content: View, Label: View {
    @Binding var selection1: SelectionValue1
    @Binding var selection2: SelectionValue2
    @ViewBuilder let content: () -> Content
    @ViewBuilder let label: () -> Label

    var body: some View {
        CollapsibleView(label: label) {
            HStack{
                Picker(selection: $selection1, content: content) {
                    EmptyView()
                }
                .pickerStyle(.wheel)
                Picker(selection: $selection2, label: Text("Picker")) {
                    Text("gram").tag(1)
                    Text("piece").tag(2)
                    Text("Table Spoon").tag(3)
                    Text("Tea Spoon").tag(4)
                }
                .pickerStyle(.wheel)
            }
        }
    }
}
