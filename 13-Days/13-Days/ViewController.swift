//
//  ViewController.swift
//  13-Days
//
//  Created by Dilda Ezgi Metincan on 30.01.2021.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    
    let animation = Animation.named("splash")
    let animationView = AnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)
        
        
        
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (timer) in
            
            self.performSegue(withIdentifier: "dashboard", sender: nil)
            
        }
        
    }


}

