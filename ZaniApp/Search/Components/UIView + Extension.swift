//
//  UIView + Extension.swift
//  ZaniApp
//
//  Created by MacBook Pro on 12/04/23.
//

import UIKit

extension UIView {
    class func loadFromNib<T: UIView>() -> T? {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)?.first as? T
    }
}
