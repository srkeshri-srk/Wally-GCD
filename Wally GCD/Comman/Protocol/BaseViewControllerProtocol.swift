//
//  BaseViewControllerProtocol.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import UIKit


protocol NavigationBarProtocol where Self: UIViewController {
    func setnavigation(title: String)
    func setnavigation(withLargeTitle title: String)
}

extension NavigationBarProtocol {
    func setnavigation(title: String) {
        self.navigationItem.title = title
    }
    
    func setnavigation(withLargeTitle title: String) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setnavigation(title: title)
    }
}
