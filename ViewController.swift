//
//  ViewController.swift
//  Nikitoooooos
//
//  Created by BMK on 23.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    
    var numCol: [String] = ["0","1", "2", "3", "4", "5", "6"]
    
    
    @IBAction func butClick(_ sender: UIButton) {
        let url = Bundle.main.url(forResource: numCol[sender.tag], withExtension: "wav")!
        player = try! AVAudioPlayer(contentsOf: url)
        player.play()
    }
    
    
    
    
    

}

