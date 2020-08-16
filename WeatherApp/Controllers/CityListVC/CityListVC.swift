//
//  CityListVC.swift
//  WeatherApp
//
//  Created by Ömer Varoğlu on 16.08.2020.
//  Copyright © 2020 Omer Varoglu. All rights reserved.
//

import Foundation
import UIKit

class CityListVC: BaseVC {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = CityListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        viewModel.initWM()
        viewModel.delegate = self
    }
    
    fileprivate func registerCell(){
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//MARK: VM Delegate
extension CityListVC: CityListVMDelegate {
    func updateList() {
        tableView.reloadData()
    }
}

//MARK: TableView Delegate & DataSource
extension CityListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cityList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
