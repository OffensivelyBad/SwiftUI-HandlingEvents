import SwiftUI
import PlaygroundSupport

// switch
struct ContentView1: View {
    @State private var showGreeting = true
    
    var body: some View {
        VStack {
            Toggle(isOn: $showGreeting) {
                Text("Show welcome message")
            }
            .padding()
            
            if showGreeting {
                Text("Hallo warld")
            }
        }
    }
}

// button
struct ContentView2: View {
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.showDetails.toggle()
            }) {
                HStack {
                    Text("Show details")
                    Image(systemName: "cloud.fill")
                }
            }
            
            Button(action: {
                self.showDetails.toggle()
            }) {
                HStack {
                    Text("Show details2")
                    Image(systemName: "cloud.fill")
                }
            }
            .buttonStyle(PlainButtonStyle()) // hide the automatic button style tint
            
            if showDetails {
                Text("do sumting")
                    .font(.largeTitle)
            }
        }
    }
}

// nav button
struct ContentView3: View {
    @State private var showDetails = false
    
    var body: some View {
        NavigationView {
            HStack {
                NavigationLink(destination: Text("detail view here")) {
                    Image(systemName: "cloud")
                }
                .buttonStyle(PlainButtonStyle()) // hide the automatic button style tint
                
                NavigationLink(destination: Text("poopoo")) {
                    Image(systemName: "cloud.fill")
                        .renderingMode(.original) // hide the automatic button style tint - this keeps the entire button tappable when inside a list
                }
            }
        }
    }
}

// text fields
struct ContentView4: View {
    @State private var name: String = "shane"
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
            Text("Hello, \(name)!")
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView4())
