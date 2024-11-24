//
//  buttonTextOverlay.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/4/24.
//

import SwiftUI

struct buttonTextOverlay: View {
    let p: ButtonParameters
    
    // Build
    var body: some View {
        HStack {
            switch p.buttonType {
            case .primary:
                PrimaryTextOverlay(p: p)
            case .secondary:
                PrimaryTextOverlay(p: p)
            case .hyperlink:
                HyperlinkTextOverlay(p: p)
            case .listTagged(let userTags, let systemTags):
                ListTaggedTextOverlay(p: p, userTags: userTags, systemTags: systemTags)
            case .listStandard:
                ListStandardTextOverlay(p: p)
            case .circle:
                CircleOverlay(p: p)
            case .micro:
                CircleOverlay(p: p)
            case .inAppPurchase:
                DataTextOverlay(p: p)
            case .cell:
                CellTextOverlay(p: p)
            case .tabSelector:
                SquareOverlay(p: p)
            case .square:
                SquareOverlay(p: p)
                
            }
        }
        .foregroundStyle(p.computedForegroundColor)
    }
}

//MARK: - Text Overlays

struct PrimaryTextOverlay: View {
    let p: ButtonParameters
    
    // Stored Properties
    private let iconMultiplyer = 0.5
    
    // Build
    var body: some View {
        switch p.layout {
        case .textLeftAlligned:
            Text(p.title)
                .scaleEffect(p.fontSizeMultiplyer)
                .lineLimit(0)
            if let icon = p.icon {
                fetchIcon(icon)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: p.heightNum * iconMultiplyer)
                    .frame(maxWidth: p.heightNum * iconMultiplyer)
            }
        case .textRightAlligned:
            if let icon = p.icon {
                fetchIcon(icon)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: p.heightNum * iconMultiplyer)
                    .frame(maxWidth: p.heightNum * iconMultiplyer)
                    .padding(.trailing, 8)
            }
            Text(p.title)
                .scaleEffect(p.fontSizeMultiplyer)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .lineLimit(0)
        case .centerText:
            Text(p.title)
                .scaleEffect(p.fontSizeMultiplyer)
                .lineLimit(0)
        }
    }
}

struct ListStandardTextOverlay: View {
    let p: ButtonParameters
    
    // Stored Properties
    private let iconMultiplyer = 0.5
    
    // Build
    var body: some View {
        switch p.layout {
        case .textLeftAlligned:
            
            Text(p.title)
                .scaleEffect(p.fontSizeMultiplyer)
            Spacer()
            Text(p.data ?? "")
                .scaleEffect(p.fontSizeMultiplyer * 0.8)
        case .textRightAlligned:
            Text(p.data ?? "")
                .scaleEffect(p.fontSizeMultiplyer * 0.8)
            Spacer()
            Text(p.title)
                .scaleEffect(p.fontSizeMultiplyer)
        case .centerText:
            VStack() {
                Text(p.title)
                    .scaleEffect(p.fontSizeMultiplyer)
                if p.data != nil {
                    if p.height == .tall {
                        Spacer()
                    }
                    Text(p.data ?? "")
                        .scaleEffect(p.fontSizeMultiplyer * (p.height == .tall ? 0.8 : 0.7))
                }
            }
        }
    }
}

struct ListTaggedTextOverlay: View {
    let p: ButtonParameters
    let userTags: [Tag]
    let systemTags: [Tag]
    
    // Stored Properties
    private let iconMultiplyer = 0.5
    
    // Build
    var body: some View {
        switch p.layout {
        case .textLeftAlligned:
            HStack() {
                VStack(alignment: .leading) {
                    Text(p.title)
                        .scaleEffect(p.fontSizeMultiplyer)
                    Spacer()
                    Text(p.data ?? "")
                        .scaleEffect(p.fontSizeMultiplyer)
                }
                VStack(spacing: 1) {
                    ForEach(userTags) { tag in
                        TagView(tag: tag, height: p.heightNum / 5)
                    }
                }
                VStack() {
                    ForEach(systemTags) { tag in
                        TagView(tag: tag, height: p.heightNum / 5)
                    }
                }
            }
        case .textRightAlligned:
            Text(p.data ?? "")
                .scaleEffect(p.fontSizeMultiplyer * 0.8)
            Spacer()
            Text(p.title)
                .scaleEffect(p.fontSizeMultiplyer)
        case .centerText:
            VStack() {
                Text(p.title)
                    .scaleEffect(p.fontSizeMultiplyer)
                if p.data != nil {
                    if p.height == .tall {
                        Spacer()
                    }
                    Text(p.data ?? "")
                        .scaleEffect(p.fontSizeMultiplyer * (p.height == .tall ? 0.8 : 0.7))
                }
            }
        }
    }
}

struct HyperlinkTextOverlay: View {
    let p: ButtonParameters
    
    // Stored Properties
    private let iconMultiplyer = 0.35
    
    // Build
    var body: some View {
        switch p.layout {
        case .textLeftAlligned:
            HStack() {
                if let icon = p.icon {
                    fetchIcon(icon)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: p.heightNum * iconMultiplyer)
                        .frame(maxWidth: p.heightNum * iconMultiplyer)
                }
                Text(p.title)
                    .scaleEffect(p.fontSizeMultiplyer)
                Spacer()
            }
        case .textRightAlligned:
            HStack() {
                if let icon = p.icon {
                    fetchIcon(icon)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: p.heightNum * iconMultiplyer)
                        .frame(maxWidth: p.heightNum * iconMultiplyer)
                }
                Spacer()
                Text(p.title)
                    .scaleEffect(p.fontSizeMultiplyer)
            }
        case .centerText:
            HStack() {
                if let icon = p.icon {
                    fetchIcon(icon)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: p.heightNum * iconMultiplyer)
                        .frame(maxWidth: p.heightNum * iconMultiplyer)
                }
                Text(p.title)
                    .scaleEffect(p.fontSizeMultiplyer)
            }
        }
    }
}

struct CellTextOverlay: View {
    let p: ButtonParameters
    
    // Stored Properties
    private let iconMultiplyer = 0.4
    
    // Build
    var body: some View {
        switch p.layout {
        case .textLeftAlligned:
            if let icon = p.icon {
                fetchIcon(icon)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: p.heightNum * iconMultiplyer)
                    .frame(maxWidth: p.heightNum * iconMultiplyer)
            }
            Text(p.title)
                .scaleEffect(p.fontSizeMultiplyer)
            Spacer()
            if let data = p.data {
                Text(data)
                    .scaleEffect(p.fontSizeMultiplyer)
            }
        case .textRightAlligned:
            if let data = p.data {
                Text(data)
                    .scaleEffect(p.fontSizeMultiplyer)
            }
            Spacer()
            Text(p.title)
                .scaleEffect(p.fontSizeMultiplyer)
            if let icon = p.icon {
                fetchIcon(icon)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: p.heightNum * iconMultiplyer)
                    .frame(maxWidth: p.heightNum * iconMultiplyer)
            }
            
            
        case .centerText:
            if let icon = p.icon {
                fetchIcon(icon)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: p.heightNum * iconMultiplyer)
                    .frame(maxWidth: p.heightNum * iconMultiplyer)
            }
            Text(p.title + ":")
                .scaleEffect(p.fontSizeMultiplyer)
            if let data = p.data {
                Text(data)
                    .scaleEffect(p.fontSizeMultiplyer)
            }
        }
    }
}

struct DataTextOverlay: View {
    let p: ButtonParameters
    
    // Stored Properties
    private let iconMultiplyer = 0.5
    
    // Build
    var body: some View {
        switch p.layout {
        case .textLeftAlligned:
            if let icon = p.icon {
                fetchIcon(icon)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: p.heightNum * iconMultiplyer)
                    .frame(maxWidth: p.heightNum * iconMultiplyer)
                Text(p.title)
                    .scaleEffect(p.fontSizeMultiplyer)
                Spacer()
                if let data = p.data {
                    Text(data)
                        .scaleEffect(p.fontSizeMultiplyer)
                }
            }
        case .textRightAlligned:
            if let icon = p.icon {
                fetchIcon(icon)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: p.heightNum * iconMultiplyer)
                    .frame(maxWidth: p.heightNum * iconMultiplyer)
            }
            if let data = p.data {
                Text(data)
                    .scaleEffect(p.fontSizeMultiplyer)
                Spacer()
            }
            Spacer()
            Text(p.title)
                .scaleEffect(p.fontSizeMultiplyer)
        case .centerText:
            if let icon = p.icon {
                fetchIcon(icon)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: p.heightNum * iconMultiplyer)
                    .frame(maxWidth: p.heightNum * iconMultiplyer)
                Spacer()
            }
            Text(p.title)
                .scaleEffect(p.fontSizeMultiplyer)
            Spacer()
            if let data = p.data {
                Text(data)
                    .scaleEffect(p.fontSizeMultiplyer)
            }
            
        }
    }
}

struct CircleOverlay: View {
    let p: ButtonParameters
    
    // Build
    var body: some View {
        VStack() {
            if let icon = p.icon {
                fetchIcon(icon)
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct SquareOverlay: View {
    let p: ButtonParameters
    
    // Computed Properties
    private var iconMultiplyer: CGFloat { p.icon == "minus" ? 0.5 : 0.7 }
    
    // Build
    var body: some View {
        VStack(spacing: p.icon == "minus" ? 15 : 2) {
            if p.icon == "minus" {
                Spacer()
            }
            if let icon = p.icon {
                fetchIcon(icon)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: p.heightNum * iconMultiplyer)
            }
            if p.height == .tall {
                Text(p.title)
                    .scaleEffect(p.fontSizeMultiplyer)
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

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
