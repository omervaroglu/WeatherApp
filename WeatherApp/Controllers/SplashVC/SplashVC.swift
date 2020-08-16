//
//  SplashVC.swift
//  WeatherApp
//
//  Created by Ömer Varoğlu on 16.08.2020.
//  Copyright © 2020 Omer Varoglu. All rights reserved.
//

import Foundation
import UIKit

class SplashVC: BaseVC {
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startVC()
    }
    
    func startVC() {
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            guard let strongSelf = self else { return }
            let startVC = CityListVC(nibName: "CityListVC", bundle: nil)
            let navVC = UINavigationController(rootViewController: startVC)
            strongSelf.window = UIWindow(frame: UIScreen.main.bounds)
            strongSelf.window?.rootViewController = navVC
            strongSelf.window?.makeKeyAndVisible()
        }
    }
}
