//
//  QuizTableViewCell.swift
//  iQuiz
//
//  Created by iGuest on 11/3/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class QuizTableViewCell: UITableViewCell {

    @IBOutlet weak var quizTitle: UILabel!
    @IBOutlet weak var quizDescription: UILabel!
    @IBOutlet weak var quizIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        quizIcon.image = UIImage(named: "quiz_icon")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
