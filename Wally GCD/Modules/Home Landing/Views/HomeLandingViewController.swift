//
//  HomeLandingViewController.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import UIKit

class HomeLandingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = HomeLandingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTableView()
        fetchData()
    }
    
    private func setupUI() {
        setnavigation(withLargeTitle: Constants.HomeLanding.Title)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: Constants.HomeLanding.WallyTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.HomeLanding.WallyTableViewCell)
        tableView.register(UINib(nibName: Constants.HomeLanding.CustomHeaderTableViewCell, bundle: nil), forHeaderFooterViewReuseIdentifier: Constants.HomeLanding.CustomHeaderTableViewCell)
    }
    
    func fetchData() {
        let queue = DispatchQueue(label: "HomeData", qos: .background, attributes: .concurrent)
        
        queue.async {
            for number in 1...10 {
                self.viewModel.hitAPIForSection(atPage: number) {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }

}


extension HomeLandingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WallyTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.HomeLanding.WallyTableViewCell, for: indexPath) as! WallyTableViewCell
        cell.configureUI(photos: viewModel.getInfo(at: indexPath.section))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    }

    
    //MARK: - Section Task
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionCount
    }
            
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell: CustomHeaderTableViewCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.HomeLanding.CustomHeaderTableViewCell) as! CustomHeaderTableViewCell
        cell.configureUI(title: "Section : \(section + 1)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
}

extension HomeLandingViewController: NavigationBarProtocol { }
