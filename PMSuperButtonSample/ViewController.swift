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
        
        let thirdButton = PMSuperButton(frame: CGRect(x: 100, y: 400, width: 120, height: 30))
        thirdButton.setTitle("Try this feature", for: .normal)
        thirdButton.touchUpInside { 
            thirdButton.showLoader()
        }
        view.addSubview(thirdButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

