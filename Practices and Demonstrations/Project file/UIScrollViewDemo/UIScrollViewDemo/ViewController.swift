//
//  ViewController.swift
//  UIScrollViewDemo
//
//  Created by Wayne on 2021/8/23.
//

import UIKit

class ViewController: UIViewController {
    private var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let width = view.bounds.width
        let height: CGFloat = 300
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 100, width: width, height: height))
        scrollView.contentSize = CGSize(width: width * 2, height: height)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        
        view.addSubview(scrollView)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height))
        label.backgroundColor = .gray
        label.textAlignment = .center
        label.text = "1"
        scrollView.addSubview(label)
        
        let label2 = UILabel(frame: CGRect(x: width, y: 0, width: width, height: height))
        label2.backgroundColor = .orange
        label2.textAlignment = .center
        label2.text = "2"
        scrollView.addSubview(label2)
        
        let button = UIButton(frame: CGRect(x: 0, y: scrollView.frame.maxY + 50, width: width, height: height))
        button.backgroundColor = .blue
        button.setTitle("Move", for: .normal)
        button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        view.addSubview(button)
        
        
    }
    @objc private func clickButton() {
        let width = view.bounds.width
        if scrollView.contentOffset.x < width * 0.5 {
            scrollView.setContentOffset(CGPoint(x: width, y: 0), animated: true)
        } else {
            scrollView.setContentOffset(.zero, animated: true)
        }
    }


}

extension ViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("\(scrollView.contentOffset)")
//    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("123")
    }
}
