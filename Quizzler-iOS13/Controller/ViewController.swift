//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight{
            print("right!")
            sender.backgroundColor = .green
        } else {
            print("wrong!")
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

    }
    
    @objc func updateUI(){
        progressBar.progress = quizBrain.getProgress()
        questionLabel.text = quizBrain.getQuestionText()
        
        answerButton1.setTitle(quizBrain.getQuestionAnswer(numberOfAnswer: 0), for: .normal)
        answerButton2.setTitle(quizBrain.getQuestionAnswer(numberOfAnswer: 1), for: .normal)
        answerButton3.setTitle(quizBrain.getQuestionAnswer(numberOfAnswer: 2), for: .normal)

        answerButton1.backgroundColor = .clear
        answerButton2.backgroundColor = .clear
        answerButton3.backgroundColor = .clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }

}

