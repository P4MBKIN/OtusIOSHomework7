//
//  Extensions.swift
//  HomeWork7
//
//  Created by Pavel Antonov on 13.02.2020.
//  Copyright © 2020 OtusCourse. All rights reserved.
//

import Foundation

let ALLOWED_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzАБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюя "

extension String {
    
    func isValidPhone() -> Bool
    {
        if self.isEmpty { return false }
        let phoneRegex = "^((\\+)|(00))[0-9]{6,14}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: self)
    }
    
    func isValidEmail() -> Bool
    {
        if self.isEmpty { return true }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
    
    func isValidName() -> Bool
    {
        if self.isEmpty { return false }
        let allowed = CharacterSet(charactersIn: ALLOWED_CHARACTERS)
        let exceptions = CharacterSet(charactersIn: "():;@\"%&+№")
        if (self.rangeOfCharacter(from: exceptions) != nil) || (self.rangeOfCharacter(from: allowed.inverted) != nil) {
            return false
        }
        return true
    }
    
    ///yyyy-mm-dd
    func isValidBirthDate() -> Bool
    {
        if self.isEmpty { return false }
        let dateRegex = "^(19|20)\\d\\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$"
        return NSPredicate(format: "SELF MATCHES %@", dateRegex).evaluate(with: self)
    }
    
    func isValidPassword() -> Bool
    {
        if self.isEmpty { return true }
        let regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\[\\]\\(\\)~!@#$%^&*-_.+='?,:;<>№|`{}\"\\/])[A-Za-z\\d\\[\\]\\(\\)~!@#$%^&*-_.+='?,:;<>№|`{}\"\\/]{6,40}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
}
