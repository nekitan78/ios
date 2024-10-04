//
//  ViewController.swift
//  Dice
//
//  Created by Student on 04.10.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var rightDice: UIImageView!
    @IBOutlet weak var leftDice: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var imagesDice:[UIImage] = [#imageLiteral(resourceName: "images"),#imageLiteral(resourceName: "images-2"),#imageLiteral(resourceName: "dice3"),#imageLiteral(resourceName: "4dice"),#imageLiteral(resourceName: "images 1"),#imageLiteral(resourceName: "images-2 1")]
    
                           
                           
                           
                           
                           
                           
            
        
    
    @IBAction func actionBut(_ sender: Any) {
        let leftInt = Int.random(in: 0...5)
        let rightInt = Int.random(in: 0...5)
        leftDice.image = imagesDice[leftInt]
        rightDice.image = imagesDice[rightInt]
    }
    

}

