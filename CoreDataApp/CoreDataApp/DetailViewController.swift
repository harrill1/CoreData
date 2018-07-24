//
//  DetailViewController.swift
//  CoreDataApp
//
//  Created by Hayden on 7/21/18.
//  Copyright © 2018 Harrill, Hayden. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var existingExpense: Expense?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        amountField.delegate = self

        nameField.text = existingExpense?.name
        
        if let amount = existingExpense?.amount {
            amountField.text = "\(amount)"
        }
        
        if let date = existingExpense?.date {
            datePicker.date = date
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameField.resignFirstResponder()
        amountField.resignFirstResponder()
    }

    @IBAction func saveExpense(_ sender: Any) {
        let name = nameField.text
        let amountText = amountField.text ?? ""
        let amount = Double(amountText) ?? 0.0
        let date = datePicker.date
         
        var expense: Expense?
        
        if let existingExpense = existingExpense {
            existingExpense.name = name
            existingExpense.amount = amount
            existingExpense.date = date
            
            expense = existingExpense
        } else {
            expense = Expense(name: name, amount: amount, date: date)
        }
        
        if let expense = expense {
            do {
                let managedContext = expense.managedObjectContext
                
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            } catch {
                print("Context could not be saved")
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
