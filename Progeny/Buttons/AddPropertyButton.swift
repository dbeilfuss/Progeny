//
//  AddPropertyButton.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/19/24.
//

import SwiftUI

struct AddPropertyButton: View {
    var title: String
    var icon: String
    var onTap: () -> Void
    let listType: ListType = .hyperlinks
    private var p: ButtonParameters { listType.parameters }
    var body: some View {
        Button {
            onTap()
        } label: {
            HyperlinkTextOverlay(p: ButtonParameters(
                title: title,
                data: nil,
                icon: icon,
                buttonType: p.buttonType,
                layout: p.layout,
                height: p.height,
                isSelected: false,
                requiresSubscription: true,
                activeSubscription: true
            ))
            .padding()
            .frame(height: p.heightNum)
            .foregroundColor(p.computedForegroundColor)
        }
        .frame(maxWidth: UIScreen.main.bounds.width * p.maxWidthRatio)
        .background(alignment: .center) {
            RoundedRectangle(cornerRadius: p.cornerRadius)
                .stroke(Color.black, lineWidth: p.buttonAppearance.borderWidth)
                .background(p.computedBackgroundColor)
                .cornerRadius(p.cornerRadius)
                .shadow(radius: p.buttonAppearance.shadowRadius)
        }
    }
}
