import SwiftUI

@main
struct AppMain: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

  var body: some Scene {
    WindowGroup {
      NavigationView {
        KitchenSinkView()
      }
    }
  }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    let navBarAppearance = UINavigationBarAppearance()
    navBarAppearance.backgroundColor = .systemMint
    navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

    UINavigationBar.appearance().standardAppearance = navBarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    UINavigationBar.appearance().compactAppearance = navBarAppearance

    return true
  }
}
