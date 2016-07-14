//
//  SurveyController.swift
//  MyAPIDesign
//
//  Created by Jeff Norton on 7/14/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import Foundation

class SurveyController {
    
    // MARK: - Stored Properties
    
    static let baseURL = NSURL(string: "https://jeffnortonapidesign.firebaseio.com/api/v1/")
    
    static let getterEndpoint = baseURL?.URLByAppendingPathExtension("json")
    
    weak var delegate: SurveyDelegate?
    
    var surveys: [Survey] {
        
        didSet{
            self.delegate?.surveysUpdated(surveys)
        }
        
    }
    
    // MARK: - Initializer(s)
    
    init() {
        
        self.surveys = []
        
        // TODO: fetch call
        
    }
    
    // MARK: - Methods
    
    static func putSurveyIntoAPI(name: String, response: String) {
        
        let survey = Survey(name: name, response: response)
        
        guard let unwrappedURL = survey.endpoint else { return }
        
        NetworkController.performRequestForURL(unwrappedURL, httpMethod: .Put, body: survey.jsonData) { (data, error) in
            
            let responseDataString = NSString(data: data!, encoding: NSUTF8StringEncoding) ?? ""
            
            if error != nil {
                
                print("Error (in instance): \(error?.localizedDescription)")
                
            } else if responseDataString.containsString("error") {
                
                print("Error (in message): \(responseDataString)")
                
            } else {
                
                print("Saved survey successfully")
                
            }
        }
    }
    
}

protocol SurveyDelegate: class {
    func surveysUpdated(surveys: [Survey])
}