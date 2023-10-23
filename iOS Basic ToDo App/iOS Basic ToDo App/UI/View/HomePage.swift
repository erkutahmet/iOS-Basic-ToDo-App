//
//  ViewController.swift
//  iOS Basic ToDo App
//
//  Created by Ahmet Erkut on 23.10.2023.
//

import UIKit
import RxSwift

class HomePage: UIViewController {

    @IBOutlet private weak var tasksTableView: UITableView!
    @IBOutlet private weak var taskSearchBar: UISearchBar!
    
    var tasksList = [Tasks]()
    
    var homePageVM = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homePageVM.uploadTasks()
    }
    
    private func setUI() {
        tasksTableView.dataSource = self
        tasksTableView.delegate = self
        taskSearchBar.delegate = self
        
        _ = homePageVM.tasksList.subscribe(onNext: { list in
            self.tasksList = list
            self.tasksTableView.reloadData()
        })
    }
}

extension HomePage: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        
        cell.titleLabel.text = "Task - \(indexPath.row + 1)"
        cell.contentLabel.text = tasksList[indexPath.row].task_name
        
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, bool in
            let task = self.tasksList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete Task!", message: "Are you sure to delete? \n(\(task.task_name!))", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let okayAction = UIAlertAction(title: "Okay", style: .destructive) { action in
                self.homePageVM.deleteTask(taskId: task.task_id!)
            }
            alert.addAction(okayAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let doneAction = UIContextualAction(style: .normal, title: "Complete") { contextualAction, view, bool in
            let task = self.tasksList[indexPath.row]
            self.homePageVM.deleteTask(taskId: task.task_id!)
        }
        doneAction.backgroundColor = UIColor.green
        
        return UISwipeActionsConfiguration(actions: [doneAction])
    }
}

extension HomePage: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        homePageVM.searchTask(searchText: searchText)
    }
}
