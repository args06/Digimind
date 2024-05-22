import SwiftUI

struct CollapsibleView<Label, Content>: View where Label: View, Content: View {
  @State private var isSecondaryViewVisible = false

  @ViewBuilder let label: () -> Label
  @ViewBuilder let content: () -> Content

  var body: some View {
    Group {
      Button(action: { isSecondaryViewVisible.toggle() }, label: label)
        .buttonStyle(.plain)
      if isSecondaryViewVisible {
        content()
      }
    }
  }
}
