//
//  ViewAssetsModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 20.06.2022.
//

import UIKit

public protocol CourseAssets {
    var titleFont: String {get}
    var descriptionFont: String {get}
    var primaryTextColor: UIColor {get}
    var secondaryTextColor: UIColor {get}
    var primaryColor: UIColor {get}
    var secondaryColor: UIColor {get}
    var accentColor: UIColor {get}
    var successPrimaryColor: UIColor {get}
    var successSecondaryColor: UIColor {get}
    var errorPrimaryColor: UIColor {get}
    var errorSecondaryColor: UIColor {get}
    var buttonTextColor: UIColor {get}
    var borderColor: UIColor {get}
}
