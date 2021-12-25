//: A UIKit based Playground for presenting user interface//: A UIKit based Playground for presenting user interface
//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import ARKit
import RealityKit

class MyViewController : UIViewController, ARSCNViewDelegate, ARSessionDelegate {
    
    var sceneView = ARSCNView()
    
    override func loadView() {
        setupView()
    }
    
    func setupView() {
        
        self.view = sceneView
        
        // Start the view's AR session with a configuration that uses the rear camera,
        // device position and orientation tracking, and plane detection.
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        configuration.environmentTexturing = .automatic
        sceneView.session.run(configuration)
        
        // Set a delegate to track the number of plane anchors for providing UI feedback.
        sceneView.session.delegate = self
        
        // Show debug UI to view performance metrics (e.g. frames per second).
        sceneView.showsStatistics = true
        sceneView.debugOptions = .showFeaturePoints
        
    }
    
    func createBall(position: SCNVector3) {
        let ballName = ["eight ball", "one ball", "fourteen ball"][Int(arc4random_uniform(3))]
        guard let url = Bundle.main.url(forResource: ballName, withExtension: "usdz") else {
            fatalError()
        }
        let scene = try! SCNScene(url: url, options: [.checkConsistency: true])
        
        let ballNode = scene.rootNode
        ballNode.position = position
        
        sceneView.scene.rootNode.addChildNode(ballNode)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let results = sceneView.hitTest(touch.location(in: sceneView), types: .featurePoint)
        guard let hitFeature = results.last else { return }
        let hitTransform = SCNMatrix4.init(hitFeature.worldTransform) // <- if higher than beta 1, use just this -> hitFeature.worldTransform
        let hitPosition = SCNVector3Make(hitTransform.m41,
                                         hitTransform.m42,
                                         hitTransform.m43)
        
        DispatchQueue.main.async {
            self.createBall(position: hitPosition)
        }
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

