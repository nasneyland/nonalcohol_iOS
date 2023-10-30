//
//  SettingView.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/19.
//

import SwiftUI

struct SettingView: View {
    
    @EnvironmentObject var mainRouter: MainRouter
    
    @ObservedObject public var vm: SettingViewModel
    
    var body: some View {
//        let titleList = vm.settingModel
        
        ScrollView(showsIndicators: false) {
//            VStack {
                Text("로그아웃")
                    .onTapGesture {
                        vm.deleteUserInfo()
                        mainRouter.checkLogined()
                    }
//                
//                ForEach(0 ..< titleList.count, id: \.self) { i in
//                    let title = titleList[i]
//                    
//                    // 앱 설정 타이틀
//                    if title.text != "" {
//                        Text(title.text)
//                            .gSans(size: 14, weight: .bold)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .padding(EdgeInsets(top: 13, leading: 0, bottom: 13, trailing: 0))
//                    }
//                    
//                    VStack {
//                        ForEach(0 ..< title.list.count, id: \.self) { j in
//                            let content: SettingAppType = title.list[j]
//                            let title = vm.getTitleValue(type: content)
//                            let value = vm.getItemValue(type: content)
//                            let itemType = vm.getItemType(type: content)
//                            
//                            // 회원이 아닌 경우 자동로그인 셀 안보이게
//                            if !vm.isHidden(type: content) {
//                                VStack {
//                                    HStack {
//                                        
//                                        // 앱 설정 세부 타이틀
//                                        Text(title)
//                                            .baselineOffset(2)
//                                        
//                                        Spacer()
//                                        
//                                        if itemType == .button {
//                                            
//                                            // arrow 버튼 타입 값 지정
//                                            Button {
//                                            } label: {
//                                                HStack {
//                                                    Text(value)
//                                                        .gSans(size: 12, weight: .medium)
//                                                        .foregroundColor(.black) -> style
//                                                    Image("arrowRight")
//                                                }
//                                            }
//                                            .disabled(true)
//                                            
//                                        } else if itemType == .toggle {
//                                            
//                                            // toggle 버튼 값 지정
//                                            ZStack {
//                                                if content == .push {
//                                                    Toggle("", isOn: $vm.autoLogin)
//                                                        .onChange(of: vm.autoLogin) { value in
//                                                            vm.delegate?.didTapToggle(type: .login_auto, value: value)
//                                                        }
//                                                }
//                                            }
//                                            .frame(width: 50)
//                                            .toggleStyle(SwitchToggleStyle(tint: Color._FFD600))
//                                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 6))
//                                            
//                                        } else if itemType == .text {
//                                            
//                                            // Text 타입 값 지정
//                                            Text(value)
//                                                .gSans(size: 12, weight: .medium)
//                                                .foregroundColor(._999999) -> style
//                                        }
//                                    }
//                                    .frame(height: 35)
//                                    .contentShape(Rectangle())
//                                    .onTapGesture {
//                                        if itemType != .roundButton {
//                                            vm.delegate?.didTapButton(type: content)
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//                Spacer().frame(height: 30)
//            }
        }
        .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
    }
}
