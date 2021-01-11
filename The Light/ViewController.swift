//
//  ViewController.swift
//  The Light
//
//  Created by Pavlova on 10.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var isLightOn: Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        }

    fileprivate func updateUI() {
        view.backgroundColor = isLightOn ? .white : .black
    }
    
    @IBAction func buttonPressed() {
        isLightOn.toggle()
        updateUI()
    }
    
}

