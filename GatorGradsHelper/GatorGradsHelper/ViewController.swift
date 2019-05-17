//
//  ViewController.swift
//  GatorGradsHelper
//
//  Created by Johnny Huynh on 5/1/19.
//  Copyright © 2019 Johnny Huynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SelectButton: UIButton!
    
    @IBOutlet weak var subjectTableView: UITableView!
    
    @IBOutlet weak var SelectNumButton: UIButton!
    
    @IBOutlet weak var tableNumView: UITableView!
    
    @IBOutlet weak var AddCourseButton: UIButton!
    
    @IBOutlet weak var CheckEligibilty: UIButton!
    
    @IBAction func AddThisCourseAction(_ sender: Any) {
        
        let currentCourse = AddThisSubject + AddThisCourseNumber
        
        for course in usersCourses
        {
            if course != currentCourse {
                usersCourses.append(currentCourse)
                print("Appended " + currentCourse + " to user's courses\n")
                break
            }
        }
    }
    
    @IBAction func CheckAction(_ sender: Any) {
        
    }
    
    var usersCourses: [String] = []
    
    var Subjects = ["Computer Science", "Math", "English", "Psychology", "Business"]
    
    var CourseNumbers = ["100", "110", "200", "210", "220", "256", "300", "412", "415", "510", "520", "600", "631", "645", "667"]
    
    var AddThisSubject = ""
    var AddThisCourseNumber = ""
    
    @IBAction func SelectButtonDrop(_ sender: Any) {
        
        if subjectTableView.isHidden {
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
                self.subjectTableView.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.subjectTableView.isHidden = true
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
        subjectTableView.isHidden = true
        tableNumView.isHidden = true;
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (tableView == subjectTableView)
        {
            return Subjects.count
        }
        
        else
        {
            return CourseNumbers.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView == subjectTableView)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = Subjects[indexPath.row]
                return cell
        }
            
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = CourseNumbers[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView == subjectTableView)
        {
            SelectButton.setTitle("\(Subjects[indexPath.row])", for: .normal)
            AddThisSubject = Subjects[indexPath.row]
            AddThisCourseNumber = CourseNumbers[indexPath.row]
            animate(toggle: false)
        }
        
        else
        {
            SelectNumButton.setTitle("\(CourseNumbers[indexPath.row])", for: .normal)
            AddThisSubject = Subjects[indexPath.row]
            AddThisCourseNumber = CourseNumbers[indexPath.row]
            animate2(toggle: false)
        }
    }
}
