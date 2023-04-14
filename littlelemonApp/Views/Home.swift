//
//  Home.swift
//  littlelemonApp
//
//  Created by prueba on 15/03/2023.
//

import SwiftUI
import CoreData


struct Home: View {
    
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        Header()
        TabView {
            Menu()
                .tabItem ({
                    Label("Menu", systemImage: "list.dash")
                })
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            UserProfile()
                .tabItem ({
                    Label("User Profile", systemImage: "square.and.pencil")
                })
            
        }
       .navigationBarBackButtonHidden()
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
