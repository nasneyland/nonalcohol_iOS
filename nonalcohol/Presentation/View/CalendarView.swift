//
//  CalendarView.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/19.
//

import SwiftUI

struct CalendarView: View {
    
    @ObservedObject public var vm: CalendarViewModel
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            LazyVStack {
                Spacer().frame(height: 15)
                
                // 달력 이동 < @월 >
                HStack(spacing: 15) {
                    Spacer()
                    Button {
                        vm.setCalendarDate(isPrev: true)
                    } label: {
                        Image(systemName: "arrow.left")
                            .frame(width: 20, height: 20)
                    }
                    Text("\(String(vm.currentYear)).\(String(vm.currentMonth))")
                    Button {
                        vm.setCalendarDate(isPrev: false)
                    } label: {
                        Image(systemName: "arrow.right")
                            .frame(width: 20, height: 20)
                    }
                    Spacer()
                }
                
                if let interval = vm.monthInterval {
                    CustomCalendarView(dateInterval: interval) { date in
                        // 캘린더 날짜 셀
                        CustomCalendarCell(date: DateFormatter.day.string(from: date))
                            .foregroundStyle(.black)
                    } header: {
                        // 캘린더 요일 행
                        Text(DateFormatter.weekDay.string(from: $0))
                    } trailing: {
                        // 빈 날짜 셀
                        CustomCalendarCell(date: DateFormatter.day.string(from: $0))
                            .foregroundStyle(.gray)
                    }
                }
                
                Spacer().frame(height: 25)
                
            }
        }.onAppear{
            vm.executeFetch()
        }
    }
}
