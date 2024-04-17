//
//  SettingButton.swift
//  FoodMenu
//
//  Created by patron on 4/16/24.
//

import SwiftUI

struct SettingButton: View {
    let settingImage: String
    let title: String
    let settingColor: Color
    
    var body: some View {
        HStack {
            Image (systemName: settingImage)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(settingColor)
            
        }
    }
}

#Preview {
    SettingButton(settingImage: "gear", title: "IOS", settingColor: Color(.systemGray))
}
