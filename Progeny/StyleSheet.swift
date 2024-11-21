//
//  StyleSheet.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/2/24.
//

import SwiftUI

struct StyleSheet {
    let colors: ColorStyleSheet
    let buttonStyle: ButtonStyleSheet
}

let globalStyleSheet = StyleSheet(
    colors: globalColorSheet,
    buttonStyle: globalButtonStyleSheet
)

struct ColorStyleSheet {
    let primary: Color
    let secondary: Color
    let tertiary: Color
    let quaternary: Color
    
    let fontColor: Color
    let fontColorHighlighted: Color
    let buttonBackgroundColor: Color
    let disabledColor: Color
    let highlightColor: Color
}

struct ButtonStyleSheet {
    let borderWidthLarge: CGFloat
    let borderWidthMedium: CGFloat
    let borderWidthSmall: CGFloat
    
    let cornerRadiusLarge: CGFloat
    let cornerRadiusMedium: CGFloat
    let cornerRadiusSmall: CGFloat
    
    let shadowRadiusLarge: CGFloat
    let shadowRadiusMedium: CGFloat
    let shadowRadiusSmall: CGFloat
    
    let heightLarge: CGFloat
    let heightMedium: CGFloat
    let heightSmall: CGFloat
    let heightMini: CGFloat
    
    let maxWidthRatioLarge: CGFloat
    let maxWidthRatioSmall: CGFloat
    
    let fontSizeMultiplyerLarge: CGFloat
    let fontSizeMultiplyerMedium: CGFloat
    let fontSizeMultiplyerSmall: CGFloat
    
    let edgeInsetsMedium: CGFloat
    let edgeInsetsSmall: CGFloat
}

private let globalColorSheet: ColorStyleSheet = .init(
    primary: .blue,
    secondary: .red,
    tertiary: .green,
    quaternary: .yellow,
    
    fontColor: .black,
    fontColorHighlighted: .white,
    buttonBackgroundColor: .white,
    disabledColor: .gray,
    highlightColor: .teal
)

private let globalButtonStyleSheet: ButtonStyleSheet = .init(
    borderWidthLarge: 3,
    borderWidthMedium: 2,
    borderWidthSmall: 1,
    
    cornerRadiusLarge: 14,
    cornerRadiusMedium: 9,
    cornerRadiusSmall: 7,
    
    shadowRadiusLarge: 10,
    shadowRadiusMedium: 3,
    shadowRadiusSmall: 2,
    
    heightLarge: 70,
    heightMedium: 45,
    heightSmall: 35,
    heightMini: 30,
    
    maxWidthRatioLarge: 0.8,
    maxWidthRatioSmall: 0.4,
    
    fontSizeMultiplyerLarge: 1,
    fontSizeMultiplyerMedium: 0.75,
    fontSizeMultiplyerSmall: 0.7,
    
    edgeInsetsMedium: 10,
    edgeInsetsSmall: 5
)
