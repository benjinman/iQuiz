//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/10/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {
    
    var score = 0
    var numQuestions = 0
    
    @IBOutlet weak var quizResult: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if (numQuestions == score) {
            descriptionLabel.text = "Perfect!"
        } else if(numQuestions < score * 2) {
            descriptionLabel.text = "Nice job!"
        } else {
            descriptionLabel.text = "lol."
        }
        
        quizResult.text = "You got \(score) out of \(numQuestions) correct!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
