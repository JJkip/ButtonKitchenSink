

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
      .buttonStyle(.bordered)
      
      Button {
      } label: {
        Text("Borderless")
      }
      .buttonStyle(.borderless)
    } header: {
      Text("Bordered Buttons")
    } footer: {
      Toggle(isOn: $applyTint) {
        Label("Apply Tint", systemImage: "paintbrush")
      }
    }
    .tint(applyTint ? .purple : .primary)
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
      
      Button {
      } label: {
        Label("Edit", systemImage: "pencil")
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
      Button(role: .destructive) {
      } label: {
        Text("Destructive")
      }
      .swipeActions {
        Button(role: .destructive) {
          actionTaken = "Remove"
        } label: {
          Label("Remove", systemImage: "trash")
        }
        
        Button(role: .cancel){
          actionTaken = "Add"
        } label: {
          Label("Add", systemImage: "plus")
        }
        
        Button {
          actionTaken = "Share"
        } label: {
          Label("Add", systemImage: "square.and.arrow.up")
        }
        .tint(.purple)
      }

      Button(role: .cancel) {
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
        .buttonBorderShape(.roundedRectangle(radius: 12))

        Button {
        } label: {
          Text("Capsule")
        }
        .buttonBorderShape(.capsule)
      }
    } header: {
      Text("Button Shapes")
    }
    .buttonBorderShape(.roundedRectangle)
    .buttonStyle(.bordered)
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
