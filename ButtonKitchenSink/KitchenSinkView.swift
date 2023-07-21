

import SwiftUI

struct Neumorphic: ViewModifier {
    var bgColor: Color
    @Binding var isPressed: Bool
    @State private var animationAmount = 1.0

    func body(content: Content) -> some View {
        content
            .padding(20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .shadow(color: .white, radius: self.isPressed ? 7: 10, x: self.isPressed ? -5: -15, y: self.isPressed ? -5: -15)
                        .shadow(color: .black, radius: self.isPressed ? 7: 10, x: self.isPressed ? 5: 15, y: self.isPressed ? 5: 15)
                        .blendMode(.overlay)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(bgColor)
                }
            )
            .scaleEffect(self.isPressed ? 0.95: 1)
            .foregroundColor(.primary)
            .animation(
              .easeInOut(duration: 1)
              .repeatForever(autoreverses: false),
              value: animationAmount
         )
    }
}

struct NeumorphicButtonStyle: ButtonStyle {
    var bgColor: Color
    @State private var animationAmount = 1.0

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .shadow(color: .white, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? -5: -15, y: configuration.isPressed ? -5: -15)
                        .shadow(color: .black, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? 5: 15, y: configuration.isPressed ? 5: 15)
                        .blendMode(.overlay)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(bgColor)
                }
        )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .foregroundColor(.primary)
            .animation(
              .easeInOut(duration: 1)
              .repeatForever(autoreverses: false),
              value: animationAmount
         )
    }
}

extension Color {
    static let neuBackground = Color(hex: "f0f0f3")
    static let dropShadow = Color(hex: "aeaec0").opacity(0.4)
    static let dropLight = Color(hex: "ffffff")
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = scanner.string.index(after: scanner.currentIndex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff

        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }
}

extension View {
    func neumorphic(isPressed: Binding<Bool>, bgColor: Color) -> some View {
        self.modifier(Neumorphic(bgColor: bgColor, isPressed: isPressed))
    }
}

struct KitchenSinkView: View {
  @State private var isDisabled = false
  @State private var applyTint = false
  @State private var actionTaken = ""
  @State private var menuSelection: String?
  private let menuOptions = ["English", "Spanish", "French", "German"]
  let offWhiteColor = Color(red: 236/255, green: 234/255, blue: 235/255)
  let shadowColor = Color(red: 197/255, green: 197/255, blue: 197/255)
  
  @State private var isPressed: Bool = false

  var body: some View {
    List {
      borderedButtonView
      customButtonsView
      buttonRolesView
      buttonShapesView
      buttonSizesView
      menuButtonsView
    }
    .navigationTitle("Buttons Designs")
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
      HStack {
        Button {
        } label: {
          Text("Custom border")
            .foregroundColor(.purple)
            .font(.headline)
            .padding()
            .border(Color.purple, width: 2)
        }
        Button {
        } label: {
          Text("Custom border")
            .foregroundColor(.purple)
            .font(.headline)
            .padding()
//            .border(Color.purple, width: 2)
            .background(
              RoundedRectangle(cornerRadius: 40, style: .continuous)
                .stroke(.purple, lineWidth: 2)
            )
        }
        
      }
      Button {
      } label: {
        Text("Custom Design")
          .foregroundColor(.white)
          .font(.headline)
          .padding()
          .background(Color.purple)
          .foregroundColor(Color.white)
          .padding(6)
          .border(Color.purple, width: 4)
      }
      Button {
      } label: {
        Text("Shadow Button")
          .foregroundColor(Color.purple)
          .padding()
          .border(.purple, width: 4)
          .shadow(color: .purple, radius: 5, x: 20, y: 20)
      }
      Button{
      } label: {
        Text("Shadow radius")
          .foregroundStyle(.purple)
          .padding()
          .shadow(radius: 1)
          .border(.purple, width: 4)
          .background(.white)
      }
      Button{
      } label: {
        Text("Shadow color")
          .foregroundColor(.purple)
          .padding()
          .shadow(color: .black, radius: 5)
          .border(.purple, width: 4)
      }
      
      
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
      Button(action: {
        self.isPressed.toggle()
      }, label: {
          VStack {
              Text("Neumorphic Button")
          }.neumorphic(isPressed: $isPressed, bgColor: .neuBackground)
      }).frame(maxWidth: .infinity,
               maxHeight: .infinity)
          .background(Color.neuBackground)
          .edgesIgnoringSafeArea(.all)
      Button("Neumorphic", action: {

      }).buttonStyle(NeumorphicButtonStyle(bgColor: .neuBackground))
        .frame(maxWidth: .infinity,
                 maxHeight: .infinity)
        .background(Color.neuBackground)
        .edgesIgnoringSafeArea(.all)
      Button {
      } label: {
        Text("Gradient Button")
      }
      .buttonStyle(.gradient)
      .disabled(isDisabled)

      Button {
      } label: {
        Text("Custom Gradient Button")
      }
      .buttonStyle(GradientStyle(colors: [.red, .pink, .purple]))
      .disabled(isDisabled)
      
      Button {
      } label: {
        Label("Edit", systemImage: "paintbrush")
          .padding(.trailing, 8.0)
      }
      .buttonStyle(.bordered)
      .disabled(isDisabled)
      
    } header: {
      Text("Custom Buttons")
    } footer: {
      Toggle(isOn: $isDisabled) {
        Label("Disable Buttons", systemImage: "checkmark.circle.fill")
      }
      .tint(.purple)
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
        .controlSize(.mini)

        Button {
        } label: {
          Text("Small")
        }
        .controlSize(.small)
        
        Button {
        } label: {
          Text("Regular")
        }
        .controlSize(.regular)

        Button {
        } label: {
          Text("Large")
        }
        .controlSize(.large)
      }
    } header: {
      Text("Button Sizes")
    }
    .buttonStyle(.bordered)
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
        .menuStyle(.customMenu)
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
