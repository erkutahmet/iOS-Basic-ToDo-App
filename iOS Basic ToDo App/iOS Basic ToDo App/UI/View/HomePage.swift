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
    
    var tasksList = [Tasks]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
    }
    
    private func setUI() {
        tasksTableView.dataSource = self
        tasksTableView.delegate = self
    }
    
    private func setData() {
        let t1 = Tasks(id: 1, name: "Feed dog")
        let t2 = Tasks(id: 2, name: "Write some code.")
        let t3 = Tasks(id: 3, name: "Make food")
        let t4 = Tasks(id: 4, name: "Go shopping")
        let t5 = Tasks(id: 5, name: "Seen a doctor")
        
        tasksList.append(t1)
        tasksList.append(t2)
        tasksList.append(t3)
        tasksList.append(t4)
        tasksList.append(t5)
    }
}

extension HomePage: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        
        cell.titleLabel.text = "Task - \(indexPath.row + 1)"
        cell.contentLabel.text = tasksList[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: tasksList[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let data = sender as? Tasks {
                let toVC = segue.destination as! DetailPage
                toVC.task = data
            }
        }
    }
}
