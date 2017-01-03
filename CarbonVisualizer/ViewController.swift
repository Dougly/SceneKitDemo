/*
* Copyright (c) 2014 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit
import SceneKit

class ViewController: UIViewController {
  // UI
  @IBOutlet weak var geometryLabel: UILabel!
  @IBOutlet weak var sceneView: SCNView!
  
  // MARK: Lifecycle
  override func viewDidLoad() {
      super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    sceneSetup()
  }
  
  // MARK: IBActions
  @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
  }
  
  // MARK: Style
  override var preferredStatusBarStyle : UIStatusBarStyle {
    return UIStatusBarStyle.lightContent
  }
  
  // MARK: Transition
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    sceneView.stop(nil)
    sceneView.play(nil)
  }
    
    func sceneSetup() {
        let scene = SCNScene()
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLight.LightType.ambient
        ambientLightNode.light!.color = UIColor(white: 0.67, alpha: 1.0)
        scene.rootNode.addChildNode(ambientLightNode)
        
        let omniLightNode = SCNNode()
        omniLightNode.light = SCNLight()
        omniLightNode.light!.type = SCNLight.LightType.omni
        omniLightNode.light!.color = UIColor(white: 0.75, alpha: 1.0)
        omniLightNode.position = SCNVector3Make(0, 50, 50)
        scene.rootNode.addChildNode(omniLightNode)
        
        
        let boxGemoetry = SCNBox(width: 10.0, height: 10.0, length: 10.0, chamferRadius: 1.0)
        let boxNode = SCNNode(geometry: boxGemoetry)
        scene.rootNode.addChildNode(boxNode)
        
        sceneView.scene = scene
        sceneView.allowsCameraControl = true
    }
}
