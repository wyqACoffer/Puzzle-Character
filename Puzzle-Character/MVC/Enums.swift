//
//  Enums.swift
//  Puzzle-Character
//
//  Created by 王岩琦 on 2021/9/7.
//

import UIKit

enum ToolsColorType {
    case empty
    case copybook
    case history
    case setting
}
enum FontNameType: String {
    case ZS = "篆书"
    case LS = "隶书"
    case KS = "楷书"
    case CS = "草书"
    case XS = "行书"
}
enum FontNameNumberType: Int {
    case ZSNumber = 0
    case LSNumber
    case KSNumber
    case CSNumber
    case XSNumber
    
    init(type: FontNameType) {
        switch type {
        case .ZS:
            self = .ZSNumber
        case .LS:
            self = .LSNumber
        case .KS:
            self = .KSNumber
        case .CS:
            self = .CSNumber
        case .XS:
            self = .XSNumber
        }
    }
}

enum FontNameDetailType: String {
    case ZSDetail = "篆书详情"
    case LSDetail = "隶书详情"
    case KSDetail = "楷书详情"
    case CSDetail = "草书详情"
    case XSDetail = "行书详情"
    
    init(type: FontNameType) {
        switch type {
        case .ZS:
            self = .ZSDetail
        case .LS:
            self = .LSDetail
        case .KS:
            self = .KSDetail
        case .CS:
            self = .CSDetail
        case .XS:
            self = .XSDetail
        }
    }
}
