//
//  SecondViewController.swift
//  13_03_2023_BackDataPassingUsingClosures
//
//  Created by Vishal Jagtap on 02/05/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    var firstName : String = String()
    var lastName : String = String()
    var city : String = String()
    
    //Way 2
    var student : Student?
    
    //way 1
    //var dataPassingClosure : ((String,String,String)->Void)?
    
    //way 2
    var dataPassClosure : ((Student)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func btnBackClick(_ sender: Any) {
        //way 1
//        guard let dataPass = dataPassingClosure else { return }
//
//        firstName = self.firstNameTextField.text!
//        lastName = self.lastNameTextField.text!
//        city = self.cityTextField.text!
//
//        dataPass(firstName,lastName,city)
        
        
        //way 2
        guard let dataPassClosureWay2 = dataPassClosure else { return  }
        
        firstName = self.firstNameTextField.text!
        lastName = self.lastNameTextField.text!
        city = self.cityTextField.text!
        
        student = Student(firstName: firstName, lastName: lastName, city: city)
        dataPassClosureWay2(student!)
        
        navigationController?.popViewController(animated: true)
    }
}
