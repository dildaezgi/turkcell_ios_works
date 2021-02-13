//
//  ViewController.swift
//  Shoppy
//
//  Created by Dilda Ezgi Metincan on 31.01.2021.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    let animation = Animation.named("splashh")
    let animationView = AnimationView()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        animationView.frame = CGRect(x: 32, y: 291, width: 350 , height: 350)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        
        Timer.scheduledTimer(withTimeInterval: 4.0, repeats: false) { (timer) in
            self.performSegue(withIdentifier: "dashboard", sender: nil)
    }


}

}
