//
//  ContentView.swift
//  cw6
//
//  Created by Max will on 8/14/22.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""
    @State var height = ""
@State var weight = ""
    @State var result = 0.0
    @State var health = ""
    var body: some View {
        ZStack {
            Image("orange & black")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 4)
            VStack{
                Text("Welcome back! \(name)")
                    .font(.system(size: 32, weight: .bold, design: .serif))
                    .foregroundColor(.orange)
                    .background(.black.opacity(0.3))
                HStack {
                    TextField("Enter your name", text: $name)
                        .padding()
                        .foregroundColor(.white)
                        .background(.orange.opacity(0.6))
                        .cornerRadius(30)
                    .frame(width: 200, height: 100)
                    .padding(7)
                    Spacer()
                }
                Image("bmi")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding()
                    .background(.white.opacity(0.2))
                    .cornerRadius(40)
                
                TextField("Enter your height", text: $height)
                    .padding()
                    .background(.white.opacity(0.6))
                    .cornerRadius(30)
                    .padding(2)
                TextField("Enter your weight", text: $weight)
                    .padding()
                    .background(.white.opacity(0.6))
                    .cornerRadius(30)
                    .padding(2)
                Button {
                    result = bmi(h: (Double(height) ?? 0.0), w: (Double(weight) ?? 0.0))
                    if result <= 20 {
                        health = "nope, too bad \(name)"
                    } else if result > 20 && result <= 25{
                        health = "Well done! \(name)"
                    } else {
                        health = "Well \(name), you should lose some weight"
                    }
                } label: {
                    Text("Calculate")
                        .foregroundColor(.orange.opacity(0.8))
                        .padding()
                        .background(.black.opacity(0.5))
                        .cornerRadius(24)
                }

                Text("BMI = \(result)")
                    .font(.system(size: 45, weight: .medium, design: .serif))
                    .padding()
                    .background(.orange.opacity(0.7))
                    .cornerRadius(24)
                Spacer()
                Text("\(health)")
                    .font(.system(size: 25, weight: .medium, design: .rounded))
                    .foregroundColor(.orange)
                    .padding()
                    .background(.black.opacity(0.6))
                    .cornerRadius(24)
                Spacer()
            }
        }
    }
    func bmi(h: Double, w: Double) -> Double{
       return w / (h * h)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
