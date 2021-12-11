//
//  GlobalProperties.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/9/24.
//

import UIKit

typealias Block = () -> ()

let gColorForBackgroundView = UIColor.init(red: 0.9, green: 0.88, blue: 0.84, alpha: 1)
let gColorNotSelected = UIColor(red: 102 / 255, green: 34 / 255, blue: 29 / 255, alpha: 1)
let gColorSelected = UIColor(red: 186 / 255, green: 97 / 255, blue: 93 / 255, alpha: 1)
let gFontNames: [FontNameType] = [.ZS, .LS, .KS, .CS, .XS]
let gFontNameDetails: [FontNameDetailType] = [.ZSDetail, .LSDetail, .KSDetail, .CSDetail, .XSDetail]
let gPlaceholderText = "点击这里输入您想要生成的文本"
let gFontPickerNames = ["楷书", "草书", "行书", "篆书", "隶书"]
let gPickerNames = [["颜真卿", "赵孟頫", "诸遂良", "虞世南", "欧阳询", "柳公权"],
                    ["黄庭坚", "孙过庭", "苏轼", "米芾", "蔡襄",],
                    ["米芾", "赵孟頫", "苏轼", "王羲之", "陆柬之",],
                    ["李斯", "邓石如",],
                    ["张迁碑", "乙瑛碑", "礼器碑",]]

let gPaperPickerNames = ["生宣", "熟宣"]
let gShapePickerNames = ["扇面 折扇", "屏条", "扇面 团扇", "手卷", "斗方", "条幅", "册页 手札", "横披", "对联"]
