//
//  ViewController.swift
//  EmotionDiary
//
//  Created by cho on 1/2/24.
//

import UIKit

class ViewController: UIViewController {

    let imageList: [UIImage] = [.slime1, .slime2, .slime3, .slime4, .slime5, .slime6, .slime7, .slime8, .slime9]
    
    let labelName: [String] = ["행복해", "좋아해", "사랑해", "화가나", "우울해", "속상해", "당황해", "심심해", "미안해"]
    //var clickedCount: [Int] = [0,0,0,0,0,0,0,0,0]
    
    @IBOutlet var buttonList: [UIButton]!
    @IBOutlet var nameList: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        for idx in 0...imageList.count-1 {
            setButton(idx)
        }
        
        navigationItem.title = "감정 다이어리"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(clearCount))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func clearCount() {
        for idx in 0...imageList.count-1 {
            UserDefaults.standard.set(0, forKey: "\(idx)")
            nameList[idx].text = "\(labelName[idx]) \(UserDefaults.standard.integer(forKey: "\(idx)"))"
        }
    }
    
    func setButton(_ idx: Int) {
        buttonList[idx].setImage(imageList[idx], for: .normal)
        buttonList[idx].setTitle("", for: .normal)
        buttonList[idx].tag = idx
        
        nameList[idx].text = "\(labelName[idx]) \(UserDefaults.standard.integer(forKey: "\(idx)"))"
        nameList[idx].textAlignment = .center
        nameList[idx].font = .systemFont(ofSize: 12)
        nameList[idx].textColor = .black
    }
  
    @IBAction func buttonTapped(_ sender: UIButton) {
        let idx = sender.tag
        let tmp = UserDefaults.standard.integer(forKey: "\(idx)") + 1
        UserDefaults.standard.set(tmp, forKey: "\(idx)")
        nameList[idx].text = "\(labelName[idx]) \(UserDefaults.standard.integer(forKey: "\(idx)"))"
    }
}

