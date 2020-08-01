//
//  ContentView.swift
//  Example
//
//  Created by Abdullah Alhaider on 01/08/2020.
//  Copyright © 2020 Abdullah Alhaider. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List(Contact.all) { contact in
                NavigationLink(destination: ContactDetail(contact)) {
                    ContactRow(contact)
                }
            }
            .navigationBarTitle("Contacts")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
