//
//  LevelSelectionScene.swift
//  world Of Traps
//
//  Created by Rebecca Cullimore on 6/21/16.
//  Copyright © 2016 Cullimore Family. All rights reserved.
//

import Foundation
import SpriteKit
class LevelSelectionScene: SKScene {
//    var pan = UIPanGestureRecognizer()
    var scrollView = UIScrollView()
    let batterySideBarTrap = Trap(imageNamed: "battery")
    override func didMove(to view: SKView) {
        batterySideBarTrap.position = CGPoint(x: 100, y: 100)
        batterySideBarTrap.size = CGSize(width: 100, height: 100)
        addChild(batterySideBarTrap)
        scrollView.isScrollEnabled = true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let panMovement = UIPanGestureRecognizer().translationInView()
            
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
}
