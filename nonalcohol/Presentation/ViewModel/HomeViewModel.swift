//
//  HomeViewModel.swift
//  nonalcohol
//
//  Created by najin shin on 2023/10/11.
//

import Foundation
import Combine

public protocol HomeViewModelInput {
    func executeFetch()
    func setResolution(resolution: String)
    func setTodayAlcoholState(state: NonalcoholSuccessState)
}

public protocol HomeViewModelOutput {
    var user: UserEntity { get }
    var todayAlcoholState: NonalcoholSuccessState { get }
    var dday: String { get }
}

public final class HomeViewModel: ObservableObject, HomeViewModelOutput {

    private var userUseCase: UserUseCase
    private var alcoholUseCase: AlcoholUseCase
    private var bag = Set<AnyCancellable>()
    
    public init(userUseCase: UserUseCase, alcoholUseCase: AlcoholUseCase) {
        self.userUseCase = userUseCase
        self.alcoholUseCase = alcoholUseCase
    }
    
    @Published public var user: UserEntity = UserEntity()
    @Published public var todayAlcoholState: NonalcoholSuccessState = .none
    @Published public var dday = "0"
    
    public var todayAlcohol: AlcoholEntity?
    
}

// MARK: - INPUT

extension HomeViewModel: HomeViewModelInput {
    
    // MARK: executeFetch
    
    public func executeFetch() {
        getUserInfo()
        getTodayAlcoholState()
        getAlocoholDday()
    }
    
    // MARK: get
    
    ///유저 정보 가져오기 (닉네임, 금주다짐)
    public func getUserInfo() {
        userUseCase.fetchUserInfo()
            .assign(to: \.user, on: self)
            .store(in: &bag)
    }
    
    ///오늘 금주 성공여부 가져오기 (없음/성공/실패)
    public func getTodayAlcoholState() {
        alcoholUseCase.getAlcohol(date: TimeUtil().dateToString(Date()))
            .assign(to: \.todayAlcohol, on: self)
            .store(in: &bag)
        
        if let alcohol = todayAlcohol {
            todayAlcoholState = alcohol.state ? .success : .fail
        } else {
            todayAlcoholState = .none
        }
    }
    
    ///오늘까지 금주 며칠째인지 가져오기
    public func getAlocoholDday(){
        alcoholUseCase.getLastAlcoholDate()
            .map { day in
                if let day = day {
                    return "금주 \(TimeUtil().daysBetweenDates(startDate: TimeUtil().dateInterval(day), endDate: Date()) + 1)일차"
                } else {
                    return "금주 기록을 해주세요"
                }
            }
            .assign(to: \.dday, on: self)
            .store(in: &bag)
    }
    
    // MARK: set
    
    /// 금주다짐 저장하기
    public func setResolution(resolution: String) {
        userUseCase.saveUserResolution(resolution: resolution)
    }
    
    /// 오늘 음주 상태 저장하기
    public func setTodayAlcoholState(state: NonalcoholSuccessState) {
        if state == .success {
            // 성공 버튼 눌렀을 때
            if todayAlcoholState == .success {
                // 1. 이미 성공이 눌러져있으면 -> 해당 Alcohol 삭제
                if let id = todayAlcohol?.id {
                    alcoholUseCase.deleteAlcohol(id: id)
                }
            } else if todayAlcoholState == .fail {
                // 2. 이미 실패가 눌러져있으면 -> 해당 Alcohol의 State를 success으로 변경
                if let id = todayAlcohol?.id {
                    alcoholUseCase.updateAlcoholState(id: id, state: true)
                }
            } else {
                // 3. 아무것도 눌러져있지 않으면 -> 오늘자 Alcohol 새로 생성
                alcoholUseCase.insertAlcohol(alcohol: AlcoholEntity(id: UUID().uuidString, date: TimeUtil().dateToString(Date()), state: true))
            }
        } else if state == .fail {
            // 실패 버튼 눌렀을 때
            if todayAlcoholState == .fail {
                // 1. 이미 실패가 눌러져있으면 -> 해당 Alcohol 삭제
                if let id = todayAlcohol?.id {
                    alcoholUseCase.deleteAlcohol(id: id)
                }
            } else if todayAlcoholState == .success {
                // 2. 이미 성공이 눌러져있으면 -> 해당 Alcohol의 State를 fail으로 변경
                if let id = todayAlcohol?.id {
                    alcoholUseCase.updateAlcoholState(id: id, state: false)
                }
            } else {
                // 3. 아무것도 눌러져있지 않으면 -> 오늘자 Alcohol 새로 생성
                alcoholUseCase.insertAlcohol(alcohol: AlcoholEntity(id: UUID().uuidString, date: TimeUtil().dateToString(Date()), state: false))
            }
        }
        
        executeFetch()
    }
}
