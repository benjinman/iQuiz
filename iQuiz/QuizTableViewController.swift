//
//  QuizTableViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/3/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class QuizTableViewController: UITableViewController {
    
    var dataURL = "http://tednewardsandbox.site44.com/questions.json"
    
    struct quizKeys {
        static let quizTitles = "titles"
        static let quizDescriptions = "descriptions"
        static let questions = "questions"
        static let quizAnswers = "answerIndex"
        static let possibleAnswers = "answers"
    }
    
    var quizTitles = [String]()
    var quizDescriptions = [String]()
    var questions = [String:[String]]()
    var quizAnswers = [String:[String]]()
    var possibleAnswers = [String:[[String]]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 80
        
        self.tableView.tableFooterView = UIView()
        
//        let appDomain = Bundle.main.bundleIdentifier!
//        
//        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        
        // attempt at storing data
        if (requestData()) {
            let saved = UserDefaults.standard
            
            quizTitles = saved.array(forKey: quizKeys.quizTitles) as! [String]
            quizDescriptions = saved.array(forKey: quizKeys.quizDescriptions) as! [String]
            questions = saved.dictionary(forKey: quizKeys.questions) as! [String : [String]]
            quizAnswers = saved.dictionary(forKey: quizKeys.quizAnswers) as! [String : [String]]
            possibleAnswers = saved.dictionary(forKey: quizKeys.possibleAnswers) as! [String : [[String]]]
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference to the second view controller
        let questionScene = segue.destination as! QuestionsViewController
        
        let quiz = sender as! QuizTableViewCell
        
        // set a variable in the second view controller with the String to pass
        questionScene.questions = self.questions[quiz.quizTitle.text!]!
        questionScene.answers = self.quizAnswers[quiz.quizTitle.text!]!
        questionScene.answerChoices = self.possibleAnswers[quiz.quizTitle.text!]!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3//quizTitles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quizCell", for: indexPath) as! QuizTableViewCell

        // Configure the cell...
        cell.quizTitle.text = self.quizTitles[indexPath.row]
        cell.quizDescription.text = self.quizDescriptions[indexPath.row]
        
        return cell
    }
    
    func requestData() -> Bool {
        var successful = false
        let urlPath = URL(string: dataURL)!
        let urlRequest = URLRequest(url: urlPath)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                successful = true
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [[String:AnyObject]]
                    for quiz in json {
                        let title = quiz["title"] as! String
                        self.quizTitles.append(title)
                        self.quizDescriptions.append(quiz["desc"] as! String)
                        
                        for question in quiz["questions"] as! [[String: AnyObject]] {
                            if !self.questions.keys.contains(title) {
                                self.questions.updateValue([question["text"] as! String], forKey: title)
                                self.quizAnswers.updateValue([question["answer"] as! String], forKey: title)
                                self.possibleAnswers.updateValue([question["answers"] as! [String]], forKey: title)
                            } else {
                                self.questions[title]?.append(question["text"] as! String)
                                self.quizAnswers[title]?.append(question["answer"] as! String)
                                self.possibleAnswers[title]?.append(question["answers"] as! [String])
                            }
                        }
                    }
//                    let saved = UserDefaults.standard
//                    
//                    saved.setValue(self.quizTitles, forKey: quizKeys.quizTitles)
//                    saved.setValue(self.quizDescriptions, forKey: quizKeys.quizDescriptions)
//                    saved.setValue(self.questions, forKeyPath: quizKeys.questions)
//                    saved.setValue(self.quizAnswers, forKeyPath: quizKeys.quizAnswers)
//                    saved.setValue(self.possibleAnswers, forKeyPath: quizKeys.possibleAnswers)
//                    
//                    saved.synchronize()
                } catch {
                    print("error: \(error)")
                }
            }
        }
        
        task.resume()
        
        return successful
    }
    
    @IBAction func presentSettings(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Change Questions URL", message: "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
            
        })
        let changeURLAction = UIAlertAction(title: "Check Now", style: .default, handler: {
            action -> Void in
            let questionURL = alert.textFields![0] as UITextField
            self.dataURL = questionURL.text!
            self.view.setNeedsDisplay()
        })
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter new URL"
        }
        
        alert.addAction(cancelAction)
        alert.addAction(changeURLAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
}
