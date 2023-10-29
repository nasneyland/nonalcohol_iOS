//
//  CustomCalendarView.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/24.
//

import SwiftUI

struct CustomCalendarView<Day: View, Header: View, Trailing: View>: View {
    
    private let dateInterval: DateInterval
    
    private let content: (Date) -> Day // 날짜칸
    private let header: (Date) -> Header // 요일행
    private let trailing: (Date) -> Trailing // 빈행
    
    private let daysInWeek = 7
    
    private let calendar: Calendar = {
        var calendar = Calendar.current
        calendar.firstWeekday = 2 // 월요일부터 시작
        return calendar
    }()
    
    init(
        dateInterval: DateInterval,
        @ViewBuilder content: @escaping (Date) -> Day,
        @ViewBuilder header: @escaping (Date) -> Header,
        @ViewBuilder trailing: @escaping (Date) -> Trailing
    ) {
        self.dateInterval = dateInterval
        self.content = content
        self.header = header
        self.trailing = trailing
    }
    
    var body: some View {
        let dates = makeDates()
        
        return LazyVGrid(columns: Array(repeating: GridItem(), count: daysInWeek)) {
            ForEach(dates, id: \.month) { (month, days) in
                Section() {
                    ForEach(makeHeaderDays(for: month), id: \.self, content: header)
                    ForEach(days, id: \.self) { date in
                        if calendar.isDate(date, equalTo: month, toGranularity: .month) {
                            content(date)
                        } else {
                            trailing(date)
                        }
                    }
                }
            }
        }
    }
}

private extension CustomCalendarView {
    func makeDates() -> [(month: Date, days: [Date])] {
        calendar
            .generateDates(
                for: dateInterval,
                matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0)
            )
            .map { ($0, days(for: $0)) }
    }
    
    func makeHeaderDays(for month: Date) -> [Date] {
        guard let week = calendar.dateInterval(of: .weekOfMonth, for: month) else { return [] }
        
        return calendar
            .generateDates(for: week, matching: DateComponents(hour: 0, minute: 0, second: 0))
            .prefix(daysInWeek)
            .array
    }
    
    func days(for month: Date) -> [Date] {
        guard let monthInterval = calendar.dateInterval(of: .month, for: month),
              let monthFirstWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.start),
              let monthLastWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.end - 1)
        else {
            return []
        }
        
        return calendar.generateDates(
            for: DateInterval(start: monthFirstWeek.start, end: monthLastWeek.end),
            matching: DateComponents(hour: 0, minute: 0, second: 0)
        )
    }
}

extension CustomCalendarView: Equatable {
    static func == (lhs: CustomCalendarView<Day, Header, Trailing>, rhs: CustomCalendarView<Day, Header, Trailing>) -> Bool {
        lhs.dateInterval == rhs.dateInterval
    }
}

// MARK: - Helpers


private extension ArraySlice {
    var array: [Element] { Array(self) }
}
