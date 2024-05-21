//
//  DateDurationPicker.swift
//  DateDurationPicker
//
//  Created by Toomas Vahter on 29.01.2022.
//

import SwiftUI

struct FoodUnitsPicker: UIViewRepresentable {
    let selection: Binding<FoodUnits>
    let values: [Int]
    let units: [FoodUnits.Unit]
    
    func makeUIView(context: Context) -> UIPickerView {
        let pickerView = UIPickerView(frame: .zero)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.delegate = context.coordinator
        pickerView.dataSource = context.coordinator
        return pickerView
    }
    
    func updateUIView(_ uiView: UIPickerView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(selection: selection, values: values, units: units)
    }
    
    final class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
        let selection: Binding<FoodUnits>
        let values: [Int]
        let units: [FoodUnits.Unit]
        
        init(selection: Binding<FoodUnits>, values: [Int], units: [FoodUnits.Unit]) {
            self.selection = selection
            self.values = values
            self.units = units
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 2
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return component == 0 ? values.count : units.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if component == 0 {
                return "\(values[row])"
            }
            else {
                return units[row].rawValue
            }
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            let valueIndex = pickerView.selectedRow(inComponent: 0)
            let unitIndex = pickerView.selectedRow(inComponent: 1)
            selection.wrappedValue = FoodUnits(value: values[valueIndex], unit: units[unitIndex])
        }
    }
}

struct FoodUnits {
    let value: Int
    let unit: Unit
    
    enum Unit: String, CaseIterable {
        case grams, piece, tablespoon, teaspoon
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var selection = Binding(
        get: {
            FoodUnits(value: 1, unit: .grams)
        },
        set: { value in
            print(value)
        })
    
    static var previews: some View {
        FoodUnitsPicker(selection: selection, values: Array(1..<100), units: FoodUnits.Unit.allCases)
    }
}
