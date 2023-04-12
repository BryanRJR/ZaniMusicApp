//
//  ViewController.swift
//  ZaniApp
//
//  Created by MacBook Pro on 28/03/23.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {


  override func viewDidLoad() {
    super.viewDidLoad()

    delegate = self

    tabBar.backgroundImage = UIImage()

    viewControllers?.forEach({ viewController in
      viewController.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: 54, right: 0)
    })

  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    tabBar.unselectedItemTintColor = UIColor(rgb: 0x482a54)
  }


}
