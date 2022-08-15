//
//  ContentView.swift
//  cw5
//
//  Created by ... on 23/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State var counter: [Int] = [0, 0, 0]
    var body: some View {
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            VStack{
                ExtractedView(myCounter: $counter, name: "استغفر الله العظيم", numb: 0)
                
                ExtractedView(myCounter: $counter, name: "سبحان الله و بحمده", numb: 1)
                ExtractedView(myCounter: $counter, name: "سبحان الله العظيم", numb: 2)

            }
        }
    }
}


// يجب عمل extract

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    @Binding var myCounter: [Int]
    var name: String
    var numb: Int
    var body: some View {
        HStack{
            Text("\(name)")
                .font(.system(size: 50, weight: .medium, design: .serif))
            Spacer()
            Text("\(myCounter[numb])")
                .font(.system(size: 70, weight: .medium, design: .rounded))
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(.white)
                .background(Color.green)
                .clipShape(Circle())
                .padding()
                .onTapGesture {
                    myCounter[numb] = myCounter[numb] + 1
                }
        }.padding()
            .background(.white.opacity(0.3))
            .cornerRadius(24)
            .padding()
    }
}
