//
//  SurveyViewController.swift
//  MyAPIDesign
//
//  Created by Jeff Norton on 7/14/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {

    // MARK: - Stored Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var responseTextField: UITextField!
    
    // MARK: - Action(s)
    
    @IBAction func submitButtonTapped(sender: UIButton) {
        
        guard let name = nameTextField.text
            , response = responseTextField.text
            where name.characters.count > 0 && response.characters.count > 0
        else { return }
        
        SurveyController.putSurveyIntoAPI(name, response: response)
        
        nameTextField.text = ""
        responseTextField.text = ""
        
    }

}
