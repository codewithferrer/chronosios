//
//  ContentView.swift
//  chronos Watch App
//
//  Created by Daniel Ferrer on 23/2/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @Environment(\.scenePhase) private var scenePhase
    @ObservedObject var viewModel = ViewModel()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
    
    var body: some View {
        VStack {
            Spacer()
            Text(viewModel.remainTime.toMinutesSeconds())
                .foregroundColor(Color.white)
                .font(size: .s60, type: .digital)
            
            HStack {
                ButtonView(text: "START") {
                    viewModel.startCounter()
                }
                
                ButtonView(text: "RESET") {
                    viewModel.resetCounter()
                }
            }.padding(.top, 40)
        }
        .padding()
        .onReceive(timer) { _ in
            viewModel.decreaseTime()
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
                case .active:
                    print(">> active")
                    viewModel.restoreFromBackground()
                case .inactive:
                    print(">> inactive")
                    break
                case .background:
                    print(">> background")
                    viewModel.prepareForBackground()
                break
                default:
                break
            }
        }
        .onAppear {
            viewModel.requestPermission()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
