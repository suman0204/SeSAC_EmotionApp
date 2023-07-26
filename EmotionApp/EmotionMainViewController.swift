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
    @IBAction func plusOne(_ sender: UIButton) {
    }
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        if let emotion = Emotion(rawValue: sender.tag), let count = emotionCounts[emotion], let emotionCount = Int(UserDefaults.standard.string(forKey: "\(emotion)") ?? "0") {
            
            let plusOne = UIAction(title: "+ 1", handler: { _ in
                UserDefaults.standard.set(emotionCount + 1, forKey: "\(emotion)")

                print("\(emotion)은 \(emotionCount + 1)점입니다")

            })

            let plusFive = UIAction(title: "+ 5", handler: { _ in
                print("first \(count)")

//                self.emotionCounts[emotion] = count + 5
//                print("\(emotion)은 \(count + 5)점입니다")
//                UserDefaults.standard.set(count + 5, forKey: "\(emotion)")
//                print("second \(count)")
//                print("userdefaults\(UserDefaults.standard.integer(forKey: "\(emotion)"))")
                UserDefaults.standard.set(emotionCount + 5, forKey: "\(emotion)")

                print("\(emotion)은 \(emotionCount + 5)점입니다")



            })

            let plusTen = UIAction(title: "+ 10", handler: { _ in
//                self.emotionCounts[emotion] = count + 10
//                print("\(emotion)은 \(count + 10)점입니다")
//                UserDefaults.standard.set(count + 10, forKey: "\(emotion)")
                UserDefaults.standard.set(emotionCount + 10, forKey: "\(emotion)")

                print("\(emotion)은 \(emotionCount + 10)점입니다")

            })

            let cancel = UIAction(title: "취소", attributes: .destructive, handler: { _ in print("취소") })

            sender.menu = UIMenu(title: "title입니다",
                                 image: UIImage(systemName: "heart.fill"),
                                 identifier: nil,
                                 options: .displayInline,
                                 children: [plusOne, plusFive, plusTen, cancel])

            print()
            
            emotionCounts[emotion] = count + 1
//            print(emotion)
//            print(sender.tag)
//
            UserDefaults.standard.set(emotionCount + 1, forKey: "\(emotion)")

            print("\(emotion)은 \(emotionCount + 1)점입니다")

//            UserDefaults.standard.set(count + 1, forKey: "\(emotion)")
//            print(UserDefaults.standard.string(forKey: "\(emotion)"))
//            UserDefaults.standard.set
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
