//
//  ViewController.swift
//  Xiangqin
//
//  Created by abel on 15/8/28.
//  Copyright (c) 2015年 abel. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var heightNumber: UISlider!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var hasProperty: UISwitch!
    @IBOutlet weak var result: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate = self//点击return退出键盘
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func heightChanged(sender: AnyObject) {
        var slider = sender as! UISlider
        var i = Int(slider.value)   //Float转换为Int
        slider.value = Float(i)     //转换操作
        height.text = "\(i)厘米"    //随着滑块改变label的值
    }

    @IBAction func okTapped(sender: AnyObject) {
        let genderText = gender.selectedSegmentIndex==0 ? "高富帅" : "白富美"
        let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let now = NSDate()
        birthday.maximumDate = NSDate()//防止年龄为负数
        let components = gregorian?.components(NSCalendarUnit.CalendarUnitYear, fromDate: birthday.date, toDate: now, options: NSCalendarOptions(0))//计算年龄
        
        let age = components!.year//得到年龄
        let hasPropertyText = hasProperty.on ? "有房":"没房"  //switch值的数据
        
        result.text = "\(name.text),\(age)岁,\(genderText),身高\(height.text!),\(hasPropertyText),求交往!"
        
    }
    
    //UITextFiledDelegate,点击return使键盘退出
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
}

