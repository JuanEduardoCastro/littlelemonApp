//
//  Customs.swift
//  littlelemonApp
//
//  Created by prueba on 11/04/2023.
//

import SwiftUI

class SearchTextUpdate: ObservableObject {
    @Published var searchText = ""
}

class UserProfileInOut: ObservableObject {
    @Published var userProfileIn = false
}

struct RoundedCornerButton: ButtonStyle {
    var width: CGFloat = 3
    var font: Font = .system(size: 16, weight: .semibold)
    var fgColor = Color("DarkGreen")
    var bgColor = Color.white
    var padding: CGFloat = 12
    var cornerRadius: CGFloat = 8
    var strokeColor = Color("DarkGreen")
    var lineWidth: CGFloat = 2
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: width)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .font(font)
            .foregroundColor(fgColor)
            .padding(padding)
            .background(bgColor)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius).stroke(strokeColor, lineWidth: lineWidth))
    }
}

struct OutlinedTextFieldStyle: TextFieldStyle {
    var width: CGFloat = UIScreen.main.bounds.width - 30
    var height: CGFloat = 25
    var padding: CGFloat = 6
    var cornerRadius: CGFloat = 5
    var strokeColor = Color.gray
    var lineWidth: CGFloat = 1
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(maxWidth: width, alignment: .top)
            .frame(minHeight: height)
            .padding(padding)
            .cornerRadius(cornerRadius)
            .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(strokeColor, lineWidth: lineWidth))

    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Button {
                configuration.isOn.toggle()
            } label: {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
            }
            
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
            .font(.system(size: 20))
            .accentColor(configuration.isOn ? Color("DarkGreen") : Color.gray)
            
            configuration.label
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(EdgeInsets(top: 5, leading: 0, bottom: 10, trailing: 0))
    }
}
