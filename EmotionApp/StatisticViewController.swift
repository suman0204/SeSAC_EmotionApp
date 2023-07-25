//
//  StatisticViewController.swift
//  EmotionApp
//
//  Created by 홍수만 on 2023/07/25.
//

import UIKit

class StatisticViewController: UIViewController {
    let emotionVC = EmotionMainViewController()
    
    @IBOutlet var appTitle: UILabel!
    
    @IBOutlet var emotionScoreLabelCollection: [UILabel]!
    
    @IBOutlet var scoreLabelCollection: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designAppTitle()
        designEmotionScoreLabel()
        designScoreLabel()
    }
    
    func designAppTitle() {
        appTitle.text = "OH MY MOOD"
        appTitle.font = .boldSystemFont(ofSize: 20)
        appTitle.textAlignment = .center
    }
    
    func designEmotionScoreLabel() {
        for label in emotionScoreLabelCollection {
            if let emotion = Emotion(rawValue: label.tag) {
                label.text = String(describing: emotion)
//                label.font = .boldSystemFont(ofSize: 20)
                label.backgroundColor = emotionVC.buttonColor[label.tag]
                label.layer.cornerRadius = 10
                label.layer.masksToBounds = true
            }
        }
    }
    
    func designScoreLabel() {
        scoreLabelCollection.forEach { UILabel in
            if let emotion = Emotion(rawValue: UILabel.tag), let count = emotionVC.emotionCounts[emotion] {
                UILabel.text = String(count)
            }
        }
    }

}
