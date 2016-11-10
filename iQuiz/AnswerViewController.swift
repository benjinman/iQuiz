//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/9/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    var questions = [String]()
    var answer = 0
    var choices = [String]()
    var count = 0
    var choice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    @IBAction func showNextScene(_ sender: AnyObject) {
        // if count is <= to the size of the questions array - 1 present the next question scene
        // otherwise present the finished scene
//        if (count <= questions.count - 1) {
//            self.performSegue(withIdentifier: "questionScene", sender: self)
//        } else {
//            self.present(FinishedViewController(), animated: true, completion: nil)
//        }
    }
    
    // function to send data back: count, number correct

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
