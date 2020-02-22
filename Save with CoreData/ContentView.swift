//
//  ContentView.swift
//  Save with CoreData
//
//  Created by Frank Bara on 2/17/20.
//  Copyright © 2020 BaraLabs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // Call the model in the view using the Environment
    @Environment(\.managedObjectContext) var moc
    // Use FetchRequest to load the data fromt the model in the view
    @FetchRequest(entity: Developer.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Developer.username, ascending: true),
        NSSortDescriptor(keyPath: \Developer.descriptions, ascending: true),
        NSSortDescriptor(keyPath: \Developer.favo, ascending: false),
        NSSortDescriptor(keyPath: \Developer.loved, ascending: false),
        NSSortDescriptor(keyPath: \Developer.imageD, ascending: true),
    ]) var developers: FetchedResults<Developer>
    
    @State private var image: Data = .init(count: 0)
    
    @State private var show = false
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(developers, id: \.self) { dev in
                    HStack {
                        Image(uiImage: UIImage(data: dev.imageD ?? self.image)!)
                            .resizable()
                            .frame(width: 85, height: 85)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                        
                        VStack {
                            Text("\(dev.username ?? "")")
                                .bold()
                                .font(.headline)
                            
                            Text("\(dev.descriptions ?? "")")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Image(systemName: dev.favo ? "star.fill" : "star")
                            .foregroundColor((dev.favo == true) ? Color.yellow : Color.gray)
                        
                        
                    }
                }
            }.navigationBarTitle("Developers", displayMode: .inline)
                .navigationBarItems(leading: Button(action: {
                    self.show.toggle()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        
                        Text("Create new")
                    }
                })
        }
        .sheet(isPresented: self.$show) {
            SenderView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
