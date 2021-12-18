
import UIKit


class IdentityChoosingViewController: UIViewController {

    // 身份选择 开则是barber 关则是customer
    @IBOutlet var identityIsBarberChoosingSwitch: UISwitch!
    @IBOutlet var identityIsCustomerChoosingSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 默认设置为关闭
//        identityIsBarberChoosingSwitch.isOn = false
//        identityIsCustomerChoosingSwitch.isOn = false
        
    }
    
//    提交按钮
    @IBAction func enterButtonTapped(_ sender: UIButton) {
        // 用于即将显示的主页
        var homeVC: UIViewController
        if identityIsBarberChoosingSwitch.isOn {
            // 设置key 以后进入记忆选择barber身份
            UserDefaults.standard.setValue(true, forKey: "isBarber")
            // 此次进入，barber页面
            homeVC = storyboard!.instantiateViewController(identifier: "BarberSideVCID")
        } else if identityIsCustomerChoosingSwitch.isOn {
            // 记忆customer身份
            UserDefaults.standard.setValue(true, forKey: "isCustomer")
            // 此次进入customer 页面
            homeVC = storyboard!.instantiateViewController(identifier: "CustomerSideVCID")
        } else {
            return
        }
        
        // 设置内容页显示模式 全屏幕
        homeVC.modalPresentationStyle = .fullScreen
        // 展示
        present(homeVC, animated: true, completion: nil)
    }
    
    // 拮抗两个按钮
    @IBAction func isBarberSwitchChosen(_ sender: UISwitch) {
        identityIsCustomerChoosingSwitch.isOn = !identityIsBarberChoosingSwitch.isOn
    }
    
    @IBAction func isCustomerSwitchChosen(_ sender: UISwitch) {
        identityIsBarberChoosingSwitch.isOn = !identityIsCustomerChoosingSwitch.isOn
    }
}
