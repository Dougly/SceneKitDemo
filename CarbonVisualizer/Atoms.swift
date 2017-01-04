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

import Foundation
import SceneKit

class Atoms {
    
    class func createAtom(radius: CGFloat, color: UIColor) -> SCNGeometry {
        let atom = SCNSphere(radius: radius)
        atom.firstMaterial!.diffuse.contents = color
        atom.firstMaterial!.specular.contents = UIColor.white
        return atom

    }
    
    class func allAtoms() -> SCNNode {
        let atomsNode = SCNNode()
        
        let carbonNode = SCNNode(geometry: createAtom(radius: 1.72, color: .darkGray))
        carbonNode.position = SCNVector3Make(-6, 0 , 0)
        atomsNode.addChildNode(carbonNode)
        
        let oxygenNode = SCNNode(geometry: createAtom(radius: 1.52, color: .red))
        oxygenNode.position = SCNVector3Make(2, 0 , 0)
        atomsNode.addChildNode(oxygenNode)
        
        let hydorgenNode = SCNNode(geometry: createAtom(radius: 1.20, color: .lightGray))
        hydorgenNode.position = SCNVector3Make(-2, 0 , 0)
        atomsNode.addChildNode(hydorgenNode)
        
        let fluorineNode = SCNNode(geometry: createAtom(radius: 1.47, color: .yellow))
        fluorineNode.position = SCNVector3Make(6, 0 , 0)
        atomsNode.addChildNode(fluorineNode)
        
        return atomsNode
    }
    
    
}

//carbon, 1.70, darkGrey
//oxygen 1.52, red 
//hydrogen 1.20 lightgGrey
//fluorineAtom 1.47 yellow
