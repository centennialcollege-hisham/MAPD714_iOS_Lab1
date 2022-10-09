//
//  YellowViewController.swift
//  switchview
//
//  Created by Hisham Sanimeh on 09/10/2022.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Yellow View Button Pressed",
                                      message: "You pressed the button on the yellow view",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes, I did", style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
}
