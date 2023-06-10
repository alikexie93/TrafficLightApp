//
//  ContentView.swift
//  TrafficLight
//
//  Created by Алексей Филиппов on 10.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonTitle = "Start"
    @State private var currentLight = CurrentLight.red
    @State private var opacityRed = 0.3
    @State private var opacityYellow = 0.3
    @State private var opacityGreen = 0.3
    
    var body: some View {
        VStack(spacing: 16) {
            Circle()
                .frame(width: 120, height: 120)
                .foregroundColor(Color(red: 255, green: 0, blue: 0, opacity: opacityRed))
            Circle()
                .frame(width: 120, height: 120)
                .foregroundColor(Color(red: 255, green: 255, blue: 0, opacity: opacityYellow))
            Circle()
                .frame(width: 120, height: 120)
                .foregroundColor(Color(red: 0, green: 255, blue: 0, opacity: opacityGreen))
            Spacer()
            
            Button(action: switchLight) {
                Text(buttonTitle)
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .frame(width: 288)
                    .background(.blue)
                    .cornerRadius(16)
            }
        }
        .padding()
    }
    private func switchLight() {
        if buttonTitle == "Start" {
            buttonTitle = "Next"
        }
        switch currentLight {
        case .red:
            opacityRed = 1.0
            opacityYellow = 0.3
            opacityGreen = 0.3
            currentLight = .yellow
        case .yellow:
            opacityRed = 0.3
            opacityYellow = 1.0
            opacityGreen = 0.3
            currentLight = .green
        case .green:
            opacityRed = 0.3
            opacityYellow = 0.3
            opacityGreen = 1.0
            currentLight = .red
        }
    }
}

extension ContentView {
    enum CurrentLight {
        case red, yellow, green
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
