//
//  ViewController.swift
//  MVVM_RxSwiift
//
//  Created by Alan Silva on 03/11/20.
//

import UIKit

class ViewController: UIViewController {

    static func instantiate() -> UIViewController {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        
        return viewController
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //view.backgroundColor = .red
        
    }


}

