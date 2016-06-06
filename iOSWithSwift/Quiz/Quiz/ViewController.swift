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
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var answerLabel: UILabel!
    var currentQuestionIndex: Int = 0
    let questions: [String] = ["From what is cognac made?", "What is 7+7?", "What is the capital of Vermont?"]
    let answers: [String] = ["Grapes", "14", "Montpelier"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentQuestionLabel.text = questions[currentQuestionIndex]
        updateOffScreenLabel()
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
        view.layoutIfNeeded()
//        let animationClosure = { () -> Void in
//            self.questionLabel.alpha = 1
//        }
//        UIView.animateWithDuration(0.5, animations: animationClosure)
        
//        UIView.animateWithDuration(0.5) {
//            self.nextQuestionLabel.alpha = 1
//            self.currentQuestionLabel.alpha = 0
//        }

        let screenWidth = view.frame.width
        
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [.CurveLinear], animations: {
            self.nextQuestionLabel.alpha = 1
            self.currentQuestionLabel.alpha = 0
            self.view.layoutIfNeeded()
            }) { (_) in
                swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
                self.updateOffScreenLabel()
        }
        
//        UIView.animateWithDuration(0.5, delay: 0, options: [.CurveLinear], animations: {
//            self.nextQuestionLabel.alpha = 1
//            self.currentQuestionLabel.alpha = 0
//            self.view.layoutIfNeeded()
//            }) { (_) in
//                swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
//                swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
//                self.updateOffScreenLabel()
//        }
    }
    
    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth;
    }
    
}

