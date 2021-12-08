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
let gFontPickerNames = [
    "楷书 颜真卿 勤礼碑 多宝塔碑", "楷书 赵孟頫", "楷书 褚遂良 雁塔圣教序", "楷书 虞世南", "楷书 欧阳询 九成宫醴泉铭", "楷书 柳公权 玄秘塔碑",
    "草书 黄庭坚", "草书 孙过庭 书谱", "草书 苏轼", "草书 米芾", "草书 蔡襄",
    "行书 陆柬之", "行书 王羲之 兰亭序", "行书 苏轼 黄州寒食帖", "行书 赵孟頫 洛神赋", "行书 米芾 蜀素帖",
    "篆书 邓石如", "篆书 李斯 峄山刻石",
    "隶书 礼器碑", "隶书 乙瑛碑", "隶书 张迁碑"
]
let gPaperPickerNames = ["生宣", "熟宣"]
let gShapePickerNames = [
    "扇面", "屏条", "扇面 团扇", "手卷", "斗方", "条幅", "册页 手札", "横披", "对联"
]
