//
//  RestoreView.swift
//  nonalcohol
//
//  Created by najin shin on 10/30/23.
//

import SwiftUI

struct RestoreView: View {
    
    @ObservedObject public var vm: RestoreViewModel
    
    var body: some View {
        VStack {
            Text("데이터 파일 텍스트\n복사해서 붙혀넣어주세요")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("복사한 텍스트를 붙여넣어주세요.", text: $vm.data)
                .frame(height: 200)
            
            Button(action: {
                if !vm.data.isEmpty {
                    vm.restoreData()
                }
            }, label: {
                Text("확인")
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity, alignment: .center)
            })
            .buttonStyle(CustomButtonStyle(isActive: !vm.data.isEmpty))
        }
        .padding(25)
    }
}
