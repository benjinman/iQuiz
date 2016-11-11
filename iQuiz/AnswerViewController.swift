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
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var correctAnswer: UILabel!
    @IBOutlet weak var userAnswer: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionLabel.text = questions[count]
        correctAnswer.text = choices[answer - 1]
        userAnswer.text = choices[choice]
        
        if (choice == answer - 1) {
            userAnswer.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else {
            userAnswer.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (count <= questions.count - 1) {
            
        }
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
