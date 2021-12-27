import UIKit
import SafariServices
// Welcome page View Controller
class WelcomePageViewController: UIViewController {

    // page indicator 分页 页面指示器，点状
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authorizingNotification()
        authorizingPhotoLibrary(vc: self)
        authorizingLocation()
    }
}

extension WelcomePageViewController: UIScrollViewDelegate {
    // scrollview , once move do ... 滚动视图 开始滚动
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // count content view offset location, and configure page indicator 计算页面位置，赋值给页面指示器
        let pageIndex = round(scrollView.contentOffset.x / view.bounds.width)
        pageControl.currentPage = Int(pageIndex)
        
        // at last page, swipe to get in main page slowly 最后一页进入首页，缓慢
        if scrollView.contentOffset.x > (view.bounds.width * 2 + 20) {
            // let homeVC equals to configured initial page 设置成选择页
            let homeVC = storyboard!.instantiateInitialViewController()!
            // configure display mode as full screen 显示模式 全屏幕
            homeVC.modalPresentationStyle = .fullScreen
            present(homeVC, animated: true, completion: nil)
        }
    }
}
