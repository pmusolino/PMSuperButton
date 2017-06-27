//
//  ViewController.swift
//  PMSuperButtonSample
//
//  Created by Paolo Musolino on 14/06/17.
//  Copyright © 2017 PMSuperButton. All rights reserved.
//

import UIKit
import PMSuperButton

class ViewController: UIViewController {

    @IBOutlet weak var firstButton: PMSuperButton!
    @IBOutlet weak var secondButton: PMSuperButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstButton.touchUpInside {
            self.firstButton.showLoader()
            print("Hello World")
        }
        
        secondButton.touchUpInside {
            self.firstButton.hideLoader()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

