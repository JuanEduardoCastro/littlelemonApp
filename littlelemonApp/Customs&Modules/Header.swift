//
//  Header.swift
//  littlelemonApp
//
//  Created by prueba on 10/04/2023.
//

import SwiftUI

struct Header: View {

    @State var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "isLogged")
    @StateObject var userProfileIn = UserProfileInOut()
    
    var body: some View {
        HStack {
            Image(systemName: isLoggedIn ? "" : "")
                .resizable()
                .scaledToFit()
                .accentColor(Color("DarkGreen"))
                .frame(maxWidth: 40, maxHeight: 40)
            Image("Logo")
                .frame(height: 70)
                .frame(maxWidth: .infinity)
            
            Image(userProfileIn.userProfileIn ? "profile-image" : "")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 50, maxHeight: 50)
        }
        .padding(.horizontal, 18)
        
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
