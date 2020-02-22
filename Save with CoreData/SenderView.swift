//
//  SenderView.swift
//  Save with CoreData
//
//  Created by Frank Bara on 2/21/20.
//  Copyright © 2020 BaraLabs. All rights reserved.
//

import SwiftUI

struct SenderView: View {
    //We only need the environment moc
    @Environment(\.managedObjectContext) var moc
    
    @State private var username = ""
    @State private var description = ""
    @State private var image: Data = .init(count: 0)
    @State private var favorites = false
    @State private var loved = false
    @State private var show = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 14) {
                
                if image.count != 0 {
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Image(uiImage: UIImage(data: self.image)!)
                            .resizable()
                            .frame(width: 85, height: 85)
                        clipShape(Circle())
                    }// Button
                } else {
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Image(systemName: "person.circle.fill")
                            .font(.largeTitle)
                    }
                }
                
                TextField("Username...", text: self.$username)
                    .padding()
                    .background(Color(red: 233/255, green: 234/255, blue: 243/255))
                    .cornerRadius(20)
                
                TextField("Description...", text: self.$description)
                    .padding()
                    .background(Color(red: 233/255, green: 234/255, blue: 243/255))
                    .cornerRadius(20)
            }
        }
        .sheet(isPresented: self.$show, content: {
            ImagePicker(show: self.$show, image: self.$image)
        }
    }
}

struct SenderView_Previews: PreviewProvider {
    static var previews: some View {
        SenderView()
    }
}
