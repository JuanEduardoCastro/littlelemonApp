//
//  littlelemonAppApp.swift
//  littlelemonApp
//
//  Created by prueba on 13/03/2023.
//

import SwiftUI

@main
struct littlelemonAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Onboarding(firstName: "",lastName: "", eMail: "")
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
