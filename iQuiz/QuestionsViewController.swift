//
//  QuestionsViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/9/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    var questions = [String]()
    var answers = [Int]()
    var answerChoices = [[String]]()
    var count = 0 // keep track of which question the user is on
    var score = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    @IBOutlet weak var thirdChoice: UIButton!
    @IBOutlet weak var fourthChoice: UIButton!
    @IBOutlet weak var submitButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionLabel.text = questions[count]
        
        firstChoice.setTitle(answerChoices[count][0], for: .normal)
        secondChoice.setTitle(answerChoices[count][1], for: .normal)
        thirdChoice.setTitle(answerChoices[count][2], for: .normal)
        fourthChoice.setTitle(answerChoices[count][3], for: .normal)
        submitButton.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference to the second view controller
        if (segue.identifier != "returnHome") {
            let answerScene = segue.destination as! AnswerViewController
            
            // let quiz = sender as! QuizTableViewCell
            
            // set a variable in the second view controller with the String to pass
            answerScene.count = self.count
            
            var selected = 3
            
            if (firstChoice.isSelected) {
                selected = 0
            } else if (secondChoice.isSelected) {
                selected = 1
            } else if (thirdChoice.isSelected) {
                selected = 2
            }
            
            answerScene.count = self.count
            answerScene.choice = selected
            answerScene.questions = self.questions
            answerScene.answers = self.answers
            answerScene.choices = self.answerChoices
            answerScene.score = self.score
        }
    }
    
    @IBAction func selectFirstButton(_ sender: AnyObject) {
        selectButton(firstChoice)
    }
    
    @IBAction func selectSecondButton(_ sender: AnyObject) {
        selectButton(secondChoice)
    }
    
    @IBAction func selectThirdButton(_ sender: AnyObject) {
        selectButton(thirdChoice)
    }
    
    @IBAction func selectFourthButton(_ sender: AnyObject) {
        selectButton(fourthChoice)
    }
    
    func selectButton(_ button: UIButton) {
        unselectAll()
        button.isSelected = true
        submitButton.isHidden = false
    }

    func unselectAll() {
        firstChoice.isSelected = false
        secondChoice.isSelected = false
        thirdChoice.isSelected = false
        fourthChoice.isSelected = false
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
