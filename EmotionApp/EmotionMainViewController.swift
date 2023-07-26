//
//  EmotionMainViewController.swift
//  EmotionApp
//
//  Created by 홍수만 on 2023/07/25.
//

import UIKit

class EmotionMainViewController: UIViewController {
    
//    let statisticVC: StatisticViewController = StatisticViewController()
    
    let imageName: [String] = ["emoji1", "emoji2", "emoji2", "emoji3", "emoji4", "emoji5"]
    let buttonColor: [UIColor] = [.red, .orange, .yellow, .green, .blue]
    
    var emotionCounts: [Emotion : Int] = [.완전행복지수 : 0, .적당미소지수 : 0, .그냥그냥지수 : 0, .좀속상한지수 : 0, .많이슬픈지수 : 0]
    
    @IBOutlet var appTitle: UILabel!
    
    @IBOutlet var recordEmotionButtonCollection: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designAppTitle()
        designEmotionButton()
        
        for index in 0...4 {
            let emotions = Emotion.allCases
            let userDefaultScore = UserDefaults.standard.integer(forKey: "\(emotions[index])")
            emotionCounts[emotions[index]] = userDefaultScore
        }
        
    }
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        if let emotion = Emotion(rawValue: sender.tag), let count = emotionCounts[emotion] {
            emotionCounts[emotion] = count + 1
            print(emotion)
            print(sender.tag)
            print("\(emotion)은 \(count + 1)점입니다")
            UserDefaults.standard.set(count + 1, forKey: "\(emotion)")
        }
        
    }
    
    func designAppTitle() {
        appTitle.text = "OH MY MOOD"
        appTitle.font = .boldSystemFont(ofSize: 20)
        appTitle.textAlignment = .center
    }

    func designEmotionButton() {
        for button in recordEmotionButtonCollection {
            button.setTitle("", for: .normal)
            button.setImage(UIImage(named: imageName[button.tag]), for: .normal)
            button.backgroundColor = buttonColor[button.tag]
        }
    }
    
        
}
