//
//  ContentView.swift
//  guesstheflag
//
//  Created by Ferdian Gunawan on 06/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                Text("Hello, world!")
                Text("Hallo juga")
                Spacer()
                HStack(spacing: 20) {
                    Text("Hello, world!")
                    Text("Hallo juga")
                }
                ZStack(alignment: .bottom) {
                    Text("Testing")
                    Text("Number 2 of stack")
                    Button("Login") {
                        print("tapped 1")
                    }.padding().foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(20)
                }
//                    ForEach(0..<20, id: \.self) { item in
//                        Text("test")
//                    }
                Button(action: {
                    print("sign up bin tapped")
                }) {
                    Text("SIGN UP")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.system(size: 18))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                }
                    .background(Color.yellow) // If you have this
                .cornerRadius(25)

                Button(action: { }) {
                    Text("yowme").frame(minWidth: 0, maxWidth: .infinity).padding()
                        .foregroundColor(.white)
                        .overlay(RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.blue, lineWidth: 3))
                }.background(Color.brown).cornerRadius(50).controlSize(.large).font(.system(size: 18))

                Spacer()
//                NavigationLink("Second Page", destination: SecondPage())
//                NavigationLink("Gradient Page", destination: GradientPage())
                NavigationLink("Button and Image Page", destination: ButtonAndImagePage())

            }.navigationTitle("Best Pattern")
                .navigationBarTitleDisplayMode(.automatic).padding()
        }.ignoresSafeArea()
    }
}



struct SecondPage: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            Text("Second page here")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
            .navigationTitle("Second Page").ignoresSafeArea()
    }
}
// Gradient
struct GradientPage: View {
    var body: some View {
        ZStack {
            Color.gray
            VStack {
                LinearGradient(gradient: Gradient(stops: [
                        .init(color: .white, location: 0.45),
                        .init(color: .black, location: 0.55)]),
                               startPoint: .top,
                               endPoint: .bottom).frame(maxHeight: 200)

                LinearGradient(gradient: Gradient(colors: [.blue, .green]),
                               startPoint: .top,
                               endPoint: .topTrailing).frame(maxHeight: 50)
                RadialGradient(gradient: Gradient(colors: [.red, .blue]), center: .center, startRadius: 20, endRadius: 200).frame(maxHeight: 80)
                AngularGradient(colors: [.brown, .green, .red, .blue],
                                center: .center)
                    .frame(maxHeight: 100)
            }
        }
    }
}


struct ButtonAndImagePage: View {
    var body: some View {
        ZStack {
            Color.white
            VStack {
                Button("Delete Selection") {
                    print("Testing delete...")
                }
                Button("Delete verse 2", role: .destructive, action: executeDelete)
                Button("Button 1") {
                }.buttonStyle(.bordered)
                Button("Button 2", role: .destructive) { }
                    .buttonStyle(.bordered)
                Button("Button 3") {
                }.buttonStyle(.borderedProminent).tint(.mint)
                Button("Button 4", role: .destructive) { }
                    .buttonStyle(.borderedProminent)
                // more custom button
                Button {
                    print("Button was tapped")
                } label: {
                    Text("Text me")
                        .padding()
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(20)
                }
                Button {
                    print("Button was tapped")
                } label: {
                    Label("edit", systemImage: "code")
                }

                Image("code")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
//                    .scaledToFill()
                .frame(width: 200, height: 200)
                    .clipShape(
//                        RoundedRectangle(cornerRadius: 25)
                    Circle()
                )
            }

        }
    }
    func executeDelete() {
        print("Now Deleteting...")
    }
}

struct AlertPage: View {
    @State private var isShowingAlert = false
    var countries = ["Estonia", "France", "Germany", "Indonesia"]
    var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack {
            Color.white
            VStack {
                Text("tap the flag of")
                Text(countries[correctAnswer])
                Button("alert test") {
                    isShowingAlert = true
                }.alert("Importan Message", isPresented: $isShowingAlert) {
                    Button("OK", role: .cancel) { }
                    Button("Cancel", role: .destructive) { }
                } message: {
                    Text("Please read this")
                }
            }
        }
    }
}

struct StackingButtonPage: View {
    var countries = ["italy", "america", "russia", "polandia",]
    var correctAnswer = Int.random(in: 1...2)
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of").foregroundColor(.white)
                    Text(countries[correctAnswer]).foregroundColor(.white)
                }
//                ForEach(0..<3) { number in
//                    Button {
//                    } label: {
//                        Image(countries[number]).renderingMode(.original)
//                    }
                    ForEach(0..<3) { number in
                        Button {
                        } label: {
                            Image(countries[number]).resizable().frame(width: 200, height: 150)
                        }
                }

            }
        }
    }
}

/// PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StackingButtonPage()
    }
}
