//
//  UIView+Extension.swift
//  NewsFeed
//
//  Created by Tanuj on 18/02/21.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable public var borderColor: UIColor? {
        get { return layer.borderColor.map(UIColor.init) }
        set { layer.borderColor = newValue?.cgColor }
    }
    @IBInspectable public var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }

    @IBInspectable public var cornerRadiusD: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
}
