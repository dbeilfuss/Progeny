//
//  Buttons.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/2/24.
//

import SwiftUI

//MARK: - DataTypes for Parameters
enum ButtonLayout {
    case textLeftAlligned
    case textRightAlligned
    case centerText
}

enum ButtonHeight {
    case tall
    case short
}

//MARK: - Button Appearance
struct ButtonAppearance {
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

enum ButtonType {
    case primary
    case secondary
    case hyperlink
    case animalListDetailed
    case locationList
    case circle
    case inAppPurchase
    case cell
    case tabSelector
    case filter
    
    var appearance: ButtonAppearance {
        let globalButtonStyle = globalStyleSheet.buttonStyle
        let globalColorStyle = globalStyleSheet.colors
        
        switch self {
        case .primary:
            let buttonStyleSheet: ButtonAppearance = .init(
                maxWidthRatio: globalButtonStyle.maxWidthRatioLarge,
                heightLarge: globalButtonStyle.heightLarge,
                heightSmall: globalButtonStyle.heightMedium,
                cornerRadiusLarge: globalButtonStyle.cornerRadiusLarge,
                cornerRadiusSmall: globalButtonStyle.cornerRadiusSmall,
                shadowRadius: globalButtonStyle.shadowRadiusSmall,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColor,
                backgroundColorSelected: globalColorStyle.buttonBackgroundColor,
                fontSizeMultiplyerLarge: globalButtonStyle.fontSizeMultiplyerLarge,
                fontSizeMultiplyerSmall: globalButtonStyle.fontSizeMultiplyerLarge,
                borderWidth: globalButtonStyle.borderWidthSmall,
                verticalPadding: globalButtonStyle.verticalPadding
            )
            return buttonStyleSheet
        case .secondary:
            let buttonStyleSheet: ButtonAppearance = .init(
                maxWidthRatio: globalButtonStyle.maxWidthRatioSmall,
                heightLarge: globalButtonStyle.heightMedium,
                heightSmall: globalButtonStyle.heightSmall,
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
                verticalPadding: globalButtonStyle.verticalPadding
            )
            return buttonStyleSheet
        case .hyperlink:
            let buttonStyleSheet: ButtonAppearance = .init(
                maxWidthRatio: globalButtonStyle.maxWidthRatioLarge,
                heightLarge: globalButtonStyle.heightMedium,
                heightSmall: globalButtonStyle.heightSmall,
                cornerRadiusLarge: globalButtonStyle.cornerRadiusLarge,
                cornerRadiusSmall: globalButtonStyle.cornerRadiusSmall,
                shadowRadius: 0,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColor,
                backgroundColorSelected: globalColorStyle.buttonBackgroundColor,
                fontSizeMultiplyerLarge: globalButtonStyle.fontSizeMultiplyerMedium,
                fontSizeMultiplyerSmall: globalButtonStyle.fontSizeMultiplyerSmall,
                borderWidth: 0,
                verticalPadding: globalButtonStyle.verticalPadding
            )
            return buttonStyleSheet
        case .animalListDetailed:
            let buttonStyleSheet: ButtonAppearance = .init(
                maxWidthRatio: globalButtonStyle.maxWidthRatioLarge,
                heightLarge: globalButtonStyle.heightLarge,
                heightSmall: globalButtonStyle.heightMedium,
                cornerRadiusLarge: globalButtonStyle.cornerRadiusLarge,
                cornerRadiusSmall: globalButtonStyle.cornerRadiusSmall,
                shadowRadius: globalButtonStyle.shadowRadiusSmall,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColor,
                backgroundColorSelected: globalColorStyle.buttonBackgroundColor,
                fontSizeMultiplyerLarge: globalButtonStyle.fontSizeMultiplyerLarge,
                fontSizeMultiplyerSmall: globalButtonStyle.fontSizeMultiplyerLarge,
                borderWidth: globalButtonStyle.borderWidthSmall,
                verticalPadding: globalButtonStyle.verticalPadding
            )
            return buttonStyleSheet
        case .locationList:
            let buttonStyleSheet: ButtonAppearance = .init(
                maxWidthRatio: globalButtonStyle.maxWidthRatioLarge,
                heightLarge: globalButtonStyle.heightLarge,
                heightSmall: globalButtonStyle.heightMedium,
                cornerRadiusLarge: globalButtonStyle.cornerRadiusLarge,
                cornerRadiusSmall: globalButtonStyle.cornerRadiusSmall,
                shadowRadius: globalButtonStyle.shadowRadiusSmall,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColor,
                backgroundColorSelected: globalColorStyle.buttonBackgroundColor,
                fontSizeMultiplyerLarge: globalButtonStyle.fontSizeMultiplyerLarge,
                fontSizeMultiplyerSmall: globalButtonStyle.fontSizeMultiplyerLarge,
                borderWidth: globalButtonStyle.borderWidthSmall,
                verticalPadding: globalButtonStyle.verticalPadding
            )
            return buttonStyleSheet
        case .circle:
            let buttonStyleSheet: ButtonAppearance = .init(
                maxWidthRatio: globalButtonStyle.maxWidthRatioLarge,
                heightLarge: globalButtonStyle.heightLarge,
                heightSmall: globalButtonStyle.heightMedium,
                cornerRadiusLarge: globalButtonStyle.cornerRadiusLarge,
                cornerRadiusSmall: globalButtonStyle.cornerRadiusSmall,
                shadowRadius: globalButtonStyle.shadowRadiusSmall,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColor,
                backgroundColorSelected: globalColorStyle.buttonBackgroundColor,
                fontSizeMultiplyerLarge: globalButtonStyle.fontSizeMultiplyerLarge,
                fontSizeMultiplyerSmall: globalButtonStyle.fontSizeMultiplyerLarge,
                borderWidth: globalButtonStyle.borderWidthSmall,
                verticalPadding: globalButtonStyle.verticalPadding
            )
            return buttonStyleSheet
        case .inAppPurchase:
            let buttonStyleSheet: ButtonAppearance = .init(
                maxWidthRatio: globalButtonStyle.maxWidthRatioLarge,
                heightLarge: globalButtonStyle.heightLarge,
                heightSmall: globalButtonStyle.heightMedium,
                cornerRadiusLarge: globalButtonStyle.cornerRadiusLarge,
                cornerRadiusSmall: globalButtonStyle.cornerRadiusSmall,
                shadowRadius: globalButtonStyle.shadowRadiusSmall,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColor,
                backgroundColorSelected: globalColorStyle.buttonBackgroundColor,
                fontSizeMultiplyerLarge: globalButtonStyle.fontSizeMultiplyerLarge,
                fontSizeMultiplyerSmall: globalButtonStyle.fontSizeMultiplyerLarge,
                borderWidth: globalButtonStyle.borderWidthSmall,
                verticalPadding: globalButtonStyle.verticalPadding
            )
            return buttonStyleSheet
        case .cell:
            let buttonStyleSheet: ButtonAppearance = .init(
                maxWidthRatio: 1,
                heightLarge: globalButtonStyle.heightMedium,
                heightSmall: globalButtonStyle.heightSmall,
                cornerRadiusLarge: 0,
                cornerRadiusSmall: 0,
                shadowRadius: 0,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColor,
                backgroundColorSelected: globalColorStyle.buttonBackgroundColor,
                fontSizeMultiplyerLarge: globalButtonStyle.fontSizeMultiplyerLarge,
                fontSizeMultiplyerSmall: globalButtonStyle.fontSizeMultiplyerMedium,
                borderWidth: globalButtonStyle.borderWidthSmall,
                verticalPadding: 0
            )
            return buttonStyleSheet
        case .tabSelector:
            let buttonStyleSheet: ButtonAppearance = .init(
                maxWidthRatio: globalButtonStyle.maxWidthRatioLarge,
                heightLarge: globalButtonStyle.heightLarge,
                heightSmall: globalButtonStyle.heightMedium,
                cornerRadiusLarge: globalButtonStyle.cornerRadiusLarge,
                cornerRadiusSmall: globalButtonStyle.cornerRadiusSmall,
                shadowRadius: globalButtonStyle.shadowRadiusSmall,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColor,
                backgroundColorSelected: globalColorStyle.buttonBackgroundColor,
                fontSizeMultiplyerLarge: globalButtonStyle.fontSizeMultiplyerLarge,
                fontSizeMultiplyerSmall: globalButtonStyle.fontSizeMultiplyerLarge,
                borderWidth: globalButtonStyle.borderWidthSmall,
                verticalPadding: globalButtonStyle.verticalPadding
            )
            return buttonStyleSheet
        case .filter:
            let buttonStyleSheet: ButtonAppearance = .init(
                maxWidthRatio: globalButtonStyle.maxWidthRatioLarge,
                heightLarge: globalButtonStyle.heightLarge,
                heightSmall: globalButtonStyle.heightMedium,
                cornerRadiusLarge: globalButtonStyle.cornerRadiusLarge,
                cornerRadiusSmall: globalButtonStyle.cornerRadiusSmall,
                shadowRadius: globalButtonStyle.shadowRadiusSmall,
                foregroundColor: globalColorStyle.fontColor,
                backgroundColor: globalColorStyle.buttonBackgroundColor,
                foregroundColorSelected: globalColorStyle.fontColor,
                backgroundColorSelected: globalColorStyle.buttonBackgroundColor,
                fontSizeMultiplyerLarge: globalButtonStyle.fontSizeMultiplyerLarge,
                fontSizeMultiplyerSmall: globalButtonStyle.fontSizeMultiplyerLarge,
                borderWidth: globalButtonStyle.borderWidthSmall,
                verticalPadding: globalButtonStyle.verticalPadding
            )
            return buttonStyleSheet
        }
    }
}

//MARK: - Custom Button Construction
struct CustomButton: View {
    // Parameters
    let title: String
    let data: String?
    let icon: String?
    let buttonType: ButtonType
    var layout: ButtonLayout = .textLeftAlligned
    var height: ButtonHeight
    var isSelected: Bool = false
    let action: () -> Void
    
    // Computed Properties
    private var buttonAppearance: ButtonAppearance { buttonType.appearance }
    private var maxWidthRatio: Double { buttonAppearance.maxWidthRatio }
    
    private var heightNum: CGFloat {
        switch height {
        case .tall:
            return buttonAppearance.heightLarge
        case .short:
            return buttonAppearance.heightSmall
        }
    }
    
    private var cornerRadius: CGFloat {
        switch height {
        case .tall:
            return buttonAppearance.cornerRadiusLarge
        case .short:
            return buttonAppearance.cornerRadiusSmall
        }
    }
    
    private var fontSizeMultiplyer: CGFloat {
        switch height {
        case .tall:
            return buttonAppearance.fontSizeMultiplyerLarge
        case .short:
            return buttonAppearance.fontSizeMultiplyerSmall
        }
    }
    
    private var foregroundColor: Color {
        switch isSelected {
        case true:
            return buttonAppearance.foregroundColorSelected
        case false:
            return buttonAppearance.foregroundColor
        }
    }
    
    private var backgroundColor: Color {
        switch isSelected {
        case true:
            return buttonAppearance.backgroundColorSelected
        case false:
            return buttonAppearance.backgroundColor
        }
    }

    // Body
    var body: some View {
        Button(action: action) {
            buttonTextOverlay(title: title, data: data, icon: icon, layout: layout, height: heightNum, foregroundColor: foregroundColor, fontSizeMultiplyer: fontSizeMultiplyer, buttonType: buttonType)
            .padding()
            .frame(maxWidth: UIScreen.main.bounds.width * maxWidthRatio)
            .frame(height: heightNum)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.black, lineWidth: buttonAppearance.borderWidth)
                    .background(backgroundColor)
                    .cornerRadius(cornerRadius)
                    .shadow(radius: buttonAppearance.shadowRadius)
                )
        }
        .padding(EdgeInsets(top: buttonAppearance.verticalPadding/2, leading: 0, bottom: buttonAppearance.verticalPadding/2, trailing: 0))
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