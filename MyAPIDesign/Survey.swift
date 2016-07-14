//
//  Survey.swift
//  MyAPIDesign
//
//  Created by Jeff Norton on 7/14/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import Foundation

class Survey {
    
    // MARK: - Stored Properties
    
    let name: String
    let response: String
    let identifier: NSUUID
    
    private let kName = "naam"
    private let kResponse = "antwoord"
    
    var descriptionString: String {
    
        return "\(kName) = \(name), \(kResponse) = \(response), identifier = \(identifier.UUIDString)"
    
    }
    
    var dictionaryValue: [String : AnyObject] {
        
        return [kName: name, kResponse: response]
        
    }
    
    var jsonData: NSData? {
        
        return try? NSJSONSerialization.dataWithJSONObject(dictionaryValue, options: .PrettyPrinted)
        
    }
    
    var endpoint: NSURL? {
        
        return SurveyController.baseURL?
            .URLByAppendingPathComponent("\(identifier.UUIDString)")
            .URLByAppendingPathExtension("json")
        
    }
    
    // MARK: - Initializer(s)
    
    init(name: String, response: String) {
        
        self.name = name
        self.response = response
        self.identifier = NSUUID()
        
    }
    
    init?(dictionary: [String : AnyObject], identifier: String){
        
        guard let name = dictionary[kName] as? String
            , response = dictionary[kResponse] as? String
            , identifier = NSUUID(UUIDString: identifier)
        else { return nil }
        
        self.name = name
        self.response = response
        self.identifier = identifier
        
    }
    
}