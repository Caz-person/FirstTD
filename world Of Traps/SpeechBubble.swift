//
//  SpeechBubble.swift
//  world Of Traps
//
//  Created by Rebecca Cullimore on 8/31/16.
//  Copyright © 2016 Cullimore Family. All rights reserved.
//

import SpriteKit

struct SpeechBubble {
    let direction: Direction
    var speechBubble: SKSpriteNode?
    var textLabel = UILabel()
    enum Direction {
        case left
        case right
    }
    init (arrowDirection: Direction, Text: String) {
        direction = arrowDirection
        if arrowDirection == Direction.left {
            speechBubble = SKSpriteNode(imageNamed: "speechBubbleArrowLeft")
        }else {
            speechBubble = SKSpriteNode(imageNamed: "speechBubbleArrowRight")
        }
        textLabel.text = Text
    }
    
    func load(scene: SKScene, position: CGPoint, size: CGSize) {
        if speechBubble != nil {
            speechBubble?.zPosition = 10000
            speechBubble?.position = position
            speechBubble?.size = size
            scene.addChild(speechBubble!)
            textLabel.center = CGPoint(x: position.x - size.width/6, y: scene.frame.height - position.y - size.height/2)
            textLabel.frame = CGRect(origin: textLabel.center, size: CGSize(width: size.width * 2 / 3, height: size.height))
            textLabel.numberOfLines = 0
            textLabel.adjustsFontSizeToFitWidth = true
            scene.view?.addSubview(textLabel)
        }
        if direction == Direction.right {
            textLabel.center.x -= size.width / 3
        }
    }
}
