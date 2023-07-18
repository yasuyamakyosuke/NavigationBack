import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("You are in A") // View indicating the current screen
                NavigationLink(destination: BView()) {
                    Text("Go to B")
                }
            }
        }
    }
}

struct BView: View {
    var body: some View {
        VStack {
            Text("You are in B") // View indicating the current screen
            NavigationLink(destination: CView()) {
                Text("Go to C")
            }
        }
        .navigationBarBackButtonHidden(true) // Hide the default back button
        .navigationBarItems(leading: backButton) // Show custom back button
    }

    var backButton: some View {
        Button(action: {
            // Manually pop to A when the back button is tapped
            popToA()
        }, label: {
            Image(systemName: "arrow.left")
        })
    }

    func popToA() {
        // Pop to root view (A) when back button is tapped
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: ContentView())
        }
    }
}

struct CView: View {
    var body: some View {
        VStack {
            Text("You are in C") // View indicating the current screen
            NavigationLink(destination: DView()) {
                Text("Go to D")
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }

    var backButton: some View {
        Button(action: {
            popToA()
        }, label: {
            Image(systemName: "arrow.left")
        })
    }

    func popToA() {
        // Pop to root view (A) when back button is tapped
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: ContentView())
        }
    }
}

struct DView: View {
    var body: some View {
        VStack {
            Text("You are in D") // View indicating the current screen
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }

    var backButton: some View {
        Button(action: {
            popToA()
        }, label: {
            Image(systemName: "arrow.left")
        })
    }

    func popToA() {
        // Pop to root view (A) when back button is tapped
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: ContentView())
        }
    }
}
