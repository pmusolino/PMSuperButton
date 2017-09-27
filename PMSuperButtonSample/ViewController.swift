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
    @IBOutlet weak var thirdButton: PMSuperButton!
    @IBOutlet weak var fourthButton: PMSuperButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        firstButton.touchUpInside {
            print("Hello World")
        }
        
        secondButton.touchUpInside {
        }
        
        var isLoading = false
        thirdButton.touchUpInside {
            isLoading = !isLoading
            isLoading == true ? self.thirdButton.showLoader() : self.thirdButton.hideLoader()
        }
        
        var isCircleLoaderActive = false
        fourthButton.touchUpInside {
            isCircleLoaderActive = !isCircleLoaderActive
            isCircleLoaderActive == true ? self.fourthButton.showCircleLoader() : self.fourthButton.hideCircleLoader()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

