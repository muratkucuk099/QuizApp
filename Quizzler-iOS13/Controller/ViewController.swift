//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var secondOptionButton: UIButton!
    var quizBrain = QuizBrain()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loadingquestionLabel.text = quiz[quizNumber]
        updateScene()
    }


    @IBAction func answerButton(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let userGotItRigth = quizBrain.checkAnswer(userAnswer!)
        
        if userGotItRigth {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateScene), userInfo: nil, repeats: false)
        
    }
    @objc func updateScene() {
        trueButton.setTitle(quizBrain.getAnswerText()[0], for: .normal)
        secondOptionButton.setTitle(quizBrain.getAnswerText()[1], for: .normal)
        falseButton.setTitle(quizBrain.getAnswerText()[2], for: .normal)
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        secondOptionButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgressBar()
    }
    
}

