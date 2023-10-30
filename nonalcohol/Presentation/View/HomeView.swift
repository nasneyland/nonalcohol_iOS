//
//  HomeView.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/11.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var mainRouter: MainRouter
    
    @ObservedObject public var vm: HomeViewModel
    
    @State var showResolutionPopup: Bool = false
    @State var resolution: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        NavigationLink(destination: SettingView(vm: mainRouter.appDI.settingDependencies())) {
                            Image(systemName: "gearshape")
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: CalendarView(vm: mainRouter.appDI.calendarDependencies())) {
                            Image(systemName: "calendar")
                        }
                    }
                    .foregroundStyle(Color.black)
                    
                    Spacer()
                    
                    Text(vm.user.resolution.isEmpty ? "나만의 금주 다짐 설정하기" : vm.user.resolution)
                        .onTapGesture {
                            showResolutionPopup = true
                        }
                    
                    Image("")
                        .frame(width: 100, height: 100)
                        .background(.gray)
                    
                    Text(vm.dday)
                    
                    Spacer()
                    
                    HStack {
                        VStack {
                            Button {
                                vm.setTodayAlcoholState(state: .success)
                            } label: {
                                VStack(spacing: 3) {
                                    Image(systemName: "checkmark")
                                    Text("성공")
                                }
                                .foregroundStyle(Color.white)
                            }
                            .buttonStyle(CustomActionButtonStyle(isActive: vm.todayAlcoholState == .success))
                        }
                        
                        Spacer()
                        
                        VStack {
                            Button {
                                vm.setTodayAlcoholState(state: .fail)
                            } label: {
                                VStack(spacing: 3) {
                                    Image(systemName: "xmark")
                                    Text("실패")
                                }
                                .foregroundStyle(Color.white)
                            }
                            .buttonStyle(CustomActionButtonStyle(isActive: vm.todayAlcoholState == .fail))
                        }
                    }
                }
                .padding(30)
                
                // 금주다짐 입력 팝업
                if showResolutionPopup {
                    ZStack {
                        Color.black.opacity(0.7)
                        
                        VStack {
                            Spacer()
                            TextField("금주다짐 입력하기", text: $resolution)
                                .background(Color.white)
                            
                            Button(action: {
                                if !resolution.isEmpty {
                                    vm.setResolution(resolution: resolution)
                                    showResolutionPopup = false
                                    vm.executeFetch()
                                }
                            }, label: {
                                Text("입력하기")
                                    .foregroundStyle(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            })
                            .buttonStyle(CustomButtonStyle(isActive: !resolution.isEmpty))
                        }
                    }
                }
            }
        }
        .onAppear {
            self.vm.executeFetch()
        }
    }
}
