import UIKit

// 欢迎页面 视图控制器
class WelcomePageViewController: UIViewController {

    // 分页 页面指示器，点状
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension WelcomePageViewController: UIScrollViewDelegate {
    // 滚动视图 开始滚动
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 计算页面位置，赋值给页面指示器
        let pageIndex = round(scrollView.contentOffset.x / view.bounds.width)
        pageControl.currentPage = Int(pageIndex)
        
        // 最后一页进入首页，缓慢
        if scrollView.contentOffset.x > (view.bounds.width * 2 + 20) {
            // homeVC 设置成选择页
            let homeVC = storyboard!.instantiateInitialViewController()!
            // 显示模式 全屏幕
            homeVC.modalPresentationStyle = .fullScreen
            present(homeVC, animated: true, completion: nil)
        }
    }
}
