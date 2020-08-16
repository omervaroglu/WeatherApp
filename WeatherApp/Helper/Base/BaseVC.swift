//
//  BaseVC.swift
//  WeatherApp
//
//  Created by Ömer Varoğlu on 16.08.2020.
//  Copyright © 2020 Omer Varoglu. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class BaseVC: UIViewController, NVActivityIndicatorViewable {
    
    var navBarTitle: String = "Şehirler"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        
        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle = .light
        } else {
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setNavBar()
    }
    
    public func setNavBar() {
        let navBar = navigationController?.navigationBar
        
        let headerLabel = UILabel()
        headerLabel.text = navBarTitle
        
        navBar?.tintColor = UIColor.gray
        navigationItem.titleView = headerLabel
    }
    
    func startShowingIndicator(message:String) {
        self.startAnimating(CGSize(width: 60, height:60), message: message, type: NVActivityIndicatorType.ballScaleMultiple)
    }
    
    func stopShowingIndicator() {
        self.stopAnimating()
    }
    
}
