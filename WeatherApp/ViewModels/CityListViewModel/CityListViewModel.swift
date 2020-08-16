//
//  CityListViewModel.swift
//  WeatherApp
//
//  Created by Ömer Varoğlu on 16.08.2020.
//  Copyright © 2020 Omer Varoglu. All rights reserved.
//

import Foundation
import UIKit

protocol CityListVMDelegate: class {
    func updateList()
}

class CityListViewModel {
    
    weak var delegate: CityListVMDelegate?
    var cityList : Cities?
    
    func initWM() {
        getCity()
    }
    
    public func getCity() {
        setLoading(true)
        Network.shared.getCity { (success, response) in
            self.setLoading(false)
            if success {
                self.cityList = response
                self.delegate?.updateList()
                print("✅✅✅ Success getCity method!!! ✅✅✅")
            } else {
                print("❌❌❌ Failure getCity method!!! ❌❌❌")
            }
        }
    }
    
    func setLoading (_  isLoading : Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
    }
}
