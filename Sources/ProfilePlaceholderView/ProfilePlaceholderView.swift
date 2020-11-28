//
//  PlaceholderImageKit.swift
//  ProfilePlaceholder
//
//  Created by Abdullah Alhaider on 01/08/2020.
//  Copyright © 2020 Abdullah Alhaider. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public extension Image {
    func withProfilePlaceholderView(name: String, backgroundGradientColors: [Color]? = nil, font: Font? = nil) -> some View {
        ProfilePlaceholderView(name: name, backgroundGradientColors: backgroundGradientColors, font: font)
            .overlay(self)
    }
}

@available(iOS 13.0, *)
public struct ProfilePlaceholderView: View {
    let name: String
    let backgroundGradientColors: [Color]?
    let font: Font?
    
    public init(name: String, backgroundGradientColors: [Color]? = nil, font: Font? = nil) {
        self.name = name
        self.backgroundGradientColors = backgroundGradientColors
        self.font = font
    }
    
    var placeholderText: String {
        guard !name.isEmpty else {
            return name
        }
        let components = name.components(separatedBy: .whitespacesAndNewlines)
        let words = components.map { $0.trimmingCharacters(in: .whitespacesAndNewlines).uppercased() }
        let first = words.first?.prefix(1) ?? ""
        let last = words.last?.prefix(1) ?? ""
        if words.isEmpty {
            return ""
        } else if words.count == 1 {
            return "\(first)"
        } else {
            return "\(first) \(last)".trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    
    var colors: [Color] {
        if let colors = backgroundGradientColors {
            return colors
        } else {
            let color = Color.random
            let colors = [color, color.opacity(0.4)]
            return colors
        }
    }
    
    public var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(gradient: Gradient(colors: colors), startPoint: .bottomTrailing, endPoint: .topLeading)
                Text(placeholderText)
                    .shadow(color: Color.black.opacity(0.4), radius: 7, x: 0, y: 0)
                    .foregroundColor(.white)
                    .font(font ?? .system(size: geo.size.width / 2.5 - 5, weight: .medium, design: .rounded))
            }
        }
    }
    
}

@available(iOS 13.0, *)
struct ProfilePlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePlaceholderView(name: "Abdullah Alhaider")
    }
}

@available(iOS 13.0, *)
public extension Color {
    static var random: Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1))
    }
}
