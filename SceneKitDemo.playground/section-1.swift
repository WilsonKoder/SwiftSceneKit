// Playground - noun: a place where people can play

import Cocoa
import SceneKit
import QuartzCore   // for the basic animation
import XCPlayground // for the live preview

// create a scene view with an empty scene
var sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
var scene = SCNScene()
sceneView.scene = scene

// start a live preview of that view
XCPShowView("The Scene View", sceneView)

// default lighting
sceneView.autoenablesDefaultLighting = true

// a camera
var camera = SCNCamera()
var cameraNode = SCNNode()
cameraNode.camera = camera
cameraNode.position = SCNVector3(x: 0, y: 0, z: 3)
//cameraNode.rotation = SCNVector4(x: 45, y: 45, z: 0, w: 0)
scene.rootNode.addChildNode(cameraNode)

// a geometry object
var torus = SCNTorus(ringRadius: 1, pipeRadius: 0.35)
var torusNode = SCNNode(geometry: torus)
scene.rootNode.addChildNode(torusNode)

// configure the geometry object
torus.firstMaterial?.diffuse.contents  = NSColor.blueColor()
torus.firstMaterial?.specular.contents = NSColor.whiteColor()


// animate the rotation of the torus
var spin = CABasicAnimation(keyPath: "rotation")
spin.toValue = NSValue(SCNVector4: SCNVector4(x: 1, y: 1, z: 0, w: CGFloat(2.0*M_PI)))
spin.duration = 3
spin.repeatCount = -1 // for infinity
torusNode.addAnimation(spin, forKey: "spin around")
