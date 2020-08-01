//
//  ContactRow.swift
//  Example
//
//  Created by Abdullah Alhaider on 01/08/2020.
//  Copyright © 2020 Abdullah Alhaider. All rights reserved.
//

import SwiftUI
import ProfilePlaceholderView

struct ContactRow: View {
    let contact: Contact
    
    init(_ contact: Contact) {
        self.contact = contact
    }
    
    var body: some View {
        HStack {
            Image(contact.imageString ?? "")
                .resizable()
                .withProfilePlaceholderView(name: contact.name)
                .clipShape(Circle())
                .frame(width: 60, height: 60)
            
            Text(contact.name)
                .font(.headline)
        }
    }
}


struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactRow(Contact.all[0])
    }
}
