//
//  ViewController.swift
//  ProgrammitcallyTableView
//
//  Created by SHUBHAM AGARWAL on 20/02/19.
//  Copyright © 2019 SHUBHAM AGARWAL. All rights reserved.
//

import UIKit

class UserModal {
    var userImage: UIImage?
    var name: String?
    var age: String?
    
    init(userImage: UIImage, name: String, age: String) {
        self.userImage = userImage
        self.name = name
        self.age = age
    }
}

class ViewController: UIViewController {
    
    var tableView = UITableView()
    
    var userArr = [UserModal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        self.title = "User List"
        userArr.append(UserModal(userImage:  #imageLiteral(resourceName: "Charlize Theron"), name: "Amber Heard", age: "32"))
        userArr.append(UserModal(userImage:  #imageLiteral(resourceName: "Emma Stone"), name: "Emma Stone", age: "30"))
        userArr.append(UserModal(userImage:  #imageLiteral(resourceName: "Natalie Portman"), name: "Natalie Portman", age: "37"))
        userArr.append(UserModal(userImage:  #imageLiteral(resourceName: "Emma Watson"), name: "Emma Watson", age: "28"))
        userArr.append(UserModal(userImage:  #imageLiteral(resourceName: "Amber Heard"), name: "Angelina Jolie", age: "43"))
        userArr.append(UserModal(userImage:  #imageLiteral(resourceName: "Jennifer Lawrence"), name: "Scarlett Johansson", age: "34"))
        userArr.append(UserModal(userImage:  #imageLiteral(resourceName: "Angelina Jolie"), name: "Jennifer Lawrence", age: "28"))
        userArr.append(UserModal(userImage:  #imageLiteral(resourceName: "Scarlett Johansson"), name: "Charlize Theron", age: "43"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTableView() {
        tableView.frame = self.view.frame
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        tableView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        self.view.addSubview(tableView)
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell else {fatalError("Unabel to create cell")}
        cell.userImage.image = userArr[indexPath.row].userImage
        cell.namelbl.text = userArr[indexPath.row].name
        cell.agelbl.text = userArr[indexPath.row].age
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}

