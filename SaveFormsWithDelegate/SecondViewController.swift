//
//  SecondViewController.swift
//  SaveFormsWithDelegate
//
//  Created by azinavi on 6/1/24.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(text: String)
}

class SecondViewController: UIViewController, UITextFieldDelegate{
    
    weak var delegate: SendDataDelegate?
    
    var previousViewButton = UIButton()
    var label = UILabel()
    var textField1 = UITextField()
    var textField2 = UITextField()
    var textField3 = UITextField()
    
    
    //MARK: UITextFieldDelegate methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textField1 {
            textField2.becomeFirstResponder()
        } else if textField == textField2 {
            textField3.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        superViewSetup()
        labelSetup()
        textFieldsSetup()
        previousViewButtonSetup()
        
    }
    
    func superViewSetup () {
        view.backgroundColor = .black
    }
    
    func labelSetup() {
        label.frame = CGRect(x: 100, y: 47, width: 400, height: 40)
        label.text = "Введите ваши данные!"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        view.addSubview(label)
    }
    
    func textFieldsSetup() {
        textField1.frame = CGRect(x: 20, y: 100, width: 400, height: 40)
        textField1.backgroundColor = .white
        textField1.placeholder = "Name:"
        textField1.layer.cornerRadius = 5
        textField1.clearButtonMode = .always
        
        textField2.frame = CGRect(x: 20, y: 160, width: 400, height: 40)
        textField2.backgroundColor = .white
        textField2.placeholder = "Surname:"
        textField2.layer.cornerRadius = 5
        textField2.clearButtonMode = .always
        
        textField3.frame = CGRect(x: 20, y:220, width: 400, height: 40)
        textField3.backgroundColor = .white
        textField3.placeholder = "Age:"
        textField3.layer.cornerRadius = 5
        textField3.clearButtonMode = .always
        
        view.addSubview(textField1)
        view.addSubview(textField2)
        view.addSubview(textField3)
    }
    
    func previousViewButtonSetup() {
        previousViewButton.setTitle("Сохранить", for: .normal)
        previousViewButton.setTitleColor(UIColor.systemBlue, for: .normal)
        previousViewButton.titleLabel?.font = .systemFont(ofSize: 20)
        previousViewButton.frame = CGRect(x: view.center.x - 90, y: view.center.y - 180, width: 180, height: 30)
        previousViewButton.addTarget(self, action: #selector(tapPreviousViewButton), for: .touchUpInside)
        view.addSubview(previousViewButton)
        view.backgroundColor = UIColor.black

    }
    @objc func tapPreviousViewButton() {
        navigationController?.popViewController(animated: true)
        sendText()
    }
    
    func sendText() {
        let data = "Данные: \(textField1.text!) \(textField2.text!) \(textField3.text!)"
        delegate?.sendData(text: data)
    }
}
