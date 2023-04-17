//
//  CategoryViewController.swift
//  SMCroco
//
//  Created by Alexander Altman on 18.04.2023.
//

import UIKit

final class CategoryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        title = "Категории"
        navigationItem.backBarButtonItem?.isEnabled = true
        
    }
    
    
}
