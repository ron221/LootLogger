//
//  DetailViewController.swift
//  LootLogger
//
//  Created by Ron Yeh on 2021/8/7.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var serialNuberField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    var item: Item!
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialNuberField.text = item.serialNumber
        valueField.text = numberFormatter.string(from: NSNumber(value: item.valueInDollars))
        dateLabel.text = dateFormatter.string(from: item.dateCtreated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // save "changes" to item
        item.name = nameField.text ?? ""
        item.serialNumber = serialNuberField.text
        if let valueText = valueField.text, let value = numberFormatter.number(from: valueText){
            item.valueInDollars = value.intValue
        }else {
            item.valueInDollars = 0
        }
    }
}
