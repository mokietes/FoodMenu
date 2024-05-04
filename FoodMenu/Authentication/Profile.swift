//
//  Profile.swift
//  FoodMenu
//
//  Created by patron on 4/13/24.
//

import SwiftUI

struct Profile: View {
    @EnvironmentObject var viewModel: AuthModel
    var body: some View {
        if let user = viewModel.currentUser{
            List {
                Section {
                    HStack {
                        Text (User.TEST_USER.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .frame(width: 72, height: 72)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text (User.TEST_USER.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(User.TEST_USER.email)
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
}

#Preview {
    Profile()
}
