//
//  ViewController.swift
//  DayFinder111
//
//  Created by BOBUR on 20/02/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dayTextField: UITextField!
    
    @IBOutlet weak var monthTextField: UITextField!
    
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var findButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController first Lunch")
    }

    @IBAction func findWeekdayTapped(_ sender: Any) {
        print("FIND!!!")

    let calendar = Calendar.current
            
            var dateComponets = DateComponents()
            
            guard let day = Int(dayTextField.text!), let month = Int(monthTextField.text!), let year = Int(yearTextField.text!) else {
  //Alert
 warningPopup(withTitle: "Input Error!", withMessage: "Date Text Fileds can't be empty.")
       return
     }
            
            
            //dateComponets.day = dayTextField.text
            
                    dateComponets.day = day
                    dateComponets.month = month
                    dateComponets.year = year
            
                    //calendar.date(from: dateComponets
                    guard let date = calendar.date(from: dateComponets) else {return}
            
            //DateFormatter()
            
                    let dateFormatter = DateFormatter()
                    dateFormatter.locale = Locale(identifier: "en_EN")
                    dateFormatter.dateFormat = "EEEE"
            
                    switch findButton.titleLabel?.text {
                    case "Find":
                        findButton.setTitle("Clear", for: .normal)
                        if day >= 1 && day <= 31 && month >= 1 && month <= 12 {
                            let weekday = dateFormatter.string(from: date)
                            let capitalizedWeekday = weekday.capitalized
                            //resultLabel.text = result
                            resultLabel.text = capitalizedWeekday
                        }
                        else{
                            //alert
                            warningPopup(withTitle: "Input Error!", withMessage: "Please Enter Correct Date")
                        }
                                default:
                                    findButton.setTitle("Find", for: .normal)
                                    
                                }
                            
                        }
        func clearAllTextFields(){
                dayTextField.text = ""
                monthTextField.text = ""
                yearTextField.text = ""
                resultLabel.text = "Day of the week, inside your finder"
            }
            
            override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                self.view.endEditing(true)
            }
        
            func warningPopup(withTitle title: String?, withMessage message: String?){
                DispatchQueue.main.async {
                    let popUp = UIAlertController(title: title, message: message, preferredStyle: .alert)
                    let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
                    popUp.addAction(okButton)
        
                    self.present(popUp, animated: true, completion: nil)
                }
            }//warningPopup
    }



    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dayFinder"{
        // Get the new view controller using segue.destination.
       let vc = segue.destination as! AppInfoViewController
        // Pass the selected object to the new view controller.
           vc.infoText = "DayFinder helps to find exact weekday for given date."
        }
    }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

