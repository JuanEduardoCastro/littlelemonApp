//
//  Onboarding.swift
//  littlelemonApp
//
//  Created by prueba on 15/03/2023.
//

import SwiftUI

struct Onboarding: View {
    
    @State var firstName: String
    @State var lastName: String
    @State var eMail: String
    @State var buttonToggle: Bool = false
    @State var isLoggedIn: Bool = false
    @State var path = NavigationPath()
    @StateObject var userProfileIn = UserProfileInOut()
    @ObservedObject var userProfileGetIn = UserProfileInOut()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Header()
                Hero(searchText: SearchTextUpdate())
                Section {
                    VStack {
                        Text("First name *")
                            .foregroundColor(Color.gray)
                            .frame(maxWidth: UIScreen.main.bounds.width - 30, alignment: .leading)
                        TextField("First Name", text: $firstName)
                            .textFieldStyle(OutlinedTextFieldStyle())
                    }
                    .frame(width: UIScreen.main.bounds.width - 30)
                    VStack {
                        Text("Last name *")
                            .foregroundColor(Color.gray)
                            .frame(maxWidth: UIScreen.main.bounds.width - 30, alignment: .leading)
                        TextField("First Name", text: $lastName)
                            .textFieldStyle(OutlinedTextFieldStyle())
                    }
                    .frame(width: UIScreen.main.bounds.width - 30)
                    VStack {
                        Text("Email *")
                            .foregroundColor(Color.gray)
                            .frame(maxWidth: UIScreen.main.bounds.width - 30, alignment: .leading)
                        TextField("", text: $eMail)
                            .textFieldStyle(OutlinedTextFieldStyle())
                    }
                    .frame(width: UIScreen.main.bounds.width - 30)
                }
                Button("Register", action: {saveUserDefaults()})
                    .buttonStyle(RoundedCornerButton())
            }
            Spacer()
            .onAppear {
                if UserDefaults.standard.bool(forKey: "isLogged") == true {
                    path.append("Home")
                }
            }
            .navigationDestination(for: String.self) { view in
                if view == "Home" {
                    Home()
                }
            }
        }
    }
    
    func saveUserDefaults() {
        if (!firstName.isEmpty && !lastName.isEmpty && !eMail.isEmpty) {
            UserDefaults.standard.set(firstName, forKey: "firstName")
            UserDefaults.standard.set(lastName, forKey: "lastName")
            UserDefaults.standard.set(eMail, forKey: "eMail")
            isLoggedIn = true
            userProfileGetIn.userProfileIn = true
            UserDefaults.standard.set(isLoggedIn, forKey: "isLogged")
            path.append("Home")
        } else {
            print("error loggin")
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding(firstName: "", lastName: "", eMail: "")
    }
}
