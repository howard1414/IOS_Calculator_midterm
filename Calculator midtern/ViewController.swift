//
//  ViewController.swift
//  Calculator midtern
//
//  Created by Lab1422 on 2021/4/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // define object
    @IBOutlet weak var AnsDisplay: UITextField!
    @IBOutlet var numButtons: [UIButton]!
    @IBOutlet weak var HistoryLabel: UILabel!
    
    //define variable
    var temp:String = ""
    var calculator = Calculator()
    
    
    //number setup
    var ZeroNumEnable:Bool = false
    @IBAction func TouchnumButton(_ sender: UIButton) {
    if let num = numButtons.firstIndex(of: sender){
        
        var numChoice:String = String(num)
        
        if(numChoice != "0" || lastchoose != ""){
            ZeroNumEnable = true
        }
        
        if(!ZeroNumEnable && numChoice == "0" && temp.count != 0){
            numChoice = ""
        }
        
        if(temp.count == 1 && temp == "0" && numChoice != "0"){
            temp = ""
        }
        
        temp = temp + numChoice
        AnsDisplay.text = temp
        
    }else{
        print ("not in collection")
    }
    
    }
    
    //function setup
    @IBOutlet var funcButtons: [UIButton]!
    var lastchoose:String = ""
    @IBAction func TouchFuncButton(_ sender: UIButton) {
        
        if let _func = funcButtons.firstIndex(of: sender){
            var funcdis:String = ""
            
            switch _func{
            case 0:
                funcdis = "+"
                break
            case 1:
                funcdis = "-"
                break
            case 2:
                funcdis = "*"
                break
            case 3:
                funcdis = "/"
                break
            case 4:
                funcdis = "."
                break
            default:
                print("ERR")
                break
            }
            if(temp.last == "+" || temp.last == "-" || temp.last == "*" || temp.last == "/" || temp.last == "." || temp.count == 0 || (lastchoose == "." && funcdis == ".") ){
                funcdis = ""
            }else{
                
                lastchoose = funcdis
                
            }
            ZeroNumEnable = false
            temp = temp + String(funcdis)
            AnsDisplay.text = temp
        }else{
            print ("not in collection")
        }
        
    }
    
    
    //AC button
    @IBAction func AcButton(_ sender: UIButton) {
        temp = ""
        lastchoose = ""
        ZeroNumEnable = false
        AnsDisplay.text = temp
        HistoryLabel.text = ""
        
    }
    
    //percent button
    @IBAction func PercentButton(_ sender: Any) {
        
    }
    
    
    
    //minus plus button
    @IBAction func MPButton(_ sender: UIButton) {
        
    }
    
    
    //Ans button
   
    
    
    
    
    
    @IBAction func AnsButton(_ sender: UIButton) {
        var Historytext:String = ""
        
        if (temp.last == "+" || temp.last == "-" || temp.last == "*" || temp.last == "/" || temp.last == "."){
            temp = String(temp.dropLast())
        }
        
        Historytext = temp
        temp = String(calculator.convert(str: temp))
        
        
        //if the last equals to .0 then only reserve the 0
        if(temp.count >= 3){
            let lastTwo = String(temp.suffix(2))
            if(lastTwo == ".0"){
                temp = String(temp.dropLast(2))
            }
        }
       
       
        
        if(temp == "inf"){
            temp = "0"
        }
        
        
        Historytext = Historytext + "=" + temp
        HistoryLabel.text = Historytext
         
        AnsDisplay.text = temp
    }
    

}

