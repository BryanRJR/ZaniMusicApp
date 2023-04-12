//
//  UIViewController.swift
//  ZaniApp
//
//  Created by MacBook Pro on 12/04/23.
//
import UIKit

extension UIViewController {
    class func loadFromStoryboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("No initial view controller in\(name).storyboard")
        }
    }
}
