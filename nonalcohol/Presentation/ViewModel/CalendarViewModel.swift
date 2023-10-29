//
//  CalendarViewModel.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/24.
//

import Foundation
import Combine

public protocol CalendarViewModelInput {
    func executeFetch()
//    func getAlcoholData()
    func setCalendarDate(isPrev: Bool)
}

public protocol CalendarViewModelOutput {
    var currentYear: Int { get }
    var currentMonth: Int { get }
    var monthInterval: DateInterval? { get }
//    var alcoholList: [AlcoholEntity] { get }
}

public final class CalendarViewModel: ObservableObject, CalendarViewModelOutput {
    
    private var alcoholUseCase: AlcoholUseCase
    private var bag = Set<AnyCancellable>()
    
    public init(alcoholUseCase: AlcoholUseCase) {
        self.alcoholUseCase = alcoholUseCase
    }
    
    @Published public var currentYear: Int = TimeUtil().getThisYear()
    @Published public var currentMonth: Int = TimeUtil().getThisMonth()
    @Published public var monthInterval: DateInterval?
    
//    public var alcoholList: [AlcoholEntity] = []
}

extension CalendarViewModel: CalendarViewModelInput {
    
    /// ViewDidLoad
    public func executeFetch() {
        monthInterval = TimeUtil().getCalendarDate(year: currentYear, month: currentMonth)
    }
    
//    /// 전체 음주 데이터 불러오기
//    public func getAlcoholData() {
//        alcoholUseCase.getAlcoholData()
//            .assign(to: \.alcoholList, on: self)
//            .store(in: &bag)
//    }
    
    /// 달력 월 이동
    public func setCalendarDate(isPrev: Bool) {
        var year = currentYear
        var month = currentMonth
        
        if isPrev {
            if currentMonth == 1 {
                month = 12
                year -= 1
            } else {
                month -= 1
            }
        } else {
            if currentMonth == 12 {
                month = 1
                year += 1
            } else {
                month += 1
            }
        }
       
        currentYear = year
        currentMonth = month
        
        // Calendar Reload
        executeFetch()
    }
}
