//
//  ViewController.swift
//  TaskOne
//
//  Created by Руслан Шигапов on 01.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var squareView: UIView!
    
    private let shadowView = ShadowView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        squareView.addSubview(shadowView)
        
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        
        shadowView.leadingAnchor.constraint(equalTo: squareView.leadingAnchor).isActive = true
        shadowView.trailingAnchor.constraint(equalTo: squareView.trailingAnchor).isActive = true
        shadowView.topAnchor.constraint(equalTo: squareView.topAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: squareView.bottomAnchor).isActive = true
    }
}
