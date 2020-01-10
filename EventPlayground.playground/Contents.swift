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
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
            Text("Hello, \(name)!")
            
            TextField("Enter your name with border", text: $name)
                .disableAutocorrection(true)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Hello, \(name)!")
            
            TextField("email@email.com", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
            Text("you entered: \(password)")
        }
    }
}

// text fields
struct ContentView5: View {
    @State private var celsius: Double = 0
    
    var body: some View {
        VStack {
            Slider(value: $celsius, in: 0...100, step: 0.1)
            Text("The temp is \(celsius, specifier: "%.2f") C")
            Text("The temp is \(celsius * 9 / 5 + 32, specifier: "%.2f") F")
        }
    }
}

// picker
struct ContentView6: View {
    let colors = ["Red", "Green", "Blue", "Yellow"]
    @State private var selectedColor = 0
    
    var body: some View {
        VStack {
            Picker (selection: $selectedColor, label: Text("Please choose a color")) {
                ForEach(0 ..< colors.count) {
                    Text(self.colors[$0])
                }
            }
            Text("You selected: \(colors[selectedColor])")
        }
    }
}

// date picker
struct ContentView7: View {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    @State private var birthDate = Date()
    
    var body: some View {
        VStack {
            DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                Text("Select date")
            }
            Text("Date is \(birthDate, formatter: dateFormatter)")
        }
    }
}

// segmented control
struct ContentView8: View {
    @State private var color = 0
    
    var body: some View {
        VStack {
            Picker(selection: $color, label: Text("what is your color")) {
                Text("Red").tag(0)
                Text("Green").tag(1)
                Text("Tartan").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Text("Color: \(color)")
        }
    }
}

// segmented control 2
struct ContentView9: View {
    @State private var color = 0
    let colors = ["Red", "Green", "Tartan"]
    
    var body: some View {
        VStack {
            Picker(selection: $color, label: Text("what is your color")) {
                ForEach(0 ..< colors.count) { index in
                    Text(self.colors[index]).tag(index)
                }
//                ForEach(0 ..< colors.count) {
//                    Text(self.colors[$0]).tag($0)
//                } // same as using index
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Text("Color: \(color)")
        }
    }
}

// stepper
struct ContentView10: View {
    @State private var age = 18
    
    var body: some View {
        VStack {
            Stepper("Enter your age", value: $age, in: 0...125)
            Text("Your age is \(age)")
        }
    }
}

struct ContentView11: View {
    @State private var age = 18
    
    var body: some View {
        VStack {
            Stepper("Enter your age", onIncrement: { self.age += 1 }, onDecrement: {self.age -= 1 } )
            Text("Your age is \(age)")
        }
    }
}

// stepper
struct ContentView12: View {
    @State private var age = 18
    
    func onIncrement() {
        self.age += 1
        print("adding 1 to age")
    }
    
    func onDecrement() {
        self.age -= 1
        print("decrementing 1 from age")
    }
    
    var body: some View {
        VStack {
            Stepper("Enter your age", onIncrement: { self.onIncrement() }, onDecrement: { self.onDecrement() })
            Text("Your age is \(age)")
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView12())
