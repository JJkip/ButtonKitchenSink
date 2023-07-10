import SwiftUI

struct CustomMenu: MenuStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      Spacer()
      Menu(configuration)
      Spacer()
      Image(systemName: "chevron.up.chevron.down")
    }
    .padding()
    .background(Color.purple)
    .cornerRadius(8)
    .foregroundColor(.white)
  }
}
extension MenuStyle where Self == CustomMenu {
  static var customMenu: CustomMenu { .init() }
}
