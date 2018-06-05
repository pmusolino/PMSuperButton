//
//  ViewController.swift
//  PMSuperButtonSample
//
//  Created by Paolo Musolino on 14/06/17.
//  Copyright © 2018 PMSuperButton. All rights reserved.
//

import UIKit
import PMSuperButton

class ViewController: UIViewController {

    @IBOutlet weak var firstButton: PMSuperButton!
    @IBOutlet weak var secondButton: PMSuperButton!
    @IBOutlet weak var thirdButton: PMSuperButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        firstButton.touchUpInside {
            print("Hello World")
        }
        
        secondButton.touchUpInside {
        }
        
        thirdButton.touchUpInside { [weak self] in
            self?.thirdButton.isLoading == false ? self?.thirdButton.showLoader() : self?.thirdButton.hideLoader()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

