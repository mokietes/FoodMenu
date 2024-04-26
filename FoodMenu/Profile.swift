//
//  Profile.swift
//  FoodMenu
//
//  Created by patron on 4/13/24.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        List{
            Section {
                HStack {
                    Text ("MT")
                        .font(.title)
                        .fontWeight(.semibold)
                        .frame(width: 72, height: 72)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text ("Mokie Tes")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        Text("example@email.com")
                            .font(.footnote)
                            .accentColor(.gray)
                    }
                }
            }
            Section("General") {
                HStack {
                    SettingButton(settingImage: "gear", title: "Version", settingColor: Color(.systemGray))
                }
            }
            Section("Account") {
                Button {
                    print("Sign out")
                } label: {
                    SettingButton(settingImage: "arrow.left.circle.fill", title: "Sign Out", settingColor: .red)
                }
                Button {
                    print("Delete Account")
                } label: {
                    SettingButton(settingImage: "xmark.circle.fill", title: "Delete Account", settingColor: .red)
                }
            }
        }
    }
}

#Preview {
    Profile()
}
