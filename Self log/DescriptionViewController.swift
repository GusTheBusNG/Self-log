//
//  DescriptionViewController.swift
//  Self log
//
//  Created by Nicholas Gustafson on 8/23/18.
//  Copyright © 2018 Nicholas Gustafson. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back() {
        dismiss(animated: true, completion: nil)
    }
}
