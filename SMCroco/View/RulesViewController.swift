//
//  RulesViewController.swift
//  SMCroco
//
//  Created by Edward Kheladze on 18.04.2023.
//

import UIKit

final class RulesViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {

        let scrollView = UIScrollView()
        scrollView.backgroundColor = .green
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
        
    }()
    
    private lazy var contentView: UIView = {
        
        let contentView = UIView()
        contentView.backgroundColor = .green
        contentView.frame.size = contentSize
        return contentView
        
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        return stackView
        
    }()
    
    private var contentSize: CGSize {
        CGSize(width:view.frame.width, height: view.frame.height + 300)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        
    }
}

extension  RulesViewController {
    private func setupViewsConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor)
            
        ])
        
        for view in stackView.arrangedSubviews {
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalToConstant: 300),
                view.heightAnchor.constraint(equalToConstant: 100)
            ])
            
            
        }
    }
}
