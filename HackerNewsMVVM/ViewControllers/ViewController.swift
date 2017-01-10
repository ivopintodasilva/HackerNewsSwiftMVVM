//
//  ViewController.swift
//  HackerNewsMVVM
//
//  Created by Ivo Silva on 10/01/2017.
//  Copyright © 2017 Ivo Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let viewModel: InitialViewModel
    
    required init?(coder aDecoder: NSCoder) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.viewModel = appDelegate.initialViewModel
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

