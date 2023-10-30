//
//  SettingModel.swift
//  nonalcohol
//
//  Created by najin on 2023/10/29.
//

import Foundation

enum SettingTitleType: CaseIterable {
    case user
    case terms
    case application
    case producer
    
    var text: String {
        switch self {
            case .user: return "회원 설정"
            case .terms: return "고객 약관"
            case .application: return "어플리케이션 정보"
            case .producer: return "제작자 정보"
        }
    }
    
    var list: [SettingType] {
        switch self {
            case .user:
                return [SettingType.allowPush]
            case .terms:
                return [SettingType.customerCenter,
                        SettingType.userTerms]
            case .application:
                return [SettingType.version,
                        SettingType.update,
                        SettingType.review,
                        SettingType.share,
                        SettingType.dataBackup]
            case .producer:
                return [SettingType.developer,
                        SettingType.designer,
                        SettingType.pm]
        }
    }
}

enum SettingType: CaseIterable {
    case allowPush
    case customerCenter
    case userTerms
    case version
    case update
    case review
    case share
    case dataBackup
    case developer
    case designer
    case pm
    
    var text: String {
        switch self {
        case .allowPush:
            return "PUSH 알림"
        case .customerCenter:
            return "고객센터"
        case .userTerms:
            return "이용약관"
        case .version:
            return "버전정보"
        case .update:
            return "어플리케이션 업데이트"
        case .review:
            return "리뷰 등록하기"
        case .share:
            return "공유하기"
        case .dataBackup:
            return "데이터 백업 불러오기"
        case .developer:
            return "제작자 정보"
        case .designer:
            return "디자이너 정보"
        case .pm:
            return "기획자 정보"
        }
    }
    
    var itemType: SettingItemType {
        switch self {
            case .allowPush:
                return .toggle
            case .version:
                return .text
            default:
                return .button
        }
    }
}

enum SettingItemType {
    case button
    case toggle
    case text
}
