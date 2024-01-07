//
//  ViewController.swift
//  SaveFormsWithDelegate
//
//  Created by azinavi on 6/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    var nextViewButton = UIButton()
    var infoTextLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoLabelSetup()
        nextViewButtonSetup()
        
    }
    
    func infoLabelSetup() {
        infoTextLabel.frame = CGRect(x: 30, y: 70, width: 400, height: 30)
        infoTextLabel.textColor = .white
        infoTextLabel.font = .systemFont(ofSize: 15)
        view.addSubview(infoTextLabel)
    }
    
    func nextViewButtonSetup() {
        nextViewButton.setTitle("Заполнить данные", for: .normal)

        nextViewButton.titleLabel?.font = .systemFont(ofSize: 20)
        nextViewButton.setTitleColor(UIColor.systemBlue, for: .normal)
        nextViewButton.frame = CGRect(x: view.center.x - 90, y: view.center.y - 15, width: 180, height: 30)
        nextViewButton.addTarget(self, action: #selector(tapNextViewButton), for: .touchUpInside)
        view.addSubview(nextViewButton)
        view.backgroundColor = UIColor.black
    }
    @objc func tapNextViewButton() {
        let storyboard = UIStoryboard(name: "Second", bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondVC.delegate = self
        secondVC.modalPresentationStyle = .fullScreen
        
        if let navigationController = navigationController {
            navigationController.pushViewController(secondVC, animated: true)
        } else {
            let navController = UINavigationController(rootViewController: secondVC)
            navController.navigationBar.prefersLargeTitles = true
            present(navController, animated: true, completion: nil)
        }
    }
}

extension ViewController: SendDataDelegate {
    func sendData(text: String) {
        self.infoTextLabel.text = text
    }
}

