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
    var mainTextColor: UIColor
    var descriptionTextColor: UIColor
    var detailsTextColor: UIColor
    var copyrightTextColor: UIColor
    var placeholderTextColor: UIColor
    var primaryColor: UIColor
    var primaryLightColor: UIColor
    var primaryLighterColor: UIColor
    var buttonTextColor: UIColor
    var borderColor: UIColor
    var completeProgressColor: UIColor
    var pinkAccentColor: UIColor
    var successMain: Color
    var successLighter: Color
    var errorMain: Color
    var errorLighter: Color
    /// icons
    var timeImage: String
    var filterButtonImage: String
    var authorIcon: String
    var durationOnIcon: String
    var durationOffIcon: String
    var beginCourseButtonIcon: String
    var videoIcon: String
    var documentIcon: String
    var quizIcon: String
    var courseDetailBackground: String
    var onBoardingButtonIcon: String
    var bookLogo: String
    var notificationIcon: String
    var email: String
    var password: String
    var user: String
    var checkboxFull: String
    var checkboxEmpty: String
    var eyeCrossed: String
    var completeCourseIcon: String
    var placeholder: String
    var cross: String
    var asteriks: String
    var asteriksCircle: String
    var questionMark: String
    var quizHeader: String
    var notificationBell: String
    var quizPopup: String
    var quizPopupImage: String
}

var viewAssets = ViewAssets(
    titleFont: "Rubik-Medium",
    descriptionFont: "Rubik-Regular",
    mainTextColor: #colorLiteral(red: 0.2746263146, green: 0.2814281881, blue: 0.4365238845, alpha: 1),
    descriptionTextColor: #colorLiteral(red: 0.6078431373, green: 0.6196078431, blue: 0.662745098, alpha: 1),
    detailsTextColor: #colorLiteral(red: 0.3725490196, green: 0.3960784314, blue: 0.4588235294, alpha: 1),
    copyrightTextColor: #colorLiteral(red: 0.7294117647, green: 0.7450980392, blue: 0.7725490196, alpha: 1),
    placeholderTextColor: #colorLiteral(red: 0.4901960784, green: 0.5098039216, blue: 0.5607843137, alpha: 1),
    primaryColor: #colorLiteral(red: 0.3803921569, green: 0.2745098039, blue: 0.7764705882, alpha: 1),
    primaryLightColor: #colorLiteral(red: 0.5058823529, green: 0.4196078431, blue: 0.8196078431, alpha: 1),
    primaryLighterColor: #colorLiteral(red: 0.8745098039, green: 0.8549019608, blue: 0.9568627451, alpha: 1),
    buttonTextColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
    borderColor: #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9529411765, alpha: 1),
    completeProgressColor: #colorLiteral(red: 0.1254901961, green: 0.7490196078, blue: 0.3333333333, alpha: 1),
    pinkAccentColor: #colorLiteral(red: 0.8784313725, green: 0.4470588235, blue: 0.6431372549, alpha: 1),
    successMain: Color(#colorLiteral(red: 0.09219645709, green: 0.7787792087, blue: 0.4071886837, alpha: 1)),
    successLighter: Color(#colorLiteral(red: 0.8235294118, green: 0.9490196078, blue: 0.8666666667, alpha: 1)),
    errorMain: Color(#colorLiteral(red: 0.8392156863, green: 0.2509803922, blue: 0.2705882353, alpha: 1)),
    errorLighter: Color(#colorLiteral(red: 0.968627451, green: 0.8509803922, blue: 0.8549019608, alpha: 1)),
    timeImage: "timer",
    filterButtonImage: "filter",
    authorIcon: "author",
    durationOnIcon: "timer",
    durationOffIcon: "time-past",
    beginCourseButtonIcon: "Polygon",
    videoIcon: "film",
    documentIcon: "document",
    quizIcon: "resources",
    courseDetailBackground: "courseBackground",
    onBoardingButtonIcon: "arrow-right",
    bookLogo: "bookLogo",
    notificationIcon: "bell",
    email: "envelope",
    password: "lock",
    user: "user",
    checkboxFull: "checkbox-full",
    checkboxEmpty: "checkbox-empty",
    eyeCrossed: "eye-crossed",
    completeCourseIcon: "Trophy",
    placeholder: "placeholder",
    cross: "cross",
    asteriks: "asteriks",
    asteriksCircle: "asteriks-circle",
    questionMark: "questionMark",
    quizHeader: "quizHeader",
    notificationBell: "notification-bell",
    quizPopup: "quizPopup",
    quizPopupImage: "quizPopupImage"
)
