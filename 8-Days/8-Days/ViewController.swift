//
//  ViewController.swift
//  8-Days
//
//  Created by Dilda Ezgi Metincan on 19.01.2021.
//

import UIKit
import AVFoundation
import WebKit

class ViewController: UIViewController {
    
    var soundPlayer:AVAudioPlayer!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func btnPlay(_ sender: UIButton) {
        soundPlayer.play()
    }
    
    @IBAction func btnPause(_ sender: UIButton) {
        soundPlayer.stop() //tamamen durdurmaz, kaldığı yerde durur
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //FOR LOCAL MP3
        /*
        let path = Bundle.main.path(forResource: "muzik", ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        soundPlayer = try! AVAudioPlayer(contentsOf: url)
        */
        
        //FOR WEB MP3
        DispatchQueue.main.async
        {
            let webString = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
            let webUrl = URL(string: webString)
            self.soundPlayer = try! AVAudioPlayer(data: Data(contentsOf: webUrl!))
            
        }
       
        //WEB URL TO İMAGE
        DispatchQueue.main.async
        {
            let imgStringUrl = "https://images.adsttc.com/media/images/5e1d/02c3/3312/fd58/9c00/06e9/large_jpg/NewHouse_SA_Photo_01.jpg?1578959519"
            
            let url = URL(string: imgStringUrl)
            let data = try! Data(contentsOf: url!)
            self.imageView.alpha = 0
            self.imageView.image = UIImage(data: data, scale: 0.1)
            
            UIView.animate(withDuration: 1.0)
            {
                self.imageView.alpha = 1.0
            }
        }
        
        //YOUTUBE EMBED VİDEO SHOW
        DispatchQueue.main.async
        {
            let embed = "<!doctype html> <html> <head> <meta charset='utf-8'> <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'> <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'> </head> <body> <div class='embed-responsive embed-responsive-16by9'> <iframe class='embed-responsive-item' src='https://www.youtube.com/embed/2CHXBMwxRWA?rel=0' allowfullscreen></iframe> </div> </body> </html>"
            self.webView.loadHTMLString(embed, baseURL: nil)
        }
        
       
    }

}

