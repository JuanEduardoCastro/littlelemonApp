//
//  Hero.swift
//  littlelemonApp
//
//  Created by prueba on 11/04/2023.
//

import SwiftUI

struct Hero: View {
    
    @State var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "isLogged")
    @State var inputText: String = ""
    @StateObject var userProfileIn = UserProfileInOut()
    @ObservedObject var searchText: SearchTextUpdate
    
    var body: some View {
        ZStack {
            VStack(alignment: HorizontalAlignment.leading) {
                Text("Little Lemon")
                    .font(.system(size: 42, weight: .semibold))
                    .foregroundColor(Color("LemonYellow"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 8, leading: 12, bottom: 0, trailing: 0))
                HStack {
                    VStack {
                        Text("Chicago")
                            .font(.system(size: 32))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 0))
                        Spacer()
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .foregroundColor(Color.white)
                            .frame(maxWidth: 200, alignment: .leading)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 36, trailing: 0))
                    }
                    VStack {
                        Spacer()
                        Image("Hero_image")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 141)
                            .cornerRadius(12)
                            .padding(EdgeInsets(top: 12, leading: 0, bottom: 28, trailing: 12))
                    }
                }
                if userProfileIn.userProfileIn == true {
                    TextField("Search menu", text: $inputText)
                        .textFieldStyle(OutlinedTextFieldStyle())
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color("DarkGreen"))
                        .onChange(of: inputText) { newValue in
                            searchText.searchText = inputText
                        }
                }
                
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: 300)
        .background(Color("DarkGreen"))
        .onAppear {
            if UserDefaults.standard.bool(forKey: "isLogged") == false {
                UserDefaults.standard.set(false, forKey: "isLogged")
            }
        }
    }
}

struct Hero_Previews: PreviewProvider {
    static var previews: some View {
        Hero(searchText: SearchTextUpdate())
    }
}
