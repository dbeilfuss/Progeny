//
//  Buttons.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/2/24.
//

import SwiftUI

//MARK: - DataTypes for Parameters
enum TextLayout {
    case textLeftAlligned
    case textRightAlligned
    case centerText
}

enum ButtonHeight {
    case tall
    case short
}

//MARK: - Button Appearance
struct ButtonAppearanceVariations {
    var maxWidthRatio: Double
    
    var heightLarge: CGFloat
    var heightSmall: CGFloat
    
    var cornerRadiusLarge: CGFloat
    var cornerRadiusSmall: CGFloat
    
    var shadowRadius: CGFloat
    
    var foregroundColor: Color
    var backgroundColor: Color
    var foregroundColorSelected: Color
    var backgroundColorSelected: Color
    
    var fontSizeMultiplyerLarge: CGFloat
    var fontSizeMultiplyerSmall: CGFloat
    
    var borderWidth: CGFloat
    var edgeInsets: CGFloat
}

struct ButtonParameters {
    let title: String
    var data: String?
    var icon: String?
    let buttonType: ButtonType
    let layout: TextLayout
    let height: ButtonHeight
    var specificHeight: CGFloat?
    let isSelected: Bool
    var foregroundColor: Color?
    var backgroundColor: Color?
    let action: () -> Void
    
    // Computed Properties
    var buttonAppearance: ButtonAppearanceVariations { buttonType.appearance }
    var maxWidthRatio: Double { buttonAppearance.maxWidthRatio }
    var heightNum: CGFloat {
        if let specificHeight = specificHeight {
            return specificHeight
        } else {
            switch height {
            case .tall:
                return buttonAppearance.heightLarge
            case .short:
                return buttonAppearance.heightSmall
            }
        }
    }
    var cornerRadius: CGFloat {
        switch height {
        case .tall:
            return buttonAppearance.cornerRadiusLarge
        case .short:
            return buttonAppearance.cornerRadiusSmall
        }
    }
    var fontSizeMultiplyer: CGFloat {
        switch height {
        case .tall:
            return buttonAppearance.fontSizeMultiplyerLarge
        case .short:
            return buttonAppearance.fontSizeMultiplyerSmall
        }
    }
    var computedForegroundColor: Color {
        if let foregroundColor = foregroundColor {
            return foregroundColor
        } else {
            switch isSelected {
            case true:
                return buttonAppearance.foregroundColorSelected
            case false:
                return buttonAppearance.foregroundColor
            }
        }
    }
    var computedBackgroundColor: Color {
        if let backgroundColor = backgroundColor {
            return backgroundColor
        } else {
            switch isSelected {
            case true:
                return buttonAppearance.backgroundColorSelected
            case false:
                return buttonAppearance.backgroundColor
            }
        }
    }
}



enum ButtonType {
    case primary
    case secondary
    case hyperlink
    case listTagged(userTags: [Tag], systemTags: [Tag])
    case listStandard
    case circle
    case micro
    case inAppPurchase
    case cell
    case tabSelector
    case filter
    
    var appearance: ButtonAppearanceVariations {
        let globalButtonStyle = globalStyleSheet.buttonStyle
        let globalColorStyle = globalStyleSheet.colors
        
        switch self {
        case .primary:
            let buttonStyleSheet: ButtonAppearanceVariations = .init(
                maxWidthRatio: globalButtonStyle.maxWidthRatioLarge,
                heightLarge: globalButtonStyle.heightLarge,
                heightSmall: globalButtonStyle.heightMedium,
                cornerRadiusLarge: globalButtonStyle.cornerRadiusLarge,
                cornerRadiusSmall: globalButtonStyle.cornerRadiusSmall,
                shadowRadius: globalButtonStyle.shadowRadiusSmall,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColor,
                backgroundColorSelected: globalColorStyle.highlightColor,
                fontSizeMultiplyerLarge: globalButtonStyle.fontSizeMultiplyerLarge,
                fontSizeMultiplyerSmall: globalButtonStyle.fontSizeMultiplyerLarge,
                borderWidth: globalButtonStyle.borderWidthSmall,
                edgeInsets: globalButtonStyle.edgeInsetsSmall
            )
            return buttonStyleSheet
        case .secondary:
            let buttonStyleSheet: ButtonAppearanceVariations = .init(
                maxWidthRatio: globalButtonStyle.maxWidthRatioSmall,
                heightLarge: globalButtonStyle.heightMedium,
                heightSmall: globalButtonStyle.heightMini,
                cornerRadiusLarge: globalButtonStyle.cornerRadiusLarge,
                cornerRadiusSmall: globalButtonStyle.cornerRadiusLarge,
                shadowRadius: globalButtonStyle.shadowRadiusSmall,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColorHighlighted,
                backgroundColorSelected: globalColorStyle.highlightColor,
                fontSizeMultiplyerLarge: globalButtonStyle.fontSizeMultiplyerMedium,
                fontSizeMultiplyerSmall: globalButtonStyle.fontSizeMultiplyerSmall,
                borderWidth: globalButtonStyle.borderWidthSmall,
                edgeInsets: globalButtonStyle.edgeInsetsMedium
            )
            return buttonStyleSheet
        case .hyperlink:
            let buttonStyleSheet: ButtonAppearanceVariations = .init(
                maxWidthRatio: globalButtonStyle.maxWidthRatioLarge,
                heightLarge: globalButtonStyle.heightMedium,
                heightSmall: globalButtonStyle.heightSmall,
                cornerRadiusLarge: globalButtonStyle.cornerRadiusLarge,
                cornerRadiusSmall: globalButtonStyle.cornerRadiusSmall,
                shadowRadius: 0,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColor,
                backgroundColorSelected: globalColorStyle.highlightColor,
                fontSizeMultiplyerLarge: globalButtonStyle.fontSizeMultiplyerMedium,
                fontSizeMultiplyerSmall: globalButtonStyle.fontSizeMultiplyerSmall,
                borderWidth: 0,
                edgeInsets: globalButtonStyle.edgeInsetsSmall
            )
            return buttonStyleSheet
        case .listTagged:
            let buttonStyleSheet: ButtonAppearanceVariations = .init(
                maxWidthRatio: globalButtonStyle.maxWidthRatioLarge,
                heightLarge: globalButtonStyle.heightLarge,
                heightSmall: globalButtonStyle.heightMedium,
                cornerRadiusLarge: globalButtonStyle.cornerRadiusLarge,
                cornerRadiusSmall: globalButtonStyle.cornerRadiusSmall,
                shadowRadius: globalButtonStyle.shadowRadiusSmall,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColor,
                backgroundColorSelected: globalColorStyle.highlightColor,
                fontSizeMultiplyerLarge: globalButtonStyle.fontSizeMultiplyerLarge,
                fontSizeMultiplyerSmall: globalButtonStyle.fontSizeMultiplyerLarge,
                borderWidth: globalButtonStyle.borderWidthSmall,
                edgeInsets: globalButtonStyle.edgeInsetsMedium
            )
            return buttonStyleSheet
        case .listStandard:
            let buttonStyleSheet: ButtonAppearanceVariations = .init(
                maxWidthRatio: globalButtonStyle.maxWidthRatioLarge,
                heightLarge: globalButtonStyle.heightLarge,
                heightSmall: globalButtonStyle.heightMedium,
                cornerRadiusLarge: globalButtonStyle.cornerRadiusLarge,
                cornerRadiusSmall: globalButtonStyle.cornerRadiusSmall,
                shadowRadius: globalButtonStyle.shadowRadiusSmall,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColor,
                backgroundColorSelected: globalColorStyle.highlightColor,
                fontSizeMultiplyerLarge: globalButtonStyle.fontSizeMultiplyerLarge,
                fontSizeMultiplyerSmall: globalButtonStyle.fontSizeMultiplyerLarge,
                borderWidth: globalButtonStyle.borderWidthSmall,
                edgeInsets: globalButtonStyle.edgeInsetsMedium
            )
            return buttonStyleSheet
        case .circle:
            let buttonStyleSheet: ButtonAppearanceVariations = .init(
                maxWidthRatio: 999,
                heightLarge: globalButtonStyle.heightLarge,
                heightSmall: globalButtonStyle.heightMedium,
                cornerRadiusLarge: 999,
                cornerRadiusSmall: 999,
                shadowRadius: globalButtonStyle.shadowRadiusMedium,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColor,
                backgroundColorSelected: globalColorStyle.highlightColor,
                fontSizeMultiplyerLarge: 18,
                fontSizeMultiplyerSmall: 11,
                borderWidth: globalButtonStyle.borderWidthSmall,
                edgeInsets: globalButtonStyle.edgeInsetsMedium
            )
            return buttonStyleSheet
        case .micro:
            let buttonStyleSheet: ButtonAppearanceVariations = .init(
                maxWidthRatio: 999,
                heightLarge: globalButtonStyle.heightSmall,
                heightSmall: globalButtonStyle.heightMini,
                cornerRadiusLarge: 999,
                cornerRadiusSmall: 999,
                shadowRadius: globalButtonStyle.shadowRadiusMedium,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColor,
                backgroundColorSelected: globalColorStyle.highlightColor,
                fontSizeMultiplyerLarge: 7,
                fontSizeMultiplyerSmall: 6,
                borderWidth: globalButtonStyle.borderWidthSmall,
                edgeInsets: globalButtonStyle.edgeInsetsMedium
            )
            return buttonStyleSheet
        case .inAppPurchase:
            let buttonStyleSheet: ButtonAppearanceVariations = .init(
                maxWidthRatio: globalButtonStyle.maxWidthRatioLarge,
                heightLarge: globalButtonStyle.heightLarge,
                heightSmall: globalButtonStyle.heightMedium,
                cornerRadiusLarge: globalButtonStyle.cornerRadiusLarge,
                cornerRadiusSmall: globalButtonStyle.cornerRadiusLarge,
                shadowRadius: globalButtonStyle.shadowRadiusSmall,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColor,
                backgroundColorSelected: globalColorStyle.highlightColor,
                fontSizeMultiplyerLarge: globalButtonStyle.fontSizeMultiplyerLarge,
                fontSizeMultiplyerSmall: globalButtonStyle.fontSizeMultiplyerLarge,
                borderWidth: globalButtonStyle.borderWidthSmall,
                edgeInsets: globalButtonStyle.edgeInsetsMedium
            )
            return buttonStyleSheet
        case .cell:
            let buttonStyleSheet: ButtonAppearanceVariations = .init(
                maxWidthRatio: 1,
                heightLarge: globalButtonStyle.heightMedium,
                heightSmall: globalButtonStyle.heightSmall,
                cornerRadiusLarge: 0,
                cornerRadiusSmall: 0,
                shadowRadius: 0,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColor,
                backgroundColorSelected: globalColorStyle.highlightColor,
                fontSizeMultiplyerLarge: globalButtonStyle.fontSizeMultiplyerLarge,
                fontSizeMultiplyerSmall: globalButtonStyle.fontSizeMultiplyerMedium,
                borderWidth: globalButtonStyle.borderWidthSmall,
                edgeInsets: -1
            )
            return buttonStyleSheet
        case .tabSelector:
            let buttonStyleSheet: ButtonAppearanceVariations = .init(
                maxWidthRatio: globalButtonStyle.maxWidthRatioLarge,
                heightLarge: globalButtonStyle.heightLarge,
                heightSmall: globalButtonStyle.heightMedium,
                cornerRadiusLarge: 0,
                cornerRadiusSmall: 0,
                shadowRadius: 0,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColor,
                backgroundColorSelected: globalColorStyle.highlightColor,
                fontSizeMultiplyerLarge: globalButtonStyle.fontSizeMultiplyerSmall,
                fontSizeMultiplyerSmall: globalButtonStyle.fontSizeMultiplyerSmall,
                borderWidth: 0,
                edgeInsets: globalButtonStyle.edgeInsetsMedium
            )
            return buttonStyleSheet
        case .filter:
            let buttonStyleSheet: ButtonAppearanceVariations = .init(
                maxWidthRatio: globalButtonStyle.maxWidthRatioLarge,
                heightLarge: globalButtonStyle.heightLarge,
                heightSmall: globalButtonStyle.heightMedium,
                cornerRadiusLarge: globalButtonStyle.cornerRadiusMedium,
                cornerRadiusSmall: globalButtonStyle.cornerRadiusSmall,
                shadowRadius: globalButtonStyle.shadowRadiusSmall,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColor,
                backgroundColorSelected: globalColorStyle.highlightColor,
                fontSizeMultiplyerLarge: globalButtonStyle.fontSizeMultiplyerSmall,
                fontSizeMultiplyerSmall: globalButtonStyle.fontSizeMultiplyerSmall,
                borderWidth: globalButtonStyle.borderWidthSmall,
                edgeInsets: globalButtonStyle.edgeInsetsMedium
            )
            return buttonStyleSheet
        }
    }
}

//MARK: - Custom Button Construction
struct CustomButton: View {
    // Parameters
    let title: String
    var data: String?
    var icon: String?
    let buttonType: ButtonType
    var layout: TextLayout = .textLeftAlligned
    let height: ButtonHeight
    var specificHeight: CGFloat?
    var isSelected: Bool = false
    var foregroundColor: Color?
    var backgroundColor: Color?
    let action: () -> Void
    
    var buttonParameters: ButtonParameters { ButtonParameters(title: title, data: data, icon: icon, buttonType: buttonType, layout: layout, height: height, specificHeight: specificHeight, isSelected: isSelected, foregroundColor: foregroundColor, backgroundColor: backgroundColor, action: action) }
    
    // Body
    var body: some View {
        switch buttonType {
        case .circle:
            CircleButton(p: buttonParameters)
        case .micro:
            CircleButton(p: buttonParameters)
        case .tabSelector:
            SquareButton(p: buttonParameters)
        case .filter:
            SquareButton(p: buttonParameters)
        default:
            Button(action: action) {
                buttonTextOverlay(p: buttonParameters)
                    .padding()
                    .frame(maxWidth: UIScreen.main.bounds.width * buttonParameters.maxWidthRatio)
                    .frame(height: buttonParameters.heightNum)
                    .background(
                        RoundedRectangle(cornerRadius: buttonParameters.cornerRadius)
                            .stroke(Color.black, lineWidth: buttonParameters.buttonAppearance.borderWidth)
                            .background(buttonParameters.computedBackgroundColor)
                            .cornerRadius(buttonParameters.cornerRadius)
                            .shadow(radius: buttonParameters.buttonAppearance.shadowRadius)
                    )
            }
            .padding(EdgeInsets(top: buttonParameters.buttonAppearance.edgeInsets/2, leading: 0, bottom: buttonParameters.buttonAppearance.edgeInsets/2, trailing: 0))
        }
        
    }
}

private struct CircleButton: View {
    let p: ButtonParameters
    
    var body: some View {
        Button(action: p.action) {
            buttonTextOverlay(p: p)
                .padding(p.fontSizeMultiplyer)
                .frame(maxWidth: p.heightNum)
                .frame(height: p.heightNum)
                .background(
                    RoundedRectangle(cornerRadius: p.heightNum / 2)
                        .stroke(Color.black, lineWidth: p.buttonAppearance.borderWidth)
                        .background(p.computedBackgroundColor)
                        .cornerRadius(p.heightNum / 2)
                        .shadow(radius: p.buttonAppearance.shadowRadius)
                )
        }
        .padding(EdgeInsets(top: p.buttonAppearance.edgeInsets/2, leading: 0, bottom: p.buttonAppearance.edgeInsets/2, trailing: 0))
    }
}


private struct SquareButton: View {
    let p: ButtonParameters
    
    var body: some View {
        Button(action: p.action) {
            buttonTextOverlay(p: p)
                .padding(.top, 12)
                .padding(.horizontal, p.height == .tall ? 0 : 10)
                .padding(.bottom, p.height == .tall ? 0 : 10)
                .frame(maxWidth: p.heightNum)
                .frame(height: p.heightNum)
                .background(
                    RoundedRectangle(cornerRadius: p.cornerRadius)
                        .stroke(Color.black, lineWidth: p.buttonAppearance.borderWidth)
                        .background(p.computedBackgroundColor)
                        .cornerRadius(p.cornerRadius)
                        .shadow(radius: p.buttonAppearance.shadowRadius)
                )
        }
        .padding(EdgeInsets(top: 0, leading: p.buttonAppearance.edgeInsets/2, bottom: 0, trailing: p.buttonAppearance.edgeInsets/2))
    }
}

//MARK: - Preview
var int = 1
func testAction() {
    print("buttonPressed \(int)")
    int += 1
}

#Preview {
    CustomButton(title: "Homestead", data: "29 Head",icon: "cat", buttonType: .listStandard, layout: .textLeftAlligned, height: .tall, isSelected: false, action: testAction)
}
