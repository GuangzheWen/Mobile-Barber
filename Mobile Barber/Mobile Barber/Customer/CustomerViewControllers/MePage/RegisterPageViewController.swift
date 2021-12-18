import UIKit

class RegisterPageViewController: UIViewController {
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailAddressTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var sexTextField: UITextField!
    @IBOutlet var userNamePassword: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var againTextField: UITextField!
    
    @IBOutlet var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkTextFieldIsValid()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editChanged(_ sender: UITextField) {
        checkTextFieldIsValid()
    }
    @IBAction func valueChanged(_ sender: UITextField) {
        checkTextFieldIsValid()
    }
    
    var customer: Customer?
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func checkTextFieldIsValid(){
        let firstName = firstName.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let emailAddress = emailAddressTextField.text ?? ""
        let age = ageTextField.text ?? ""
        let sex = sexTextField.text ?? ""
        let username = userNamePassword.text ?? ""
        let password = passwordTextField.text ?? ""
        let again = againTextField.text ?? ""
        
        registerButton.isEnabled = !firstName.isEmpty && !lastName.isEmpty && !emailAddress.isEmpty && !age.isEmpty && !sex.isEmpty && !username.isEmpty && !password.isEmpty && !again.isEmpty
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "registerDoneID" else { return }
        let firstName = firstName.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let emailAddress = emailAddressTextField.text ?? ""
        let age = ageTextField.text ?? ""
        let sex = sexTextField.text ?? ""
        let username = userNamePassword.text ?? ""
        let password = passwordTextField.text ?? ""
        let again = againTextField.text ?? ""
//        if password == again{
//
//        }
        customer = Customer(firstName: firstName, lastName: lastName, emailAddress: emailAddress, age: age, sex: sex, username: username, password: password)
        
        Customer.saveCustomerToDisk(customer: customer!)
        
        UserDefaults.standard.setValue(true, forKey: "isAccountSet")
    }
}
