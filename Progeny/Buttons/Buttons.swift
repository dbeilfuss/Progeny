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
    var verticalPadding: CGFloat
}

struct ButtonParameters {
    let title: String
    var data: String?
    var icon: String?
    let buttonType: ButtonType
    let layout: TextLayout
    let height: ButtonHeight
    let isSelected: Bool
    var foregroundColor: Color?
    var backgroundColor: Color?
    let action: () -> Void
    
    // Computed Properties
    var buttonAppearance: ButtonAppearanceVariations { buttonType.appearance }
    var maxWidthRatio: Double { buttonAppearance.maxWidthRatio }
    var heightNum: CGFloat {
        switch height {
        case .tall:
            return buttonAppearance.heightLarge
        case .short:
            return buttonAppearance.heightSmall
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
    case animalListDetailed
    case locationList
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
                verticalPadding: globalButtonStyle.verticalPaddingMedium
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
                verticalPadding: globalButtonStyle.verticalPaddingMedium
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
                verticalPadding: globalButtonStyle.verticalPaddingSmall
            )
            return buttonStyleSheet
        case .animalListDetailed:
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
                verticalPadding: globalButtonStyle.verticalPaddingMedium
            )
            return buttonStyleSheet
        case .locationList:
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
                verticalPadding: globalButtonStyle.verticalPaddingMedium
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
                verticalPadding: globalButtonStyle.verticalPaddingMedium
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
                verticalPadding: globalButtonStyle.verticalPaddingMedium
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
                verticalPadding: globalButtonStyle.verticalPaddingMedium
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
                verticalPadding: -1
            )
            return buttonStyleSheet
        case .tabSelector:
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
                verticalPadding: globalButtonStyle.verticalPaddingMedium
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
                verticalPadding: globalButtonStyle.verticalPaddingMedium
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
    var isSelected: Bool = false
    var foregroundColor: Color?
    var backgroundColor: Color?
    let action: () -> Void
    
    var buttonParameters: ButtonParameters { ButtonParameters(title: title, data: data, icon: icon, buttonType: buttonType, layout: layout, height: height, isSelected: isSelected, action: action) }
    
    // Body
    var body: some View {
        switch buttonType {
        case .circle:
            CircleButton(p: buttonParameters)
        case .micro:
            CircleButton(p: buttonParameters)
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
            .padding(EdgeInsets(top: buttonParameters.buttonAppearance.verticalPadding/2, leading: 0, bottom: buttonParameters.buttonAppearance.verticalPadding/2, trailing: 0))
        }
        
    }
}

struct CircleButton: View {
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
                        .background(p.backgroundColor)
                        .cornerRadius(p.heightNum / 2)
                        .shadow(radius: p.buttonAppearance.shadowRadius)
                )
        }
        .padding(EdgeInsets(top: p.buttonAppearance.verticalPadding/2, leading: 0, bottom: p.buttonAppearance.verticalPadding/2, trailing: 0))
    }
}


struct SquareButton: View {
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
                        .background(p.backgroundColor)
                        .cornerRadius(p.cornerRadius)
                        .shadow(radius: p.buttonAppearance.shadowRadius)
                )
        }
        .padding(EdgeInsets(top: p.buttonAppearance.verticalPadding/2, leading: 0, bottom: p.buttonAppearance.verticalPadding/2, trailing: 0))
    }
}

//MARK: - Preview
var int = 1
func testAction() {
    print("buttonPressed \(int)")
    int += 1
}

#Preview {
    CustomButton(title: "White Lightning", data: "19",icon: "plus", buttonType: .cell, layout: .textLeftAlligned, height: .short, isSelected: false, action: testAction)
}
