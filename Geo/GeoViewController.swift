//
//  ViewController.swift
//  Geo
//
//  Created by kavita patel on 5/10/16.
//  Copyright © 2016 kavita patel. All rights reserved.
//

import UIKit
import AVFoundation

class GeoViewController: UIViewController, AVSpeechSynthesizerDelegate
{

    @IBOutlet weak var flag1: UIButton!
    @IBOutlet weak var flag2: UIButton!
    @IBOutlet weak var flag3: UIButton!
    @IBOutlet weak var quizBtn: UIButton!
    
    var quizState = false
    var languageChoice = [Country]()
    let speechSynth = AVSpeechSynthesizer()
    var correctBtnTag = -1
    var dice = 0
    let countryObj = Country()
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
    }
    @IBAction func QuizBtnPressed(sender: AnyObject)
    {
        if quizState == false
        {
            //start quiz
            enableFlag(true)
            quizBtn.setTitle("Stop Quiz", forState: .Normal)
            quizState = true
            
            //set flag
            flag1.setTitle(countryObj.questions[dice].answers[flag1.tag], forState: .Normal)
            flag1.setBackgroundImage(UIImage(named: "\(countryObj.questions[dice].answers[flag1.tag]).png"), forState: .Normal)
            flag2.setTitle(countryObj.questions[dice].answers[flag2.tag], forState: .Normal)
            flag2.setBackgroundImage(UIImage(named: "\(countryObj.questions[dice].answers[flag2.tag]).png"), forState: .Normal)
            flag3.setTitle(countryObj.questions[dice].answers[flag3.tag], forState: .Normal)
            flag3.setBackgroundImage(UIImage(named: "\(countryObj.questions[dice].answers[flag3.tag]).png"), forState: .Normal)
            correctBtnTag = countryObj.questions[dice].correctAnswerIndex
            
            //speak question
            let speech = AVSpeechUtterance(string: countryObj.questions[dice].question)
            speechSynth.speakUtterance(speech)
        }
        else
        {
            //stop quiz
            enableFlag(false)
            quizBtn.setTitle("Start Quiz", forState: .Normal)
            quizState = false
            
        }
    }
   
    @IBAction func flagBtnPressed(sender: AnyObject)
    {
        if sender.tag == correctBtnTag
        {
            showAlert("Correct", msg: "Right On !")
            enableFlag(false)
            quizBtn.setTitle("Start Quiz", forState: .Normal)
            quizState = false
            //Next question
            if dice == countryObj.questions.count-1
            {
                dice = 0
            }
            else
            {
                dice = dice + 1
            }

        }
        else
        {
            showAlert("Incorrect", msg: "Nope. Try again !")
        }
    }
    func showAlert(title: String, msg: String)
    {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    func enableFlag(val: Bool)
    {
        flag1.enabled = val
        flag2.enabled = val
        flag3.enabled = val
    }
}

