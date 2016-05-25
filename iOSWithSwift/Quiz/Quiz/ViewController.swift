//
//  ViewController.swift
//  Quiz
//
//  Created by Mia on 5/17/16.
//  Copyright © 2016 Mia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    var currentQuestionIndex: Int = 0
    let questions: [String] = ["From what is cognac made?", "What is 7+7?", "What is the capital of Vermont?"]
    let answers: [String] = ["Grapes", "14", "Montpelier"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentQuestionLabel.text = questions[currentQuestionIndex]
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        currentQuestionLabel.alpha = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showNextQuestion(sender: UIButton) {
        currentQuestionIndex += 1
        currentQuestionIndex = currentQuestionIndex % questions.count
        
        let question : String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }

    @IBAction func showAnswer(sender: AnyObject) {
        let answer : String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }

    func animateLabelTransitions() {
        
//        let animationClosure = { () -> Void in
//            self.questionLabel.alpha = 1
//        }
//        
//        UIView.animateWithDuration(0.5, animations: animationClosure)
        
        UIView.animateWithDuration(0.5) {
            self.nextQuestionLabel.alpha = 1
            self.currentQuestionLabel.alpha = 0
        }
    }
    
}

