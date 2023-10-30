//
//  ViewController.swift
//  TutoriaRepasoMVVM
//
//  Created by Pedro on 30/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    ///Load Bootcamps
    @IBAction func LoadBootCamps(_ sender: Any) {
        let vc = BootCampsTableViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

