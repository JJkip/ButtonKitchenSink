

import SwiftUI

struct KitchenSinkView: View {
  @State private var isDisabled = false
  @State private var applyTint = false
  @State private var actionTaken = ""
  @State private var menuSelection: String?
  private let menuOptions = ["English", "Spanish", "French", "German"]

  var body: some View {
    List {
      borderedButtonView
      customButtonsView
      buttonRolesView
      buttonShapesView
      buttonSizesView
      menuButtonsView
    }
    .navigationTitle("Button Kitchen Sink")
    .navigationBarTitleDisplayMode(.inline)
  }

  private var borderedButtonView: some View {
    Section {
      Button {
      } label: {
        Text("Bordered Prominent")
      }
      .buttonStyle(.borderedProminent)
      
      Button {
      } label: {
        Text("Bordered")
      }

      Button {
      } label: {
        Text("Borderless")
      }
    } header: {
      Text("Bordered Buttons")
    } footer: {
      Toggle(isOn: $applyTint) {
        Label("Apply Tint", systemImage: "paintbrush")
      }
    }
  }

  private var customButtonsView: some View {
    Section {
      Button {
      } label: {
        Text("Gradient Button")
      }

      Button {
      } label: {
        Text("Custom Gradient Button")
      }
    } header: {
      Text("Custom Buttons")
    } footer: {
      Toggle(isOn: $isDisabled) {
        Label("Disable Buttons", systemImage: "checkmark.circle.fill")
      }
    }
  }

  private var buttonRolesView: some View {
    Section {
      Button {
      } label: {
        Text("Destructive")
      }

      Button {
      } label: {
        Text("Cancel")
      }
    } header: {
      Text("Button Roles")
    } footer: {
      Text("Action Taken: \(actionTaken)")
    }
  }

  private var buttonShapesView: some View {
    Section {
      HStack {
        Button {
        } label: {
          Text("Rounded")
        }

        Button {
        } label: {
          Text("Custom Radius")
        }

        Button {
        } label: {
          Text("Capsule")
        }
      }
    } header: {
      Text("Button Shapes")
    }
  }

  private var buttonSizesView: some View {
    Section {
      HStack {
        Button {
        } label: {
          Text("Mini")
        }

        Button {
        } label: {
          Text("Small")
        }

        Button {
        } label: {
          Text("Regular")
        }

        Button {
        } label: {
          Text("Large")
        }
      }
    } header: {
      Text("Button Sizes")
    }
  }

  private var menuButtonsView: some View {
    Section {
      HStack {
        Menu(menuSelection ?? "Select Language") {
          ForEach(menuOptions, id: \.self) { menuOption in
            Button {
              menuSelection = menuOption
            } label: {
              Text(menuOption)
            }
          }
        }
      }
    } header: {
      Text("Menu")
    }
  }
}

struct KitchenSinkView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      KitchenSinkView()
    }
  }
}