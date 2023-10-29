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
    
    var body: some View {
        NavigationView {
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
                .foregroundColor(.black)
                
                Spacer()
                Text("HomeView")
                    .onTapGesture {
                        vm.saveAlcoholData()
                        vm.executeFetch()
                    }
                
                VStack {
                    ForEach(0..<vm.alcoholList.count, id: \.self) { idx in
                        let alcohol = vm.alcoholList[idx]
                        Text(alcohol.id)
                            .onTapGesture {
                                vm.deleteAlcoholData(id: alcohol.id)
                            }
                    }
                }
                Spacer()
            }
            .padding(30)
        }
        .onAppear {
            self.vm.executeFetch()
        }
    }
}
