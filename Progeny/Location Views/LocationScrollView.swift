//
//  LocationScrollView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/23/24.
//

import SwiftUI

struct LocationScrollView: View {
    @Binding var locationList: [Location]
    var onTap: (Location) -> Void
    
    var listType: ListType = .locations
    private var p: ButtonParameters { listType.parameters }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(locationList, id: \.id) { location in
                    Button {
                        onTap(location)
                    } label: {
                        let listItem: ListItem = ListItem(from: location)
                        PrimaryTextOverlay(p: ButtonParameters(
                            title: (listItem.name == "" ? listItem.data : listItem.name) ?? "No ID",
                            data: listItem.data,
                            icon: listItem.icon,
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
        }
    }
}
