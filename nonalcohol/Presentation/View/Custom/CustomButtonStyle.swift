//
//  CustomButtonStyle.swift
//  nonalcohol
//
//  Created by najin shin on 10/30/23.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    
    var isActive: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(isActive ? Color._activeButtonColor : Color._inactiveButtonColor)
    }
}
