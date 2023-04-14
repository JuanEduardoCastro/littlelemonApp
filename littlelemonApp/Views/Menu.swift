//
//  Menu.swift
//  littlelemonApp
//
//  Created by prueba on 15/03/2023.
//

import SwiftUI
import CoreData

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var categorySelected: String = ""
    @State var path = NavigationPath()
    @StateObject var searchText = SearchTextUpdate()
    
    var body: some View {
        VStack {
            Hero(searchText: searchText)
            CatPills(categoryState: $categorySelected)
            VStack {
                FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                    List {
                        ForEach(dishes, id: \.self) { dish in
                            HStack {
                                VStack {
                                    Text("\(dish.title ?? "")")
                                        .font(.system(size: 18, weight: .semibold))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 2))
                                    Text("\(dish.itemDescription ?? "")")
                                        .lineLimit(2)
                                        .foregroundColor(Color("DarkGreen"))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 8))
                                    Text("$\(dish.price ?? "00").00")
                                        .foregroundColor(Color("DarkGreen"))
                                        .font(.system(size: 18, weight: .semibold))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 2))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                AsyncImage(url: URL(string: dish.image!)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    Image(systemName: "photo.fill")
                                }
                                .frame(width: 50, height: 50)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        Spacer()
                    }
                    .listStyle(.plain)
                }
                .onAppear {
                    getMenuData()
                }
            }
        }
    }
      
    
    func getMenuData() {
        PersistenceController().clear()
        
       var menuItems = [MenuItemModel]()
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if let _ = error {
                print("Error")
            }
            
            if let data = data,
               let responseData = try? JSONDecoder().decode(MenuListModel.self, from: data) {
                menuItems = responseData.menu
            }
            
            menuItems.forEach { newDish in
                let dishInDB = Dish.exists(title: newDish.title, viewContext)
                
               // let dishInDB = false
                if !dishInDB! {
                    let entity = Dish(context: viewContext)
                    entity.title = (newDish.title)
                    entity.itemDescription = (newDish.itemDescription)
                    entity.price = (newDish.price)
                    entity.image = (newDish.image)
                    entity.category = (newDish.category)
                    do {
                        try viewContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                
            }
        }
        task.resume()
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        
        let arraySorted = [NSSortDescriptor(key: "title",
                         ascending: true,
                         selector: #selector(NSString.localizedStandardCompare))]

        return arraySorted
    }
    
    func buildPredicate() -> NSPredicate {
        var arrayFiltered = NSPredicate()
        var arrayFiltered2 = NSPredicate()
        if searchText.searchText.count == 0 {
            arrayFiltered = NSPredicate(value: true)
        } else if searchText.searchText.count > 0 {
            arrayFiltered = NSPredicate(format: "title CONTAINS[cd] %@", searchText.searchText)
        }
        if categorySelected.count == 0 {
            arrayFiltered2 = NSPredicate(value: true)
        } else if categorySelected.count > 0 {
            arrayFiltered2 = NSPredicate(format: "category CONTAINS[cd] %@", categorySelected)
        }
        
        let compoundPredicate = NSCompoundPredicate(type: .and, subpredicates: [arrayFiltered, arrayFiltered2])
        return compoundPredicate
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
