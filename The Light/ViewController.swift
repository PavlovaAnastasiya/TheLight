//
//  ViewController.swift
//  The Light
//
//  Created by Pavlova on 10.01.2021.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    var isLightOn: Bool = true
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        isLightOn = !isLightOn
        
        updateView()
        
    }
    
    
    
    func updateView() {
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        
        if let dev = device, dev.hasTorch {
            view.backgroundColor = .black
            do {
                try dev.lockForConfiguration()
                dev.torchMode = isLightOn ? .on : .off
                dev.unlockForConfiguration()
            } catch {
                print (error)
            }
        } else {
            view.backgroundColor = isLightOn ? .white : .black
        }
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
}
