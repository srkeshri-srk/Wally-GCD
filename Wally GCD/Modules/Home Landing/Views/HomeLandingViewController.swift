//
//  HomeLandingViewController.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import UIKit

class HomeLandingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTableView()
    }
    
}

private extension HomeLandingViewController {
    func setupUI() {
        setnavigation(withLargeTitle: Constants.HomeLanding.Title)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.HomeLanding.WallyTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.HomeLanding.WallyTableViewCell)
        tableView.register(UINib(nibName: Constants.HomeLanding.CustomHeaderTableViewCell, bundle: nil), forHeaderFooterViewReuseIdentifier: Constants.HomeLanding.CustomHeaderTableViewCell)
    }
}


extension HomeLandingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WallyTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.HomeLanding.WallyTableViewCell, for: indexPath) as! WallyTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
            
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell: CustomHeaderTableViewCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.HomeLanding.CustomHeaderTableViewCell) as! CustomHeaderTableViewCell
        cell.configureUI(title: "Section : \(section)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}

extension HomeLandingViewController: NavigationBarProtocol { }
