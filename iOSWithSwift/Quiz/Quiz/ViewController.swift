//
//  ViewController.swift
//  Quiz
//
//  Created by Mia on 5/17/16.
//  Copyright © 2016 Mia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    var currentQuestionIndex: Int = 0
    let questions: [String] = ["From whta is cognac made?", "What is 7+7?", "What is the capital of Vermont?"]
    let answers: [String] = ["Grapes", "14", "Montpelier"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        questionLabel.text = questions[currentQuestionIndex]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showNextQuestion(sender: UIButton) {
        currentQuestionIndex += 1
        currentQuestionIndex = currentQuestionIndex % questions.count
        
        let question : String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }

    @IBAction func showAnswer(sender: AnyObject) {
        let answer : String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }

}

