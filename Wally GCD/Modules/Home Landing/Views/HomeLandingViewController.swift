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
        setnavigation(withLargeTitle: "Movie Masala")
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "MoviesTableViewCell")
        tableView.register(UINib(nibName: "CustomHeaderTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "CustomHeaderTableViewCell")
    }
}


extension HomeLandingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MoviesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath) as! MoviesTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
            
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell: CustomHeaderTableViewCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderTableViewCell") as! CustomHeaderTableViewCell
        cell.configureUI(title: "Section : \(section)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}

extension HomeLandingViewController: NavigationBarProtocol { }
