//
//  ViewController.swift
//  weatherApp
//
//  Created by Kaan Özcan on 14.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var vtn: UIButton!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var error: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vtn.layer.cornerRadius = 6
        
        error.text = ""
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func findButton(_ sender: Any) {
        let city = textField.text ?? ""
        
        if city.isEmpty{
            //error.text = "Bu alan boş bırakılamaz!"
            let alert = UIAlertController(title: "UYARI!", message: "Lütfen Şehir Giriniz!", preferredStyle: .alert)
            
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel , handler: nil)
            
            alert.addAction(cancelButton)
            self.present(alert, animated: true, completion: nil)
            
        }else{
            let viewc = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
            
            viewc.city = city
            
            self.show(viewc, sender: nil)
            
            
        }
        
    }
    
}

