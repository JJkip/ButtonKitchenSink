import SwiftUI

struct CustomMenu: MenuStyle {
  func makeBody(configuration: Configuration) -> some View {
    Menu(configuration)
  }
}
