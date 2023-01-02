//
//  ScrollViewProportion.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/22/22.
//

import Foundation
import SwiftUI

struct ScrollProportion: PreferenceKey {
    static let defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
