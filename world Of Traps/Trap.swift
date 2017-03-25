//
//  File.swift
//  world Of Traps
//
//  Created by Rebecca Cullimore on 6/9/16.
//  Copyright © 2016 Cullimore Family. All rights reserved.
//

import SpriteKit

class Trap: SKSpriteNode{
    var cost = 100
    var ID = String()
    var life = 25.0
    var attackDamage = 0.0
    var selected = false
    var radius = SKShapeNode()
    var energy = 100.0
    var maxEnergy = 100.0
    var energyBar = SKShapeNode()
    var energyPath = UIBezierPath()
    var maxEnergyBar = SKShapeNode()
    var timeSinceLastAttack = Double()
    var healthBar = SKShapeNode()
    var trapPriceLabel = UILabel()
    var maxHealthBar = SKShapeNode()
    var maxSecondsPoisoned = 5.0
    var maxSecondsFrozen = 5.0
    var bounceBackSpaces = 5.0
    var sellAmount = 5.0
    var reloadTime = 1.0
    var healAmount = 1.0
    var energyGenerated = 10.0
//    var trapDescription: String {get{return ""} set{newValue}}
    var trapDescription = String()
    var descriptionLabel = UILabel()
    var upgradeName = "healAmount"
    var upgradeMultiplier = Double()
    var upgradePictures = [SKTexture]()
    var selectedTexture = SKTexture()
    var regularTexture = SKTexture()
    var shouldBeUsed = false
}
