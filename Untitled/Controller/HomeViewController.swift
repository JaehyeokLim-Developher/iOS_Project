//
//  MainViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

class homeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLayout()
        setSameBackgroundColor()
        
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.black
    }
}
