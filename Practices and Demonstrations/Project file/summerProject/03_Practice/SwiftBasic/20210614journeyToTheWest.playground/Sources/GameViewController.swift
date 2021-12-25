import Foundation
import UIKit



// 继承了系统提供的父类，位于框架UIKit中framework
// public 其他文件可访问
// controller 可以来控制视图
public class GameViewController : UIViewController {
    // 变量
    // Score yourchoice pcChoice
    // label 存储数组中
    let allCharactors = ["a", "b", "c", "d"]
    
    var myChoices = ["a", "c", "d"]
    var pcChoices = [String]()
    var myChoiceLabels = [UILabel]()
    var pcChoiceLabels = [UILabel]()
    let gameScoreLabel = UILabel()
    var score = 0
    
    
    
    // 这里也要写public
    public override func loadView() {
        // 模板代码
//        let view = UIView()
//        view.backgroundColor = .black
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .white
//
//        view.addSubview(label)
//        self.view = view
        
        // 给电脑pc的选择随机 赋值
        for _ in 0..<myChoices.count {
            pcChoices.append(allCharactors.randomElement()!)
        }
        
        // 设置底层的view
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        self.view = view
        
        // set up gameView
        // 定义了一块 game view 的视图
        let gameView = UIView()
        // 设置圆角为8.0
        gameView.clipsToBounds = true
        gameView.layer.cornerRadius = 8.0
        // 背景颜色
        gameView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        // 将 game view 添加到 主视图中
        self.view.addSubview(gameView)
        
        // 定义了一个图像层
        let imageView = UIImageView()
        imageView.image = UIImage(named: "swift")
        self.view.addSubview(imageView)
        
        // button ui button 不是ui view
        let shuffleButton = UIButton()
        // 无背景颜色
        shuffleButton.backgroundColor = .clear
        // 显示文本 骰子 normal正常状态 disable focus highlight等
        shuffleButton.setTitle("🎲", for: .normal)
        // 属性titleLabel 有个属性 font
        shuffleButton.titleLabel?.font = UIFont.systemFont(ofSize: 60)
        self.view.addSubview(shuffleButton)
        
        //score label
        gameScoreLabel.text = "Score: 0"
        gameScoreLabel.textAlignment = .center
        gameScoreLabel.font = UIFont.systemFont(ofSize: 30)
        gameScoreLabel.textColor = .white
        gameView.addSubview(gameScoreLabel)
        
        for index in 0..<myChoices.count {
            let myChoiceLabel = UILabel()
            setupMyChoiceLabel(for: myChoiceLabel, with: index)
            myChoiceLabels.append(myChoiceLabel)
            gameView.addSubview(myChoiceLabel)
            myChoiceLabel.translatesAutoresizingMaskIntoConstraints = false
        }
        
        for index in 0..<pcChoices.count {
            let pcChoiceLabel = UILabel()
            setupPCChoiceLabel(for: pcChoiceLabel, with: index)
            pcChoiceLabels.append(pcChoiceLabel)
            gameView.addSubview(pcChoiceLabel)
            pcChoiceLabel.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // 关闭自动生成约束 定位
        gameScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        shuffleButton.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        gameView.translatesAutoresizingMaskIntoConstraints = false
        // 手动定位约束
        NSLayoutConstraint.activate([
            // 等于主视图x y中心点坐标
            gameView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),
            // 宽度 高度
            gameView.widthAnchor.constraint(equalToConstant: 300),
            gameView.heightAnchor.constraint(equalToConstant: 460),
            
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            shuffleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shuffleButton.topAnchor.constraint(equalTo: gameView.bottomAnchor, constant: 5),
            shuffleButton.widthAnchor.constraint(equalToConstant: 100),
            shuffleButton.heightAnchor.constraint(equalToConstant: 100),
            
            gameScoreLabel.topAnchor.constraint(equalTo: gameView.topAnchor, constant: 10),
            gameScoreLabel.centerXAnchor.constraint(equalTo: gameView.centerXAnchor),
            gameScoreLabel.heightAnchor.constraint(equalToConstant: 60),
            gameScoreLabel.widthAnchor.constraint(equalToConstant: 200),
        ])
        
        // logo icon 拖拽到resources
        
    }
    
    func setupMyChoiceLabel(for label: UILabel, with index: Int) {
        label.text = myChoices[index]
        label.textColor = .black
    }
}
