//
//  ViewController.swift
//  GoalTimer
//
//  Created by Hsinyi Liu on 2022/7/25.
//

import UIKit

class ViewController: UIViewController {


    
    @IBOutlet weak var goalDateTextFeild: UITextField!
    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var resultDays: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet var InputView: UIView!{
        didSet {
            InputView.layer.cornerRadius = 32
            //InputView.isHidden = true
        }
    }
    @IBOutlet weak var resultView: UIView!{
        didSet{
            //resultView.isHidden = true
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultView.isHidden = true
        InputView.isHidden = true
    }


    @IBAction func closeKeyboard(_ sender: Any) {
        goalTextField.resignFirstResponder()
    }
    
    
    @IBAction func openInputView(_ sender: Any) {
        InputView.isHidden = false
        resultView.isHidden = true
        goalTextField.text=""
        datePicker.date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        goalDateTextFeild.text = dateFormatter.string(from:Date())
    }
    
    @IBAction func getGoalDate(_ sender: UIDatePicker) {
        let inputDate = sender as UIDatePicker
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        goalDateTextFeild.text = dateFormatter.string(from:inputDate.date)
    }
    
    @IBAction func caculate(_ sender: Any) {
        
        
        if goalTextField.text?.isEmpty == true {
           let controller = UIAlertController(title: "錯誤！", message: "請輸入目標", preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           controller.addAction(okAction)
           present(controller, animated: true, completion: nil)
            return
        }
        
        if goalDateTextFeild.text?.isEmpty == true {
           let controller = UIAlertController(title: "錯誤！", message: "請輸入時間", preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           controller.addAction(okAction)
           present(controller, animated: true, completion: nil)
            return
        }
        
        
        InputView.isHidden = true
        
        let today = Date()
        let goalDate = string2Date(goalDateTextFeild.text!)
        let diff = Calendar.current.dateComponents([.day], from: today , to: goalDate)
        resultDays.text = "\(diff.day!)"
        goalLabel.text = goalTextField.text
        
        resultView.isHidden = false
    }
    
    func string2Date(_ string:String, dateFormat:String = "yyyy/MM/dd") -> Date {
        let formatter = DateFormatter()
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        let date = formatter.date(from: string)
        return date!
    }
    
}


