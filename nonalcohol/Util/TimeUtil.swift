//
//  TimeUtil.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/27.
//

import Foundation

class TimeUtil {
    
    /// Date를 DB 형식의 DateString으로 변환
    func dateToString(_ date: Date) -> String {
        let date:Date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    /// DateString 형식의 날짜를 Date 형식으로 변환
    func dateInterval(_ date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: date) ?? Date()
    }
    
    /// 날짜 사이의 일수 변환
    func daysBetweenDates(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let startOfStartDate = calendar.startOfDay(for: startDate)
        let startOfEndDate = calendar.startOfDay(for: endDate)
        
        let components = calendar.dateComponents([.day], from: startOfStartDate, to: startOfEndDate)
        return components.day ?? 0
    }
    
    /// 연도, 월 로 달력 시작과 끝 일자 게산
    func getCalendarDate(year: Int, month: Int) -> DateInterval {
        let lastDate = getMonthLastDate(year: year, month: month, date: 1)
        let startDate = getDate(year: year, month: month, date: 1)
        let endDate = getDate(year: year, month: month, date: lastDate)
        
        return DateInterval(start: startDate, end: endDate)
    }
    
    /// 이번달 마지막날 계산
    func getMonthLastDate(year: Int, month: Int, date: Int = 1) -> Int {
        let date = getDate(year: year, month: month, date: date)
        let calendar = Calendar.current
        
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: calendar.startOfDay(for: date)))!
        let endOfMonth = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonth)!
        
        return Calendar.current.component(.day, from: endOfMonth)
    }
    
    /// 연도, 월, 일 로 Date 값 산출
    func getDate(year: Int, month: Int, date: Int) -> Date {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-M-d"
        return dateformatter.date(from: "\(year)-\(month)-\(date)")!
    }
    
    /// 이번연도 계산
    func getThisYear() -> Int {
        let today = Date()
        return Calendar.current.component(.year, from: today)
    }
    
    /// 이번달 계산
    func getThisMonth() -> Int {
        let today = Date()
        return Calendar.current.component(.month, from: today)
    }
}
