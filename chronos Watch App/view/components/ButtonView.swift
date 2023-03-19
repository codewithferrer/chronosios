//
//  ButtonView.swift
//  chronos Watch App
//
//  Created by Daniel Ferrer on 18/3/23.
//

import SwiftUI

struct ButtonView: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .font(size: .s12, type: .regular)
                .padding(.horizontal, 6)
                .padding(.vertical, 4)
                .foregroundColor(Color.black)
        }
        .background(Color.white)
        .cornerRadius(4)
        .buttonStyle(ButtonDefault())
        .frame(height: 12)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "BUTTON") {}
    }
}

struct ButtonDefault: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.3 : 1)
            .animation(.easeOut(duration: 0.3), value: configuration.isPressed)
            
    }
}



