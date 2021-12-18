import UIKit

class LoginPageViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    //    var loginState: Bool?
//
//    init?(coder: NSCoder, loginState: Bool?) {
//        self.loginState = loginState
//        super.init(coder: coder)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    
    var customer: Customer?
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let loginState = loginState,
//        loginState == true
//        {
//            performSegue(withIdentifier: "toAccountPage", sender: nil)
//        }
        customer = Customer.loadCustomerFromDisk()
        if let customer = customer,
           UserDefaults.standard.bool(forKey: "isAccountSet") == true
        {
            usernameTextField.text = customer.username
            passwordTextField.text = customer.password
        }

        // Do any additional setup after loading the view.
        checkTextFieldValidation()
        
        print( UserDefaults.standard.bool(forKey: "isAccountSet") )
            
        
   
    }
    
    @IBAction func inputChanged(_ sender: UITextField) {
        checkTextFieldValidation()
    }
    
    @IBAction func valueChanged(_ sender: UITextField) {
        checkTextFieldValidation()
    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
        checkTextFieldValidation()
    }
    
    
    @IBAction func unwindToLoginPage(segue: UIStoryboardSegue) {
        
    }
    
    
    @IBSegueAction func toAccountPage(_ coder: NSCoder, sender: Any?) -> UIViewController? {
        
        return UIViewController(coder: coder)
    }
    
    
    func checkTextFieldValidation() {
        var buttonState = false
        let usernameText = usernameTextField.text ?? ""
        let passwordText = passwordTextField.text ?? ""
        buttonState = !usernameText.isEmpty && !passwordText.isEmpty
        loginButton.isEnabled = buttonState
        navigationItem.rightBarButtonItem?.isEnabled = buttonState
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "cancelButtonID" else { return }
        UserDefaults.standard.setValue(false, forKey: "isAccountSet")
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
