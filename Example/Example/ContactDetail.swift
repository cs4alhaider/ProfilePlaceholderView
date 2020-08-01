//
//  ContactDetail.swift
//  Example
//
//  Created by Abdullah Alhaider on 01/08/2020.
//  Copyright © 2020 Abdullah Alhaider. All rights reserved.
//

import SwiftUI
import ProfilePlaceholderView

struct ContactDetail: View {
    let contact: Contact
    
    init(_ contact: Contact) {
        self.contact = contact
    }
    
    var body: some View {
        Form {
            HStack {
                Spacer()
                VStack {
                    Image(contact.imageString ?? "")
                        .resizable()
                        .withProfilePlaceholderView(name: contact.name)
                        .clipShape(Circle())
                        .frame(width: 200, height: 200)
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(color: Color.gray.opacity(0.8), radius: 12, x: 0, y: 0)
                    Text(self.contact.name)
                        .font(.largeTitle)
                }
                .padding(.vertical, 20)
                Spacer()
                
            }
        }
    }
}

struct ContactDetail_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetail(Contact.all[0])
    }
}
