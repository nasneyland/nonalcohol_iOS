//
//  LoginView.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/18.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var mainRouter: MainRouter
    
    @ObservedObject public var vm: LoginViewModel
    
    var body: some View {
        VStack {
            Text("로그인\(vm.user.nickname)")
            
            VStack {
                Text("닉네임을 입력해주세요")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("닉네임", text: $vm.user.nickname)
            }
            Button(action: {
                vm.saveUserNickname()
                mainRouter.checkLogined()
            }, label: {
                Text("시작하기")
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .padding(25)
    }
}
