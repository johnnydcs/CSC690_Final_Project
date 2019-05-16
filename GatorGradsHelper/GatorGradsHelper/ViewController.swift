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
    
    var Courses = ["CompSci", "Math", "English"]
    
    @IBAction func SelectButtonDrop(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Courses[indexPath.row]
        return cell
    }
    
    
}
