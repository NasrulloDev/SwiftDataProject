//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Насрулло Исмоилжонов on 22/02/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<User> { user in
        user.name.localizedStandardContains("S") && user.city == "Tashkent"
    }, sort: \User.name) var users: [User]
    
    var body: some View {
        NavigationStack{
            List(users) { user in
                Text(user.name)
            }
            .navigationTitle("Users")
            .toolbar{
                Button("Add Samples", systemImage: "plus"){
                    try? modelContext.delete(model: User.self)
                    
                    let first = User(name: "Nasrullo", city: "Tashkent", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Jamshid", city: "Munch", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Zaman", city: "Astana", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Fazlik", city: "Tashkent", joinDate: .now.addingTimeInterval(86400 * 10))
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
