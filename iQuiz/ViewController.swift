//
//  ViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/2/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func presentAlert(_ sender: AnyObject) {
        let alert = UIAlertController.init(title: "Settings go here", message: "", preferredStyle: .alert)
        let alertOKAction=UIAlertAction(title:"OK", style: .default, handler: nil)
        alert.addAction(alertOKAction)
        self.present(alert, animated: false, completion: nil)
    }
}

