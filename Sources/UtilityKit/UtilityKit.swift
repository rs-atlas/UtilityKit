import Foundation

extension String {
    public enum checktype {
        case english
        case number
        case count
        case none
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,20}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func contains(_ type: checktype = .none) -> Bool{
        var regex = #"^(?=.*[0-9])(?=.*[a-zA-z])([a-zA-Z0-9,<.>/?;:’“\[{\]}`~!@#$%^&*()-_=+]{8,20})$"#
        let passwordtesting = NSPredicate(format: "SELF MATCHES %@", regex)
        if  !passwordtesting.evaluate(with: self){
            switch type {
            case .english:
                regex = #"^(?=.*[a-zA-Z])([a-zA-Z0-9,<.>/?;:’“\[{\]}`~!@#$%^&*()-_=+]{0,})$"#
            case .number:
                regex = #"^(?=.*[0-9])([a-zA-Z0-9,<.>/?;:’“\[{\]}`~!@#$%^&*()-_=+]{0,})$"#
            case .count:
                return self.count >= 8
            default:
                break
            }
            let passwordtesting = NSPredicate(format: "SELF MATCHES %@", regex)
            return passwordtesting.evaluate(with: self)
        }else{
            return passwordtesting.evaluate(with: self)
        }
    }
}
