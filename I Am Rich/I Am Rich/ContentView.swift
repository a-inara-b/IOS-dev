//
//  ContentView.swift
//  I Am Rich
//
//  Created by Инара Алмагамбетова on 25.09.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Diamond image
            Image("diamond")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()

            // Motivational text
            Text("I Am Rich")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom, 2)

        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
