//
//  Enemy.swift
//  world Of Traps
//
//  Created by Rebecca Cullimore on 6/7/16.
//  Copyright © 2016 Cullimore Family. All rights reserved.
//

import SpriteKit

class Enemy: SKSpriteNode {
    var life = 10.0
    var maxLife = 10.0
    var duration = 1.0
    var poisoned = false
    var secondsPoisoned = 0
    var maxSecondsPoisoned = 5
    var maxSecondsFrozen = 5
    var healthBar = SKShapeNode()
    var maxHealthBar = SKShapeNode()
    
    var frozen = false
    var secondsFrozen = 0
}
