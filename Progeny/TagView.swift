//
//  TagView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/5/24.
//

import SwiftUI

struct TagView: View {
    let styleSheet = globalStyleSheet
    let tag: Tag

    var height: CGFloat
    var specificWidth: CGFloat?
    var fontSizeMultiplyer: CGFloat = 0.7
    
    var body: some View {
        HStack() {
            HStack() {
                Text(tag.name)
                    .foregroundColor(tag.fontColor)
                    .scaleEffect(fontSizeMultiplyer)
            }
            .frame(maxWidth: specificWidth != nil ? specificWidth : .infinity)
            .frame(maxHeight: height)
            .background(tag.color)
            .cornerRadius(height / 2)
        }
    }
}

#Preview {
    let tag: Tag = .init(name: "Pregnant", color: .red, fontColor: .white)
    TagView(tag: tag, height: 25, specificWidth: 200)
}
