//
//  ViewAssetsModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 20.06.2022.
//

import Foundation
import SwiftUI


struct ViewAssets {
    var titleFont: String
    var descriptionFont: String
    var primaryTextColor: UIColor
    var secondaryTextColor: UIColor
    var tertiaryTextColor: UIColor
    var primaryColor: UIColor
    var secondaryColor: UIColor
    var accentColor: UIColor
    var successPrimaryColor: UIColor
    var successSecondaryColor: UIColor
    var errorPrimaryColor: UIColor
    var errorSecondaryColor: UIColor
    var buttonTextColor: UIColor
    var borderColor: UIColor
}

var viewAssets = ViewAssets(
    titleFont: "Rubik-Medium",
    descriptionFont: "Rubik-Regular",
    primaryTextColor: .label,
    secondaryTextColor: .secondaryLabel,
    tertiaryTextColor: .tertiaryLabel,
    primaryColor: .systemBlue,
    secondaryColor: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),
    accentColor: #colorLiteral(red: 0.8784313725, green: 0.4470588235, blue: 0.6431372549, alpha: 1),
    successPrimaryColor: #colorLiteral(red: 0.09219645709, green: 0.7787792087, blue: 0.4071886837, alpha: 1),
    successSecondaryColor: #colorLiteral(red: 0.8235294118, green: 0.9490196078, blue: 0.8666666667, alpha: 1),
    errorPrimaryColor: #colorLiteral(red: 0.8392156863, green: 0.2509803922, blue: 0.2705882353, alpha: 1),
    errorSecondaryColor: #colorLiteral(red: 0.968627451, green: 0.8509803922, blue: 0.8549019608, alpha: 1),
    buttonTextColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
    borderColor: #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9529411765, alpha: 1)
)
