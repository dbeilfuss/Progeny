//
//  buttonTextOverlay.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/4/24.
//

import SwiftUI

struct buttonTextOverlay: View {
    // Parameters
    let title: String
    let data: String?
    let icon: String?
    let layout: ButtonLayout
    let height: CGFloat
    
    let foregroundColor: Color
    let fontSizeMultiplyer: CGFloat
    
    let buttonType: ButtonType
    
    // Build
    var body: some View {
        HStack {
            switch buttonType {
                case .primary:
                PrimaryTextOverlay(title: title, icon: icon, layout: layout, height: height, foregroundColor: foregroundColor, fontSizeMultiplyer: fontSizeMultiplyer)
            case .secondary:
                PrimaryTextOverlay(title: title, icon: icon, layout: layout, height: height, foregroundColor: foregroundColor, fontSizeMultiplyer: fontSizeMultiplyer)
            case .hyperlink:
                HyperlinkTextOverlay(title: title, icon: icon, layout: layout, height: height, foregroundColor: foregroundColor, fontSizeMultiplyer: fontSizeMultiplyer)
            case .animalListDetailed:
                PrimaryTextOverlay(title: title, icon: icon, layout: layout, height: height, foregroundColor: foregroundColor, fontSizeMultiplyer: fontSizeMultiplyer)

            case .locationList:
                PrimaryTextOverlay(title: title, icon: icon, layout: layout, height: height, foregroundColor: foregroundColor, fontSizeMultiplyer: fontSizeMultiplyer)

            case .circle:
                PrimaryTextOverlay(title: title, icon: icon, layout: layout, height: height, foregroundColor: foregroundColor, fontSizeMultiplyer: fontSizeMultiplyer)

            case .inAppPurchase:
                PrimaryTextOverlay(title: title, icon: icon, layout: layout, height: height, foregroundColor: foregroundColor, fontSizeMultiplyer: fontSizeMultiplyer)

            case .cell:
                CellTextOverlay(title: title, data: data, icon: icon, layout: layout, height: height, foregroundColor: foregroundColor, fontSizeMultiplyer: fontSizeMultiplyer)

            case .tabSelector:
                PrimaryTextOverlay(title: title, icon: icon, layout: layout, height: height, foregroundColor: foregroundColor, fontSizeMultiplyer: fontSizeMultiplyer)

            case .filter:
                PrimaryTextOverlay(title: title, icon: icon, layout: layout, height: height, foregroundColor: foregroundColor, fontSizeMultiplyer: fontSizeMultiplyer)

            }
        }
        .foregroundStyle(foregroundColor)
    }
}

//MARK: - Body Creation Options
struct PrimaryTextOverlay: View {
    // Parameters
    var title: String
    var icon: String?
    var layout: ButtonLayout
    let height: CGFloat
    
    var foregroundColor: Color
    var fontSizeMultiplyer: CGFloat
    
    // Stored Properties
    private let iconMultiplyer = 0.5
    
    // Build
    var body: some View {
        switch layout {
        case .textLeftAlligned:
            Text(title)
                .scaleEffect(fontSizeMultiplyer)
            Spacer()
            if let icon = icon {
                fetchIcon(icon)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: height * iconMultiplyer)
            }
        case .textRightAlligned:
            if let icon = icon {
                fetchIcon(icon)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: height * iconMultiplyer)
            }
            Spacer()
            Text(title)
                .scaleEffect(fontSizeMultiplyer)
        case .centerText:
            Text(title)
                .scaleEffect(fontSizeMultiplyer)
        }
    }
}

struct HyperlinkTextOverlay: View {
    // Parameters
    var title: String
    var icon: String?
    var layout: ButtonLayout
    let height: CGFloat
    
    var foregroundColor: Color
    var fontSizeMultiplyer: CGFloat
    
    // Stored Properties
    private let iconMultiplyer = 0.35
    
    // Build
    var body: some View {
        switch layout {
        case .textLeftAlligned:
            if let icon = icon {
                fetchIcon(icon)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: height * iconMultiplyer)
            }
            Text(title)
                .scaleEffect(fontSizeMultiplyer)
            Spacer()
        case .textRightAlligned:
            Spacer()
            if let icon = icon {
                fetchIcon(icon)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: height * iconMultiplyer)
            }
            Text(title)
                .scaleEffect(fontSizeMultiplyer)
        case .centerText:
            if let icon = icon {
                fetchIcon(icon)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: height * iconMultiplyer)
            }
            Text(title)
                .scaleEffect(fontSizeMultiplyer)
        }
    }
}

struct CellTextOverlay: View {
    // Parameters
    var title: String
    var data: String?
    var icon: String?
    var layout: ButtonLayout
    let height: CGFloat
    
    var foregroundColor: Color
    var fontSizeMultiplyer: CGFloat
    
    // Stored Properties
    private let iconMultiplyer = 0.4
    
    // Build
    var body: some View {
        switch layout {
        case .textLeftAlligned:
            if let icon = icon {
                            fetchIcon(icon)
                                .aspectRatio(contentMode: .fit)
                                .frame(height: height * iconMultiplyer)
                        }
            Text(title)
                .scaleEffect(fontSizeMultiplyer)
            Spacer()
            if let data = data {
                Text(data)
                    .scaleEffect(fontSizeMultiplyer)
            }
        case .textRightAlligned:
            if let data = data {
                            Text(data)
                                .scaleEffect(fontSizeMultiplyer)
                        }
            Spacer()
            Text(title)
                .scaleEffect(fontSizeMultiplyer)
            if let icon = icon {
                fetchIcon(icon)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: height * iconMultiplyer)
            }


        case .centerText:
            if let icon = icon {
                fetchIcon(icon)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: height * iconMultiplyer)
            }
            Text(title + ":")
                .scaleEffect(fontSizeMultiplyer)
            if let data = data {
                            Text(data)
                                .scaleEffect(fontSizeMultiplyer)
                        }
        }
    }
}

//MARK: - Helper Functions
func fetchIcon(_ iconName: String) -> Image {
    if let uiImage = UIImage(named: iconName) {  // Custom image from assets
        return Image(uiImage: uiImage)
            .resizable()
            .renderingMode(.template)
    } else {  // Fallback to SF Symbol if asset not found
        return Image(systemName: iconName)
            .resizable()
    }
}
