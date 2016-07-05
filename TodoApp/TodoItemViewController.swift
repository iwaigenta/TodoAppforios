//
//  TodoItemViewController.swift
//  TodoApp
//
//  Created by 1st_iwai on 2016/07/04.
//  Copyright © 2016年 1st_iwai. All rights reserved.
//

import UIKit

class TodoItemViewController: UIViewController {

    @IBOutlet weak var todoFeild: UITextField!
    var task : Todo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let taskTodo = task {
            todoFeild.text = taskTodo.item
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        navigationController!.popViewControllerAnimated(true)
    }

    @IBAction func save(sender: UIBarButtonItem) {
        if task != nil {
            editTask()
        } else {
            createTask()
        }
        navigationController!.popViewControllerAnimated(true)
    }
    func createTask() {
        let newTask : Todo = Todo.MR_createEntity() as Todo!
        newTask.item = todoFeild.text
        newTask.managedObjectContext!.MR_saveToPersistentStoreAndWait()
    }
    
    func editTask() {
        task?.item = todoFeild.text
        task?.managedObjectContext!.MR_saveToPersistentStoreAndWait()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
