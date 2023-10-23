//
//  ViewController.swift
//  iOS Basic ToDo App
//
//  Created by Ahmet Erkut on 23.10.2023.
//

import UIKit

class HomePage: UIViewController {

    @IBOutlet private weak var tasksTableView: UITableView!
    @IBOutlet private weak var taskSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        tasksTableView.dataSource = self
        tasksTableView.delegate = self
    }
}

extension HomePage: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        
        cell.titleLabel.text = "Task - \(indexPath.row + 1)"
        cell.contentLabel.text = "Selam"
        
        return cell
    }
    
    
}
