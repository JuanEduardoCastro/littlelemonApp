//
//  UserProfile.swift
//  littlelemonApp
//
//  Created by prueba on 16/03/2023.
//

import SwiftUI

struct UserProfile: View {
    
    @Environment(\.presentationMode) var presentation
    @ObservedObject var userProfileIn = UserProfileInOut()
    
    @State var firstNameDisplay = ""
    @State var lastNameDisplay = ""
    @State var eMailDisplay = ""
    @State var phoneNumber = "099-555-456-789"
    
    @State var orderStatus: Bool = true
    @State var passwordChanges: Bool = true
    @State var specialOffers: Bool = true
    @State var newsletter: Bool = true
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Personal information")
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(8)
                
                Section {
                    HStack {
                        VStack {
                            Text("Avatar")
                                .font(.system(size: 14))
                                .frame(maxWidth: 70,alignment: .leading)
                                
                            Image("profile-image")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 80, maxHeight: 80)
                        }
                        
                        Group {
                            Button("Change", action: {})
                                .buttonStyle(RoundedCornerButton(fgColor: Color.white, bgColor: Color("DarkGreen"), strokeColor: Color.black, lineWidth: 1))
                                .padding(5)
                            Button("Remove", action: {})
                                .buttonStyle(RoundedCornerButton())
                                .padding(5)
                        }
                        .padding(EdgeInsets(top: 30, leading: 5, bottom: 0, trailing: 0))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(8)
                    
                }
                
                Section {
                    VStack {
                        Text("Firs name")
                            .font(.system(size: 14))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("\(UserDefaults.standard.string(forKey: "firstName")!)", text: $firstNameDisplay)
                            .textFieldStyle(OutlinedTextFieldStyle(width: .infinity))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack {
                        Text("Last name")
                            .font(.system(size: 14))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("\(UserDefaults.standard.string(forKey: "lastName")!)", text: $lastNameDisplay)
                            .textFieldStyle(OutlinedTextFieldStyle(width: .infinity))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack {
                        Text("Email")
                            .font(.system(size: 14))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("\(UserDefaults.standard.string(forKey: "eMail")!)", text: $eMailDisplay)
                            .textFieldStyle(OutlinedTextFieldStyle(width: .infinity))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack {
                        Text("Phone number")
                            .font(.system(size: 14))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("\(UserDefaults.standard.string(forKey: "phoneNumber") ?? "" )", text: $phoneNumber)
                            .textFieldStyle(OutlinedTextFieldStyle(width: .infinity))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: UIScreen.main.bounds.width - 30, alignment: .leading)
                .padding(5)
                
                Text("Email notifications")
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(8)
                
                Section {
                    VStack {
                        Toggle(isOn: $orderStatus) {
                            Text("Order statuses")
                        }
                        .toggleStyle(CheckboxToggleStyle())
                        Toggle(isOn: $passwordChanges) {
                            Text("Password changes")
                        }
                        .toggleStyle(CheckboxToggleStyle())
                        Toggle(isOn: $specialOffers) {
                            Text("Special offers")
                        }
                        .toggleStyle(CheckboxToggleStyle())
                        Toggle(isOn: $newsletter) {
                            Text("Newsletter")
                        }
                        .toggleStyle(CheckboxToggleStyle())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: UIScreen.main.bounds.width - 30, alignment: .leading)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 25, trailing: 0))
                
                Button("Log out", action: {
                    UserDefaults.standard.set(false, forKey: "isLogged")
                    userProfileIn.userProfileIn = false
                    self.presentation.wrappedValue.dismiss()
                })
                .buttonStyle(RoundedCornerButton(width: UIScreen.main.bounds.width - 60, fgColor: Color.black, bgColor: Color("LemonYellow"), strokeColor: Color.black, lineWidth: 1))
                
                HStack {
                    Spacer()
                    Button("Discard changes", action: { })
                    .buttonStyle(RoundedCornerButton(width: 120))
                    Spacer()
                    Button("Save changes", action: { })
                    .buttonStyle(RoundedCornerButton(width: 120, fgColor: Color.white, bgColor: Color("DarkGreen"), strokeColor: Color.black, lineWidth: 1))
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .onAppear {
            userProfileIn.userProfileIn = true
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
