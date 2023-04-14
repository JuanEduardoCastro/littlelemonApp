//
//  CatPills.swift
//  littlelemonApp
//
//  Created by prueba on 11/04/2023.
//

import SwiftUI

struct CatPills: View {
    
    @Binding var categoryState: String
    
    var body: some View {
        VStack {
            Spacer()
            Text("ORDER FOR DELIVERY!")
                .font(.system(size: 18, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 12)
            Spacer()
            HStack {
                Button("Starters", action: {
                    categoryState = "Starters"
                    print(categoryState)
                    
                })
                .buttonStyle(RoundedCornerButton(padding: 5, lineWidth: 0))
                Spacer()
                Button("Mains", action: {categoryState = "Mains"})
                    .buttonStyle(RoundedCornerButton(padding: 5, lineWidth: 0))
                Spacer()
                Button("Desserts", action: {categoryState = "Desserts"})
                    .buttonStyle(RoundedCornerButton(padding: 5, lineWidth: 0))
                Spacer()
                Button("Drinks", action: {categoryState = "Drinks"})
                    .buttonStyle(RoundedCornerButton(padding: 5, lineWidth: 0))
            }
            .padding(.horizontal, 15)
        }
        .frame(maxHeight: 92)
    }
}

struct CatPills_Previews: PreviewProvider {
    static var previews: some View {
        CatPills(categoryState: .constant(""))
    }
}
