//
//  CustomCalendarCell.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/27.
//

import SwiftUI

struct CustomCalendarCell: View {
    
    @State var date: String = ""
    
    var body: some View {
        
        VStack(spacing: 0) {
            ZStack(alignment: .topTrailing){
                
                VStack(spacing: 5) {
                    // 날짜
                    Text(date)
                }
                .frame(height: 30)
                .padding(EdgeInsets(top: 6, leading: 0, bottom: 0, trailing: 0))
//                if time != "" {
//                    Image(systemName: "circlebadge.fill")
//                        .resizable()
//                        .frame(width: 5, height: 5)
//                        .foregroundColor(time != "" ? Color._FFD600 : Color.white) -> style
//                }
            }
            
        }
        .contentShape(Rectangle())
        .padding(EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0))
    }
}
