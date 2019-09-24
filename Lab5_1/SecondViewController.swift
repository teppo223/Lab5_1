//
//  SecondViewController.swift
//  Lab5_1
//
//  Created by Toni Kontio on 24/09/2019.
//  Copyright © 2019 Toni Kontio. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    var timerMinutes:Int = 0
    var timerSeconds:Int = 0
    var done:Bool = false
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timerLabel.text! = String(timerMinutes) + ":" + String(timerSeconds)
        
        let utterance = AVSpeechUtterance(string: "Timer started")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.2
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        
        var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("updateLabel"), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
}

    
    @objc func updateLabel()
    {
        if done == false{
            if timerSeconds > 0{
                timerSeconds = timerSeconds - 1
            }
            else if timerMinutes > 0{
                timerMinutes = timerMinutes - 1
                timerSeconds = 59
            }
            else {
                let utterance = AVSpeechUtterance(string: "DONE!")
                utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
                utterance.rate = 0.2
                
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
                done = true
                self.navigationController?.popViewController(animated: true)
                self.dismiss(animated: true, completion: nil)
            }
            timerLabel.text! = String(timerMinutes) + ":" + String(timerSeconds)
        }
    }
}
