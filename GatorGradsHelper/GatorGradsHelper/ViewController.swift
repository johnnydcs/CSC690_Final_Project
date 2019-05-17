//
//  ViewController.swift
//  GatorGradsHelper
//
//  Created by Johnny Huynh on 5/15/19.
//  Copyright © 2019 Johnny Huynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SelectButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var SelectNumButton: UIButton!
    
    @IBOutlet weak var tableNumView: UITableView!
    
    var Subjects = ["Computer Science", "Math", "English", "Psychology", "Business"]
    
    var CourseNumbers = ["100", "110", "200", "210", "220", "256", "300", "412", "415", "510", "520", "600", "631", "645", "667"]
    
    var AddThisSubject = ""
    var AddThisCourseNumber = ""
    
    @IBAction func SelectButtonDrop(_ sender: Any) {
        
        if tableView.isHidden {
            animate(toggle: true)
        } else {
            animate(toggle: false)
        }
    }
    
    @IBAction func SelectNumButtonDrop(_ sender: Any) {
        
        if tableNumView.isHidden {
            animate2(toggle: true)
        } else {
            animate2(toggle: false)
        }
    }
    
    func animate(toggle: Bool) {
        if (toggle) {
            UIView.animate(withDuration: 0.3) {
                self.tableView.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.tableView.isHidden = true
            }
        }
        
    }
    
    func animate2(toggle: Bool) {
        if (toggle) {
            UIView.animate(withDuration: 0.3) {
                self.tableNumView.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.tableNumView.isHidden = true
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
        tableNumView.isHidden = true;
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Start of Course Subject List Only
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Subjects[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SelectButton.setTitle("\(Subjects[indexPath.row])", for: .normal)
        AddThisSubject = Subjects[indexPath.row]
        AddThisCourseNumber = CourseNumbers[indexPath.row]
        animate(toggle: false)
    }
    // End of Course Subject List
    
    // Start of Course Number List Only
    func tableNumView(_ tableNumView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CourseNumbers.count
    }
    
    func tableNumView(_ tableNumView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableNumView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        cell.textLabel?.text = CourseNumbers[indexPath.row]
        return cell
    }
    
    func tableNumView(_ tableNumView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SelectNumButton.setTitle("\(CourseNumbers[indexPath.row])", for: .normal)
        AddThisSubject = Subjects[indexPath.row]
        AddThisCourseNumber = CourseNumbers[indexPath.row]
        animate(toggle: false)
    }
    // End of Course Number List
    
}
