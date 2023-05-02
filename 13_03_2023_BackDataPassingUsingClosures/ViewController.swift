//
//  ViewController.swift
//  13_03_2023_BackDataPassingUsingClosures
//
//  Created by Vishal Jagtap on 02/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var secondViewController : SecondViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    @IBAction func btnMoveToSVC(_ sender: Any) {
        secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
        
        //way 1 - directly passing properties as an argument to closure
//        secondViewController!.dataPassingClosure = {
//            (firstName, lastName, city) in
//            self.firstNameLabel.text = firstName
//            self.lastNameLabel.text = lastName
//            self.cityLabel.text = city
        
        //way 2 - passing object as an argument to closure
        secondViewController?.dataPassClosure = {
            (student) in
            self.firstNameLabel.text = student.firstName
            self.lastNameLabel.text = student.lastName
            self.cityLabel.text = student.city
        }
        
        navigationController?.pushViewController(secondViewController!, animated: true)
    }
}
