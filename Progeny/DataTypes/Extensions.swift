//
//  Extensions.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/16/24.
//



// To handle nil-able String properties like visibleID:
extension Optional where Wrapped == String {
    var bound: String {
        get { self ?? "" }
        set { self = newValue.isEmpty ? nil : newValue }
    }
}
