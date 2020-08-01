//
//  Contact.swift
//  Example
//
//  Created by Abdullah Alhaider on 01/08/2020.
//  Copyright © 2020 Abdullah Alhaider. All rights reserved.
//

import Foundation

struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let imageString: String?
    
    static var all: [Contact] {
        [
            .init(name: "John Appleseed", imageString: nil),
            .init(name: "Abdullah Alhaider", imageString: "Abdullah"),
            .init(name: "David Taylor", imageString: nil),
            .init(name: "Soneone", imageString: nil)
        ]
    }
}
