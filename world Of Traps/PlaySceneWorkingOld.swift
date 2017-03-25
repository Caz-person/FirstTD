//
//  GameScene.swift
//  world Of Traps
//
//  Created by Rebecca Cullimore on 5/30/16.
//  Copyright (c) 2016 Cullimore Family. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import Foundation

class PlaySceneOld: SKScene {
    let waterWheelSideBarTrap = Trap(imageNamed: "waterWheel")
    let waterWheelSideBarTrapSelectedPic = Trap(imageNamed: "waterWheelSelected")
    let reverseSideBarTrap = Trap(imageNamed: "reverseTrap")
    let reverseSideBarTrapSelectedPic = Trap(imageNamed: "reverseTrapSelected")
    let freezeSideBarTrap = Trap(imageNamed: "freezeTrap")
    let freezeSideBarTrapSelectedPic = Trap(imageNamed: "freezeTrapSelected")
    let powerPlantSideBarTrap = Trap (imageNamed: "powerPlant")
    let powerPlantSideBarTrapSelectedPic = Trap(imageNamed: "powerPlantSelected")
    let trapSideBar = Trap(imageNamed: "trapSideBar")
    let trapDestroyingHammer = Trap(imageNamed: "hammer")
    let trapDestroyingHammerSelectedPic = Trap(imageNamed: "hammerSelected")
    let poisonSideBarTrap = Trap(imageNamed: "poisonTrap")
    let poisonSideBarTrapSelectedPic = Trap(imageNamed: "poisonTrapSelected")
    let windTurbineSideBarTrap = Trap(imageNamed: "windTurbine")
    let windTurbineSideBarTrapSelectedPic = Trap(imageNamed: "windTurbineSelected")
    let hospitalSideBarTrap = Trap(imageNamed: "hospital")
    let hospitalSideBarTrapSelectedPic = Trap(imageNamed: "hospitalSelected")
    var basicSideBarTrap = Trap(imageNamed: "basicTrap")
    let basicSideBarTrapSelectedPic = Trap(imageNamed: "basicTrapSelected")
    let batterySideBarTrap = Trap(imageNamed: "battery")
    let batterySideBarTrapSelectedPic = Trap(imageNamed: "batterySelected")
    let wireSideBarTrap = Trap(imageNamed: "wire")
    let wireSideBarTrapSelectedPic = Trap(imageNamed: "wireSelected")

    
//    let maps = [Map().mapOne(), Map().mapTwo(), Map().mapThree()]
    var stuffToRemove = [UILabel]()
    var didWin = false
    var map = Map().mapOne()
//    var mapName = GameScene().lastLevel
    var hospitalRepairArea = [SKShapeNode]()
    var healingTraps = [Trap]()
    var trapSize: CGFloat = 0.0
    var gameGrid = GKGridGraph()
    var gridStart = CGPoint()
    var gridNodes = SKNode()
    var spacing = CGFloat()
    var pathPositions = [CGPoint]()
    var waterPositions = [CGPoint]()
    var money = 500
    var time = 0
    var lastTimeCalled = Double()
    var enemies = [Enemy]()
//    var enemyPath = SKShapeNode()
    var enemyGrid = GKGridGraph()
    var startedWave = false
    var runningWave = false
    var traps = [Trap]()
    var basicTrapPositions = [CGPoint]()
    var enemyHealth: NSMutableDictionary = [:]
    var moneyLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    var enemiesThatCanGoesThroughBeforeLosing = 5
    var hospitals = [Trap]()
    var connectedItems = [[Trap]]()
    var timesRan = 1
    
    var numberOfWaves = 0.0
    var isSameWave = false
    var aTrapHasItsUpgradesShown = false
    var upgradeCircles = [SKShapeNode(), SKSpriteNode()]
//    var enemyPath = [GKGridGraphNode()]
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor.brown
        trapSideBar.size = CGSize(width: trapSideBar.size.width / trapSideBar.size.height * frame.size.height, height: frame.size.height)
        trapSideBar.position = CGPoint(x: self.frame.minX + trapSideBar.size.width/2, y: self.frame.midY)
        trapSideBar.zPosition = -1
            
        trapSize = self.frame.maxY * 0.075
    
        spacing  = (trapSize * 1.25)
        self.addChild(trapSideBar)
        
//        maps = ["mapOne", "mapTwo", "mapThree"]
        
//        basicSideBarTrap.size = CGSize(width: trapSize,height: trapSize)
//        basicSideBarTrap.position = CGPoint(x: firstColumn, y: firstColumn)
//        basicSideBarTrap.zPosition = 1
//        addChild(basicSideBarTrap)
//        
//        basicSideBarTrapSelectedPic.size = CGSize(width: trapSize,height: trapSize)
//        basicSideBarTrapSelectedPic.position = CGPoint(x: firstColumn, y: firstColumn)
//        basicSideBarTrapSelectedPic.zPosition = 2
//        
//        batterySideBarTrap.size = CGSize(width: trapSize,height: trapSize)
//        batterySideBarTrap.position = CGPoint(x: firstColumn, y: firstColumn + spacing)
//        batterySideBarTrap.zPosition = 2
//        self.addChild(batterySideBarTrap)
//        
//        batterySideBarTrapSelectedPic.size = CGSize(width: trapSize,height: trapSize)
//        batterySideBarTrapSelectedPic.position = CGPoint(x: firstColumn, y: firstColumn + spacing)
//        batterySideBarTrapSelectedPic.zPosition = 2
//        
//        wireSideBarTrap.size = CGSize(width: trapSize,height: trapSize)
//        wireSideBarTrap.position = CGPoint(x: firstColumn, y: firstColumn + spacing * 2)
//        wireSideBarTrap.zPosition = 2
//        self.addChild(wireSideBarTrap)
//        
//        wireSideBarTrapSelectedPic.size = CGSize(width: trapSize,height: trapSize)
//        wireSideBarTrapSelectedPic.position = CGPoint(x: firstColumn, y: firstColumn + spacing * 2)
//        wireSideBarTrapSelectedPic.zPosition = 2
//        
//        hospitalSideBarTrap.size = CGSize(width: trapSize,height: trapSize)
//        hospitalSideBarTrap.position = CGPoint(x: firstColumn, y: firstColumn + spacing * 3)
//        hospitalSideBarTrap.zPosition = 2
//        self.addChild(hospitalSideBarTrap)
//        
//        hospitalSideBarTrapSelectedPic.size = CGSize(width: trapSize,height: trapSize)
//        hospitalSideBarTrapSelectedPic.position = CGPoint(x: firstColumn, y: firstColumn + spacing * 3)
//        hospitalSideBarTrapSelectedPic.zPosition = 2
//        
//        
//        windTurbineSideBarTrap.size = CGSize(width: trapSize, height: trapSize)
//        windTurbineSideBarTrap.position = CGPoint(x:firstColumn, y: firstColumn + spacing * 4)
//        windTurbineSideBarTrap.zPosition = 2
//        addChild(windTurbineSideBarTrap)
//        
//        windTurbineSideBarTrapSelectedPic.size = windTurbineSideBarTrap.size
//        windTurbineSideBarTrapSelectedPic.position = windTurbineSideBarTrap.position
//        windTurbineSideBarTrapSelectedPic.zPosition = 2
        
        initTrap(basicSideBarTrap, selectedTrap: basicSideBarTrapSelectedPic, spacesVertical: 0, spacesHorizontal: 0, cost: "100")
        addChild(basicSideBarTrap)
        
        initTrap(batterySideBarTrap, selectedTrap: batterySideBarTrapSelectedPic, spacesVertical: 1, spacesHorizontal: 0 , cost: "75")
        addChild(batterySideBarTrap)
        
        initTrap(wireSideBarTrap, selectedTrap: wireSideBarTrapSelectedPic, spacesVertical: 2, spacesHorizontal: 0 , cost: "25")
        addChild(wireSideBarTrap)
        
        initTrap(hospitalSideBarTrap, selectedTrap: hospitalSideBarTrapSelectedPic, spacesVertical: 3, spacesHorizontal: 0 , cost: "150")
        addChild(hospitalSideBarTrap)
        
        initTrap(windTurbineSideBarTrap, selectedTrap: windTurbineSideBarTrapSelectedPic, spacesVertical: 4, spacesHorizontal: 0 , cost: "50")
        addChild(windTurbineSideBarTrap)
        
        initTrap(poisonSideBarTrap, selectedTrap: poisonSideBarTrapSelectedPic, spacesVertical: 5, spacesHorizontal: 0 , cost: "250")
        addChild(poisonSideBarTrap)
        
        initTrap(trapDestroyingHammer, selectedTrap: trapDestroyingHammerSelectedPic, spacesVertical: 8, spacesHorizontal: 0 , cost: "sell")
        addChild(trapDestroyingHammer)
        
        initTrap(powerPlantSideBarTrap, selectedTrap: powerPlantSideBarTrapSelectedPic, spacesVertical: 6, spacesHorizontal: 0 , cost: "1000")
        addChild(powerPlantSideBarTrap)
        
        initTrap(freezeSideBarTrap, selectedTrap: freezeSideBarTrapSelectedPic, spacesVertical: 7, spacesHorizontal: 0 , cost: "150")
        addChild(freezeSideBarTrap)
        
        initTrap(reverseSideBarTrap, selectedTrap: reverseSideBarTrapSelectedPic, spacesVertical: 0, spacesHorizontal:   2, cost: "300")
        addChild(reverseSideBarTrap)
        
        initTrap(waterWheelSideBarTrap, selectedTrap: waterWheelSideBarTrapSelectedPic, spacesVertical: 1, spacesHorizontal: 2, cost: "150")
        addChild(waterWheelSideBarTrap)
        
        moneyLabel.textAlignment = NSTextAlignment.right
        self.view!.addSubview(moneyLabel)
        moneyLabel.center = CGPoint(x: (self.frame.maxX - moneyLabel.bounds.width/2) - 5 ,y: moneyLabel.bounds.height/2)
        moneyLabel.text = "Money: \(money)"
        stuffToRemove.append(moneyLabel)
        
        let extraTrap = Trap()
        extraTrap.position = CGPoint(x: -100, y: -100)
        extraTrap.size = CGSize(width: trapSize, height: trapSize)
        traps.append(extraTrap)

        gameGrid = GKGridGraph(fromGridStartingAt: int2(0, 0), width: Int32(19), height: Int32(13), diagonalsAllowed: false)
//            GKGridGraph(fromGridStartingAt: int2(0, 0), width: Int32(CGRectGetMaxX(self.frame)), height: Int32(CGRectGetMaxY(self.frame)), diagonalsAllowed: false)
//        enemyGrid = GKGridGraph(fromGridStartingAt: int2(0, 0), width: Int32(CGRectGetMaxX(self.frame)), height: Int32(CGRectGetMaxY(self.frame)), diagonalsAllowed: false)
//        enemyGrid = GKGridGraph(nodes: [])
        enemyGrid = GKGridGraph(fromGridStartingAt: int2(0, 0), width: Int32(19), height: Int32(13), diagonalsAllowed: false)

        gridStart = CGPoint(x: self.frame.minX+(self.frame.height - 19 * trapSize), y: self.frame.minY+(self.frame.height - 13 * trapSize))
        gridNodes.position = CGPoint(x: trapSideBar.size.width, y: 0)
        gridStart = gridNodes.position
//        print(gridNodes.position)
        for row in 0 ..< 13 {
            for col in 0 ..< 19 {
                let path = UIBezierPath(rect: CGRect(x: trapSize * CGFloat(col), y: trapSize * CGFloat(row), width: trapSize, height: trapSize))
                let box = SKShapeNode(path: path.cgPath)
                box.strokeColor = UIColor.black
                box.lineWidth = 1
                path.stroke()
                gridNodes.addChild(box)
                
                
            }
        }
        addChild(gridNodes)
//        make map
        for row in 0 ..< 13 {
            for col in 0 ..< 19 {
                let mapPath = map.template[row][col]
                let Path = SKSpriteNode(imageNamed: "path")
                Path.size = CGSize(width: trapSize, height: trapSize)
                Path.position = CGPoint(x: CGFloat(col) * trapSize + trapSideBar.size.width + trapSize/2, y: CGFloat(row) * trapSize + trapSize/2)
                if mapPath == "water" {
                let water = SKSpriteNode()
                water.size = Path.size
                water.position = Path.position
                water.color = UIColor.blue
                water.zPosition = -1
                addChild(water)
                waterPositions.append(CGPoint(x: Int(water.position.x), y: Int(water.position.y)))
                } else if mapPath == "path"{
                    
//                    print(Path.position)
//                    print("_________")
                    Path.zPosition = -1
                    self.addChild(Path)
                    pathPositions.append(CGPoint(x: Int(Path.position.x), y: Int(Path.position.y)))
                } else {
//                    var obstacle = GKPolygonObstacle()
//                    enemyGrid.addNodes([gameGrid.nodeAtGridPosition(coordinateForPoint((Path.position)))!])
//                    enemyGrid.addObstacles([obstacle])
                    enemyGrid.remove([enemyGrid.node(atGridPosition: coordinateForPoint((Path.position)))!])
                    
                    
//                    obstacle.dynamicType.init(points: enemyGrid.nodeAtGridPosition(coordinateForPoint((Path.position)))!/*, UnsafeMutablePointer<vector_float2>*/, count: 3)
                    
                }
            }
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       /* Called when a touch begins */
        
//        for touch in touches {
//            let location = touch.location(in: self)
//            if self.atPoint(location) != trapSideBar {
//                if let trapNode = gameGrid.node(atGridPosition: coordinateForPoint(location)) {
//                    let trapPosition = CGPoint(x: CGFloat(Int(CGFloat(trapNode.gridPosition.x) * trapSize + trapSideBar.size.width + trapSize/2)), y: CGFloat(Int(CGFloat(trapNode.gridPosition.y) * trapSize + trapSize/2)))
////                    let trapPosition = pointForCoordinate(coordinateForPoint(location))
//                    
//                    var trapPositions = [CGPoint]()
//                    if aTrapHasItsUpgradesShown {
//                        if upgradeCircles[0].position != trapPosition {
//                            if upgradeCircles[1].position != trapPosition{
//                                let position = upgradeCircles[1].position
//                            
//                                for circle in upgradeCircles {
//                                    circle.removeFromParent()
//                                }
////                              upgradeCircles[0].removeFromParent()
////                              upgradeCircles[1].removeFromParent()
//                                upgradeCircles.removeAll()
//                                aTrapHasItsUpgradesShown = false
//                        }else {
////                                find out what trap is being upgraded
//                                for trap in traps {
//                                    if trap.position == CGPoint(x: trapPosition.x, y: trapPosition.y - /*round(*/trapSize * 2/*)*/) {
//                                        if pathPositions.contains(trap.position) {
//                                            
//                                        let upgradeCost = Int(trap.attackDamage * 4 + 50)
//                                        if money - upgradeCost >= 0{
////                                            if trap.ID == "basicTrap" {
//                                                trap.attackDamage += trap.attackDamage / 4
//                                                print(trap.attackDamage)
//                                                print(upgradeCost)
////                                                }else if trap.ID == "poisonTrap" {
////                                                    trap.maxSecondsPoisoned += 2
////                                            }
//                                            money -= upgradeCost
//                                            moneyLabel.text = "Money: \(money)"
//                                            }
//                                        }else {
//                                            let upgrade = trap.upgradeName
//                                            let upgradeValue = trap.value(forKey: upgrade)
//                                            print(trap.healAmount)
//                                            trap.setValue(upgradeValue as! Double + 1, forKey: upgrade)
//                                            print(trap.healAmount)
//                                            if trap.ID == "hospital" {
//                                            
//                                            }
//                                        }
//                                    }
//                                }
//                                break
//                            }
//                        }
//                    } else {
//                    for trap in traps { trapPositions.append(trap.position)}
//                    if trapPositions.contains(trapPosition) {
//                        addUpgradeBars(trapPosition)
//                    }
////                    if /*basicSideBarTrapSelected == true*/ basicSideBarTrap.selected == true {
////                        let basicTrap = Trap(imageNamed: "basicTrap")
////                        basicTrap.size = CGSize(width: trapSize, height: trapSize)
//////                        basicTrap.position = pointForCoordinate(trapNode.gridPosition)
////                        basicTrap.position = trapPosition
////                        basicTrap.zPosition = 2
////                            if pathPositions.contains(basicTrap.position) && money >= 100 {
////                                var trapPositions = [CGPoint]()
////                                for trap in traps { trapPositions.append(trap.position)}
////                                    if trapPositions.contains(basicTrap.position) == false {
//////                                gameGrid.removeNodes([trapNode])
////                                money -= 100
////                                moneyLabel.text = "Money: \(money)"
////                                self.addChild(basicTrap)
////                                traps.append(basicTrap)
////                                print("made a basic trap")
////                                break
////                                    
////                                }
////                            }
////                        
////                        print("__")
////                    }
//                    let basicTrap = createTrap(basicSideBarTrap, trapID: "basicTrap", positionOfTrap: trapPosition, canBeOnPath: true,cost: 100, attackDamage: 4)
//                    basicTrap.trap.energy = 0
//                    basicTrap.trap.maxEnergy = 0
////                    if basicTrap.madeTrap {
////                        for area in hospitalRepairArea {
////                            if area.containsPoint(trapPosition) {
////                                healingTraps.append(basicTrap.trap)
////                                break
////                            }
////                        }
////                    }
//                                //                                gameGrid.removeNodes([trapNode])
//                    
////                                print("made a basic trap")
//                    
////                    if batterySideBarTrap.selected == true{
////                        let battery = SKSpriteNode(imageNamed: "battery")
////                        battery.size = CGSize(width: trapSize, height: trapSize)
////                        //                        basicTrap.position = pointForCoordinate(trapNode.gridPosition)
////                        battery.position = trapPosition
////                        battery.zPosition = 2
////                            if pathPositions.contains(battery.position) == false {
////                                self.addChild(battery)
////                                print("battery")
////                            }
////                        
////                        print("___")
////                    }
////                    if wireSideBarTrap.selected == true{
////                        let wire = SKSpriteNode(imageNamed: "wire")
////                        wire.size = CGSize(width: trapSize, height: trapSize)
////                        //                        basicTrap.position = pointForCoordinate(trapNode.gridPosition)
////                        wire.position = trapPosition
////                        wire.zPosition = 2
////                        if pathPositions.contains(wire.position) == false {
////                            self.addChild(wire)
////                            print("wire")
////                        }
////                        
////                        print("___")
////                    }
////                    if hospitalSideBarTrap.selected == true{
////                        let hospital = SKSpriteNode(imageNamed: "hospital")
////                        hospital.size = CGSize(width: trapSize, height: trapSize)
////                        //                        basicTrap.position = pointForCoordinate(trapNode.gridPosition)
////                        hospital.position = trapPosition
////                        hospital.zPosition = 2
////                        if pathPositions.contains(hospital.position) == false {
////                            self.addChild(hospital)
////                            print("hospital")
////                        }
////                        
////                        print("___")
////                    }
//                    
//                    let coordinate = coordinateForPoint(location)
//                    let touchPosition = CGPoint(x: CGFloat(coordinate.x) * trapSize + gridStart.x + trapSize / 2, y: CGFloat(coordinate.y) * trapSize + gridStart.y + trapSize / 2)
//                    let touchPositionInt = CGPoint(x: CGFloat(Int(touchPosition.x)), y: CGFloat(Int(touchPosition.y)))
//                    let touchPositionTestingForRightX = CGPoint(x: CGFloat(Int(touchPosition.x - trapSize)), y: CGFloat(Int(touchPosition.y)))
//                    let touchPositionTestingForLeftX = CGPoint(x: CGFloat(Int(touchPosition.x + trapSize)), y: CGFloat(Int(touchPosition.y)))
//                    let touchPositionTestingForUpperY = CGPoint(x: CGFloat(Int(touchPosition.x)), y: CGFloat(Int(touchPosition.y + trapSize)))
//                    let touchPositionTestingForLowerY = CGPoint(x: CGFloat(Int(touchPosition.x)), y: CGFloat(Int(touchPosition.y - trapSize)))
//                    
//                    
//                    var waterWheel = createTrap(waterWheelSideBarTrap, trapID: "waterWheel", positionOfTrap: trapPosition, canBeOnPath: false, cost: 150, attackDamage: 0)
//                    let waterWheelTrap = waterWheel.trap
//                    if waterWheel.madeTrap && waterPositions.contains(waterWheelTrap.position) == false {
//                        waterWheelTrap.maxEnergyBar.removeFromParent()
//                        waterWheelTrap.healthBar.removeFromParent()
//                        waterWheelTrap.maxHealthBar.removeFromParent()
//                        waterWheelTrap.energyBar.removeFromParent()
//                        waterWheelTrap.removeFromParent()
//                        traps.remove(at: traps.index(of: waterWheelTrap)!)
//                        money += 150
//                        moneyLabel.text = "Money: \(money)"
//                        waterWheel.madeTrap = false
//                    }
//                    waterWheel.trap.energyGenerated = 50
//                    waterWheel.trap.energy = 0
//                    waterWheel.trap.maxEnergy = 200
//                    
//                    let freezeTrap = createTrap(freezeSideBarTrap, trapID: "freezeTrap", positionOfTrap: trapPosition, canBeOnPath: true, cost: 150, attackDamage: 1)
//                    
//                    let powerPlant = createTrap(powerPlantSideBarTrap, trapID: "powerPlant", positionOfTrap: trapPosition, canBeOnPath: false, cost: 1000, attackDamage: 0)
//                    powerPlant.trap.energy = 0
//                    powerPlant.trap.maxEnergy = 200
//                    
//                    let reverseTrap = createTrap(reverseSideBarTrap, trapID: "reverseTrap", positionOfTrap: trapPosition, canBeOnPath: true, cost: 300, attackDamage: 3)
//                    
//                    let poisonTrap = createTrap(poisonSideBarTrap, trapID: "poisonTrap", positionOfTrap: trapPosition, canBeOnPath: true, cost: 250, attackDamage: 2)
//                    
//                    let windTurbine = createTrap(windTurbineSideBarTrap, trapID: "windTurbine", positionOfTrap: trapPosition, canBeOnPath: false, cost: 50, attackDamage: 0)
//                    windTurbine.trap.energy = 0
//                    let battery = createTrap(batterySideBarTrap, trapID: "battery", positionOfTrap: trapPosition, canBeOnPath: false, cost: 75, attackDamage: 0)
//                    battery.trap.energy = 0
//                    battery.trap.maxEnergy = 800
//                    let wire = createTrap(wireSideBarTrap, trapID: "wire", positionOfTrap: trapPosition, canBeOnPath: false, cost: 25, attackDamage: 0)
//                    wire.trap.energy = 0
//                    let hospital = createTrap(hospitalSideBarTrap, trapID: "hospital", positionOfTrap: trapPosition, canBeOnPath: false, cost: 150, attackDamage: 0)
//                    if hospital.madeTrap {
//                        let Area = SKShapeNode()
//                        let AreaPath = UIBezierPath()
//                        AreaPath.addArc(withCenter: trapPosition, radius: trapSize * 3, startAngle: 0, endAngle: CGFloat(M_PI*2), clockwise: true)
//                        AreaPath.stroke()
//                        Area.path = AreaPath.cgPath
//                        hospital.trap.radius = Area
//                        self.addChild(Area)
//                        hospitals.append(hospital.trap)
//                        hospitalRepairArea.append(Area)
//                        for trap in traps {
//                            if Area.contains(trap.position) {
//                                healingTraps.append(trap)
//                            }
//                        }
//                    }
//                    for trap  in traps {
//                        if trap.position == touchPositionTestingForLeftX || trap.position == touchPositionTestingForRightX || trap.position == touchPositionTestingForUpperY || trap.position == touchPositionTestingForLowerY {
////                            if windTurbine.madeTrap {
////                            connectedItems.append([trap, windTurbine.trap])
////                            } else if battery.madeTrap {
////                                connectedItems.append([trap, battery.trap])
////                            } else if wire.madeTrap {
////                                connectedItems.append([trap, wire.trap])
////                            } else if basicTrap.madeTrap {
////                                connectedItems.append([trap, basicTrap.trap])
////                            } else if hospital.madeTrap {
////                                connectedItems.append([trap, hospital.trap])
////                            }else if poisonTrap.madeTrap{
////                                connectedItems.append([trap, poisonTrap.trap])
////                            }
////                            print(connectedItems)
////                            print("connectedItemsAbove")
//                            connectTraps(trap, traps: [basicTrap, battery, wire, windTurbine, hospital, powerPlant, poisonTrap, freezeTrap, reverseTrap, waterWheel])
//                        }
//                        if trapDestroyingHammer.selected {
//                            if trap.position == trapPosition {
//                                if trap.ID == "hospital" {
//                                    trap.radius.removeFromParent()
//                                }
//                                money += trap.cost/2
//                                moneyLabel.text = "Money: \(money)"
//                                traps.remove(at: traps.index(of: trap)!)
//                                trap.energyBar.removeFromParent()
//                                trap.maxEnergyBar.removeFromParent()
//                                trap.healthBar.removeFromParent()
//                                trap.maxHealthBar.removeFromParent()
//                                trap.removeFromParent()
//                            }
//                        }
//                    }
////                    if windTurbine.trap.position == touchPositionTestingForLeftX || windTurbine.trap.position == touchPositionTestingForRightX || windTurbine.trap.position == touchPositionTestingForUpperY || windTurbine.trap.position == touchPositionTestingForLowerY {
////                        for  trap in traps {
////                            if trap.position
////                        }
////                        connectedItems.append([])
////                    }
//                }
//                
//            }
//            let trapTypes = [basicSideBarTrap,batterySideBarTrap, wireSideBarTrap, hospitalSideBarTrap, windTurbineSideBarTrap, poisonSideBarTrap, trapDestroyingHammer, powerPlantSideBarTrap, freezeSideBarTrap, reverseSideBarTrap, waterWheelSideBarTrap]
//            
//            let selectedTrapTypes = [basicSideBarTrapSelectedPic, batterySideBarTrapSelectedPic, wireSideBarTrapSelectedPic, hospitalSideBarTrapSelectedPic, windTurbineSideBarTrapSelectedPic,poisonSideBarTrapSelectedPic, trapDestroyingHammerSelectedPic, powerPlantSideBarTrapSelectedPic, freezeSideBarTrapSelectedPic, reverseSideBarTrapSelectedPic, waterWheelSideBarTrapSelectedPic]
//            
//            trapTouchControl(basicSideBarTrap, selectedTrap: basicSideBarTrapSelectedPic,  touch: self.atPoint(location), otherTraps: /*[batterySideBarTrap, wireSideBarTrap, hospitalSideBarTrap, windTurbineSideBarTrap, poisonSideBarTrap, trapDestroyingHammer, powerPlantSideBarTrap, freezeSideBarTrap]*/ trapTypes, otherTrapsSelected: /*[batterySideBarTrapSelectedPic, wireSideBarTrapSelectedPic, hospitalSideBarTrapSelectedPic, windTurbineSideBarTrapSelectedPic,poisonSideBarTrapSelectedPic, trapDestroyingHammerSelectedPic, powerPlantSideBarTrapSelectedPic, freezeSideBarTrapSelectedPic]*/selectedTrapTypes)
//            
//            trapTouchControl(batterySideBarTrap, selectedTrap: batterySideBarTrapSelectedPic, touch: self.atPoint(location), otherTraps: /*[basicSideBarTrap, wireSideBarTrap, hospitalSideBarTrap, windTurbineSideBarTrap, poisonSideBarTrap, trapDestroyingHammer, powerPlantSideBarTrap, freezeSideBarTrap]*/trapTypes, otherTrapsSelected: /*[basicSideBarTrapSelectedPic, wireSideBarTrapSelectedPic, hospitalSideBarTrapSelectedPic, windTurbineSideBarTrapSelectedPic,poisonSideBarTrapSelectedPic, trapDestroyingHammerSelectedPic, powerPlantSideBarTrapSelectedPic, freezeSideBarTrapSelectedPic]*/selectedTrapTypes)
//            
//            trapTouchControl(wireSideBarTrap, selectedTrap: wireSideBarTrapSelectedPic, touch: self.atPoint(location), otherTraps: /*[basicSideBarTrap, batterySideBarTrap, hospitalSideBarTrap, windTurbineSideBarTrap, poisonSideBarTrap, trapDestroyingHammer, powerPlantSideBarTrap, freezeSideBarTrap]*/trapTypes, otherTrapsSelected: /*[basicSideBarTrapSelectedPic, batterySideBarTrapSelectedPic, hospitalSideBarTrapSelectedPic, windTurbineSideBarTrapSelectedPic,poisonSideBarTrapSelectedPic, trapDestroyingHammerSelectedPic, powerPlantSideBarTrapSelectedPic, freezeSideBarTrapSelectedPic]*/selectedTrapTypes)
//            
//            trapTouchControl(hospitalSideBarTrap, selectedTrap: hospitalSideBarTrapSelectedPic, touch: self.atPoint(location), otherTraps: /*[basicSideBarTrap, batterySideBarTrap, wireSideBarTrap, windTurbineSideBarTrap, poisonSideBarTrap, trapDestroyingHammer, powerPlantSideBarTrap, freezeSideBarTrap]*/trapTypes, otherTrapsSelected: /*[basicSideBarTrapSelectedPic, batterySideBarTrapSelectedPic, wireSideBarTrapSelectedPic, windTurbineSideBarTrapSelectedPic,poisonSideBarTrapSelectedPic, trapDestroyingHammerSelectedPic, powerPlantSideBarTrapSelectedPic]*/selectedTrapTypes)
//            
//            trapTouchControl(windTurbineSideBarTrap, selectedTrap: windTurbineSideBarTrapSelectedPic, touch: self.atPoint(location), otherTraps: /*[basicSideBarTrap, batterySideBarTrap, wireSideBarTrap, hospitalSideBarTrap, poisonSideBarTrap, trapDestroyingHammer, powerPlantSideBarTrap, freezeSideBarTrap]*/trapTypes, otherTrapsSelected: /*[basicSideBarTrapSelectedPic, batterySideBarTrapSelectedPic, wireSideBarTrapSelectedPic, hospitalSideBarTrapSelectedPic,poisonSideBarTrapSelectedPic, trapDestroyingHammerSelectedPic, powerPlantSideBarTrapSelectedPic, freezeSideBarTrapSelectedPic]*/selectedTrapTypes)
//            
//            trapTouchControl(poisonSideBarTrap, selectedTrap: poisonSideBarTrapSelectedPic, touch: self.atPoint(location), otherTraps: /*[basicSideBarTrap, batterySideBarTrap, wireSideBarTrap, hospitalSideBarTrap, windTurbineSideBarTrap, trapDestroyingHammer, powerPlantSideBarTrap, freezeSideBarTrap]*/trapTypes, otherTrapsSelected: /*[basicSideBarTrapSelectedPic, batterySideBarTrapSelectedPic, wireSideBarTrapSelectedPic, hospitalSideBarTrapSelectedPic, windTurbineSideBarTrapSelectedPic,trapDestroyingHammerSelectedPic, powerPlantSideBarTrapSelectedPic, freezeSideBarTrapSelectedPic]*/selectedTrapTypes)
//            
//            trapTouchControl(trapDestroyingHammer, selectedTrap: trapDestroyingHammerSelectedPic, touch: self.atPoint(location), otherTraps: /*[basicSideBarTrap, batterySideBarTrap, wireSideBarTrap, hospitalSideBarTrap, windTurbineSideBarTrap, poisonSideBarTrap, powerPlantSideBarTrap, freezeSideBarTrap]*/trapTypes, otherTrapsSelected: /* [basicSideBarTrapSelectedPic, batterySideBarTrapSelectedPic, wireSideBarTrapSelectedPic, hospitalSideBarTrapSelectedPic, windTurbineSideBarTrapSelectedPic, poisonSideBarTrapSelectedPic, powerPlantSideBarTrapSelectedPic, freezeSideBarTrapSelectedPic]*/selectedTrapTypes)
//            
//            trapTouchControl(powerPlantSideBarTrap , selectedTrap: powerPlantSideBarTrapSelectedPic, touch: self.atPoint(location), otherTraps: /*[basicSideBarTrap, batterySideBarTrap, wireSideBarTrap, hospitalSideBarTrap, windTurbineSideBarTrap, poisonSideBarTrap, trapDestroyingHammer, freezeSideBarTrap]*/trapTypes, otherTrapsSelected:/* [basicSideBarTrapSelectedPic, batterySideBarTrapSelectedPic, wireSideBarTrapSelectedPic, hospitalSideBarTrapSelectedPic, windTurbineSideBarTrapSelectedPic, poisonSideBarTrapSelectedPic, trapDestroyingHammerSelectedPic, freezeSideBarTrapSelectedPic]*/ selectedTrapTypes)
//            
//            trapTouchControl(freezeSideBarTrap, selectedTrap: freezeSideBarTrapSelectedPic, touch: self.atPoint(location), otherTraps: trapTypes/*[basicSideBarTrap, batterySideBarTrap, wireSideBarTrap, hospitalSideBarTrap, windTurbineSideBarTrap, poisonSideBarTrap, trapDestroyingHammer, powerPlantSideBarTrap]*/, otherTrapsSelected:/*[basicSideBarTrapSelectedPic, batterySideBarTrapSelectedPic, wireSideBarTrapSelectedPic, hospitalSideBarTrapSelectedPic, windTurbineSideBarTrapSelectedPic, poisonSideBarTrapSelectedPic, trapDestroyingHammerSelectedPic, powerPlantSideBarTrapSelectedPic]*/selectedTrapTypes)
//            
//            trapTouchControl(reverseSideBarTrap, selectedTrap: reverseSideBarTrapSelectedPic, touch: self.atPoint(location), otherTraps: trapTypes, otherTrapsSelected: selectedTrapTypes)
//            
//            trapTouchControl(waterWheelSideBarTrap, selectedTrap: waterWheelSideBarTrapSelectedPic, touch: self.atPoint(location), otherTraps: trapTypes, otherTrapsSelected: selectedTrapTypes)
//            }
//        }
        
    }
   
    override func update(_ currentTime: TimeInterval) {
        if runningWave == true {
            for trap in traps {
                var attacked = false
                for enemy in enemies {
                    if ((trap.position.x - trapSize/2) <= enemy.position.x && (trap.position.x + trapSize/2) >= enemy.position.x) && (trap.position.y - trapSize/2) <= enemy.position.y && (trap.position.y + trapSize/2) >= enemy.position.y && trap.timeSinceLastAttack >= trap.reloadTime {
                        if trap.ID == "basicTrap" {
//                            enemy.life -= 4
                            print("basicTrap attacked")
                        } else if trap.ID == "poisonTrap" && trap.energy >= 10{
//                            enemy.life -= 2
                            enemy.secondsPoisoned = 0
                            trap.energy -= 10
                            print("poisonTrap attacked")
                            enemy.poisoned = true
                            print(enemy.poisoned)
                        } else if trap.ID == "freezeTrap" {
//                            enemy.life -= 1
                            trap.energy -= 15
                            enemy.secondsFrozen = 0
                            if enemy.frozen == false {
                                enemy.frozen = true
                                enemy.duration = enemy.duration * 2
                                addActions(enemy, position: enemy.position)
//                            var sequence = [SKAction]()
//                            enemy.removeAllActions()
//                            var enemyPath = enemyGrid.nodeAtGridPosition(coordinateForPoint(enemy.position))!.findPathToNode((enemyGrid.nodeAtGridPosition(coordinateForPoint(pathPositions[0])))!) as! [GKGridGraphNode]
//                                
//                            enemyPath.removeAtIndex(0)
//                            for node in enemyPath {
//                                let action = SKAction.moveTo(pointForCoordinate(node.gridPosition), duration: enemy.duration)
//                                let update = SKAction.runBlock() { [unowned self] in
//                                    //                    mediumEnemy.position = self.pointForCoordinate(node.gridPosition)
//                                }
//                                sequence += [action, update]
//                            }
//                            //            print("going to run action")
//                            enemy.runAction(SKAction.sequence(sequence))
                            }
                        } else if trap.ID == "reverseTrap" {
//                            enemy.life -= 3
                            trap.energy -= 20
                            
                            var reversedPosition = CGPoint(x: trap.position.x, y: trap.position.y)
                            var isOnFirstRow = false
                            for tile in pathPositions[(pathPositions.count - map.startIndex)..<pathPositions.count] {
                                if tile.y == trap.position.y {
                                    reversedPosition = CGPoint(x: trap.position.x - (5 * trapSize), y: trap.position.y)
                                    isOnFirstRow = true
                                    break
                                }
                                
                            }
                            if isOnFirstRow == false {
                                reversedPosition = pathPositions[pathPositions.index(of: trap.position)! + 5]
                            }
                            if enemyGrid.node(atGridPosition: coordinateForPoint(reversedPosition)) == nil {
                                        reversedPosition = pathPositions[map.startIndex]
                            }
                            addActions(enemy, position: reversedPosition)
                        }
                        
                        enemy.life -= trap.attackDamage
                        trap.life -= 2
                        attacked = true
//                                                    print(enemy.life)
                        //                            print(trap.life)
                        
                        if trap.life <= 0 {
                            //                            let node = GKGridGraphNode(gridPosition: coordinateForPoint(trap.position))
                            //                            gameGrid.addNodes([node])
                            //                            print(node)
                            trap.maxEnergyBar.removeFromParent()
                            trap.energyBar.removeFromParent()
                            trap.healthBar.removeFromParent()
                            trap.maxHealthBar.removeFromParent()
                            trap.removeFromParent()
                            traps.remove(at: traps.index(of: trap)!)
                            break
                            
                            
                            
                        }
                    }
                }
                if attacked {
                trap.timeSinceLastAttack = 0
                }
            }
        }
        for enemy in enemies {
            let barMovement = enemy.life / enemy.maxLife
            enemy.healthBar.removeFromParent()
            let healthPath = UIBezierPath(rect: CGRect(x: enemy.position.x - trapSize/2, y: enemy.position.y - trapSize/2, width: trapSize * CGFloat(barMovement), height: trapSize/10))
            enemy.healthBar = SKShapeNode(path: healthPath.cgPath)
            enemy.healthBar.fillColor = UIColor.red
            enemy.healthBar.zPosition = 9
            addChild(enemy.healthBar)
            
            enemy.maxHealthBar.removeFromParent()
            let maxHealthPath = UIBezierPath(rect: CGRect(x: enemy.position.x - trapSize/2, y: enemy.position.y - trapSize/2, width: trapSize, height: trapSize/10))
            enemy.maxHealthBar = SKShapeNode(path: maxHealthPath.cgPath)
            enemy.maxHealthBar.zPosition = 8
            addChild(enemy.maxHealthBar)
            
            
            
            if enemy.hasActions() == false {
                enemiesThatCanGoesThroughBeforeLosing -= 1
//                print("lost life")
                enemies.remove(at: enemies.index(of: enemy)!)
                enemy.healthBar.removeFromParent()
                enemy.maxHealthBar.removeFromParent()
                enemy.removeFromParent()
            }
            
            if enemy.life <= 0 {
                //                                print("enemy has died")
                money += 25
                moneyLabel.text = "Money: \(money)"
                enemy.removeAllActions()
                enemy.removeFromParent()
                enemy.healthBar.removeFromParent()
                enemy.maxHealthBar.removeFromParent()
                enemies.remove(at: enemies.index(of: enemy)!)
            }
        }
        if enemiesThatCanGoesThroughBeforeLosing == 0 {
            let scene = GameScene(size: self.size)
            let skView = self.view! as SKView
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .resizeFill
            scene.size = skView.bounds.size
            skView.presentScene(scene)
//            moneyLabel.removeFromSuperview()
//            basicSideBarTrap.trapPriceLabel.removeFromSuperview()
//            batterySideBarTrap.trapPriceLabel.removeFromSuperview()
//            wireSideBarTrap.trapPriceLabel.removeFromSuperview()
//            hospitalSideBarTrap.trapPriceLabel.removeFromSuperview()
//            trapDestroyingHammer.trapPriceLabel.removeFromSuperview()
//            poisonSideBarTrap.trapPriceLabel.removeFromSuperview()
            for item in stuffToRemove {
                item.removeFromSuperview()
            }
            GameScene().wonLevel = false
//            let currentMap = maps.indexOf(mapName)
//            mapName = maps[currentMap!]
//            GameScene().lastLevel = mapName
//            let lastLevel = GameScene().lastLevel
//            maps.append(Map().mapOne() as! AnyObject)
//            maps.append(Map().mapTwo() as! AnyObject)
//            maps.append(Map().mapThree() as! AnyObject)
//            var current = maps.indexOf((lastLevel as! AnyObject), throws = false)
//            GameScene().lastLevel = current
        }
        
        
        if currentTime >= lastTimeCalled + 1 {
            for itemArray in connectedItems {
                for item in itemArray {
                    var otherItem = itemArray
                    otherItem.remove(at: itemArray.index(of: item)!)
                    if item.maxEnergy != 0 || otherItem[0].maxEnergy != 0 {
    //                    let energyDifference = otherItem[0].energy - item.energy
                        let fractionOfItemEnergy = Double(item.energy / item.maxEnergy)
                        let fractionOfOtherItemEnergy = Double(otherItem[0].energy / otherItem[0].maxEnergy)
                        let energyDifference = /*((otherItem[0].energy / otherItem[0].maxEnergy) + (item.energy / item.maxEnergy)) / 2*/ (fractionOfItemEnergy + fractionOfOtherItemEnergy)/2
                        let energyMoved = energyDifference * Double(item.maxEnergy)
                        if (item.energy / item.maxEnergy) < (otherItem[0].energy / otherItem[0].maxEnergy) {
                            
                            if energyMoved <= Double(item.maxEnergy) {
                                if otherItem[0].energy - (energyMoved - item.energy) >= 0 {
    //                            item.energy += energyDifference / 2 * item.maxEnergy
                                let energyTaken = energyMoved - item.energy
                                item.energy = energyMoved
                                otherItem[0].energy -= energyTaken
    //                            otherItem[0].energy -= energyDifference / 2
                                } else {
                                    
                                    item.energy += otherItem[0].energy / 2
                                    otherItem[0].energy -= otherItem[0].energy / 2
                                }
                            } else {
                                let energyTaken = item.maxEnergy - item.energy
                                item.energy = item.maxEnergy
                                
                                otherItem[0].energy -= energyTaken
                            }
                        }
                    }
                    
                }
            }
            for enemy in enemies {
                if enemy.poisoned == true && enemy.secondsPoisoned <= 5 {
                    enemy.life -= 2
                    enemy.secondsPoisoned += 1
                }
                if enemy.frozen {
                    if enemy.secondsFrozen <= 5 {
                    enemy.secondsFrozen += 1
                    } else {
                        enemy.frozen = false
                        enemy.duration = enemy.duration / 2
                        addActions(enemy, position: enemy.position)
//                        var sequence = [SKAction]()
//                        var enemyPath = enemyGrid.nodeAtGridPosition(coordinateForPoint(enemy.position))!.findPathToNode((enemyGrid.nodeAtGridPosition(coordinateForPoint(pathPositions[0])))!) as! [GKGridGraphNode]
//                        
//                        enemyPath.removeAtIndex(0)
//                        for node in enemyPath {
//                            let action = SKAction.moveTo(pointForCoordinate(node.gridPosition), duration: enemy.duration)
//                            let update = SKAction.runBlock() { [unowned self] in
//                                //                    mediumEnemy.position = self.pointForCoordinate(node.gridPosition)
//                            }
//                            sequence += [action, update]
//                        }
//                        //            print("going to run action")
//                        enemy.runAction(SKAction.sequence(sequence))
                    }
                }
            }
            for trap in traps {
                if trap.ID == "windTurbine" {
                    if trap.energy <= (trap.maxEnergy - 10){
                    trap.energy += 10
//                    print(trap.energy)
                    }else if trap.energy < trap.maxEnergy {
                        let addedEnergy = trap.maxEnergy - trap.energy
                        trap.energy += addedEnergy
                    }
                }else if trap.ID == "waterWheel" {
                    if trap.energy <= (trap.maxEnergy - 50) {
                        trap.energy += 50
                    } else if trap.energy < trap.maxEnergy {
                        let addedEnergy = trap.maxEnergy - trap.energy
                        trap.energy += addedEnergy
                    }
                    
                } else if trap.ID == "powerPlant" && trap.energy >= 10 {
                    let moneyMade = Int(trap.energy / 10)
                    if moneyMade <= 50 {
                        money += moneyMade
                        moneyLabel.text = "Money: \(money)"
                        trap.energy -= Double(moneyMade * 10)
                    }
                }
//                print(trap.energy)
//                print(trap.ID)
                if trap.maxEnergy != 0 {
                    let barMovement = CGFloat(trap.energy) / CGFloat((trap.maxEnergy))
                    trap.energyPath = UIBezierPath(rect: CGRect(x: trap.position.x - trapSize/2, y: trap.position.y - trapSize/2, width: trapSize * barMovement, height: trapSize/10))
                    
                    
                    let energyBar = SKShapeNode(path: trap.energyPath.cgPath)
                    energyBar.position = CGPoint(x: trap.energyBar.position.x, y: trap.energyBar.position.y)
                    energyBar.zPosition = 4
                    energyBar.fillColor = UIColor.yellow
                    trap.energyBar.removeFromParent()
                    trap.energyBar = energyBar
                    self.addChild(energyBar)
                }
                trap.timeSinceLastAttack += 1
                let healthBarMovement = CGFloat(trap.life) / CGFloat(Trap().life)
                let healthPath = UIBezierPath(rect: CGRect(x: trap.position.x - trapSize/2, y: trap.position.y + trapSize/2 - trapSize/10, width: trapSize * healthBarMovement, height: trapSize/10))
                let healthBar = SKShapeNode(path: healthPath.cgPath)
                healthBar.position = CGPoint(x: trap.healthBar.position.x, y: trap.healthBar.position.y)
                healthBar.zPosition = 4
                healthBar.fillColor = UIColor.red
                trap.healthBar.removeFromParent()
                trap.healthBar = healthBar
                addChild(healthBar)
            }
            
//            for trap in healingTraps {
//                if trap.life < Trap().life {
//                    trap.life += 1
//                    print("healedTrap")
//                    print(trap.life)
//                }
//            }
            for hospital in hospitals {
//                print(hospital.radius)
                for trap in traps {
//                    print(trap.position)
                    if hospital.radius.contains(trap.position) && hospital.energy >= 10 && trap.life <= (Trap().life - hospital.healAmount){
                        print(trap.life)
                        trap.life += hospital.healAmount
                        hospital.energy -= 10
                        print("trap \(trap.ID) has \(trap.life) attacks left")
                        
                    }
                }
                print("energy: \(hospital.energy)")
            }
//            print(basicSideBarTrap.selected)
//            print(basicSideBarTrapSelectedPic.selected)
//            print("____")
            if time < map.waves.endIndex {
                    if map.waves[time] != "" {
                        createWave(map.waves[time])
                        runningWave = true
                        isSameWave = false
                    } else if isSameWave == false {
                        numberOfWaves += 1
                        isSameWave = true
                }
                } else {
//                    timesRan += 1
                    if enemies.count == 0 && enemiesThatCanGoesThroughBeforeLosing != 0{
////                        print("you win!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
//                        let currentMap = maps.indexOf(mapName)
//                        mapName = maps[currentMap! + 1]
//                        GameScene().lastLevel = mapName
                        let scene = GameScene(size: self.size)
                        let skView = self.view! as SKView
                        skView.ignoresSiblingOrder = true
                        scene.scaleMode = .resizeFill
                        scene.size = skView.bounds.size
                        skView.presentScene(scene)
//                        moneyLabel.removeFromSuperview()
                        for item in stuffToRemove {
                            item.removeFromSuperview()
                        }
                        didWin = true
                        GameScene().wonLevel = true
                    }
                }
                //            if time % 10 >= 0 && time % 10 < 5{
                //                createWave("fastEnemy", speed: 0.25, life: 5)
                //                runningWave = true
                //            }
                //        }
            lastTimeCalled = currentTime
            time += 1
    }
        if enemies.count == 0 {
            runningWave = false
        }
        
        
    }
    func coordinateForPoint(_ point: CGPoint) -> int2 {
        return int2(Int32((point.x - gridStart.x) / trapSize), Int32((point.y - gridStart.y) / trapSize))
    }
    
    func pointForCoordinate(_ coordinate: int2) -> CGPoint {
        return CGPoint(x: CGFloat(coordinate.x) * trapSize + gridStart.x + trapSize / 2, y: CGFloat(coordinate.y) * trapSize +
            gridStart.y + trapSize / 2)
    }
    func trapTouchControl(_ trap: Trap, selectedTrap: Trap, touch: SKNode, otherTraps: [Trap], otherTrapsSelected: [Trap] ){
        if touch == trap {
            trap.removeFromParent()
            self.addChild(selectedTrap)
            trap.selected = true
//            let trapPosiion = trap.position
//            let sideBarTrapSize = trap.size
////            trap.zPosition = 1
//            trap = Trap(imageNamed: selectedTrapID)
//            trap.size = sideBarTrapSize
//            trap.position = trapPosiion
//            trap.zPosition = 2
//            
//            addChild(trap)
            var trapsWithOutThisOne = otherTraps
            trapsWithOutThisOne.remove(at: trapsWithOutThisOne.index(of: trap)!)
            for sideBarTrap in trapsWithOutThisOne {
                if sideBarTrap.selected == true {
                    sideBarTrap.selected = false
                    otherTrapsSelected[otherTraps.index(of: sideBarTrap)!].removeFromParent()
                    addChild(sideBarTrap)
                }
            }
//            if trapID == "basic trap" {
//                batterySideBarTrapSelected = false
//                basicSideBarTrapSelected = true
//                
//            }else if trapID == "battery" {
//                basicSideBarTrapSelected = false
//                batterySideBarTrapSelected = true
//                
//            }else if trapID == "wire" {
//                basicSideBarTrapSelected = false
//                batterySideBarTrapSelected = true
//            }
            
        }else if touch == selectedTrap {
            selectedTrap.removeFromParent()
            addChild(trap)
            trap.selected = false
//            let trapPosiion = trap.position
//            let sideBarTrapSize = trap.size
////            trap.zPosition = 1
//            trap = Trap(imageNamed: trapID)
//            trap.size = sideBarTrapSize
//            trap.position = trapPosiion
//            trap.zPosition = 2
////            addChild(trap)
//            trap.selected = false
//            if trapID == "basic trap" {
//                basicSideBarTrapSelected = false
//            }else if trapID == "battery" {
//                batterySideBarTrapSelected = false
//            }
        }
//        return trap
    }
    func createTrap(_ trap: Trap, trapID: String, positionOfTrap: CGPoint, canBeOnPath: Bool, cost: Int, attackDamage: Double) -> (madeTrap: Bool, trap: Trap){
        var requirements = false
        if canBeOnPath  {
            requirements = (pathPositions.contains(CGPoint(x: Int(positionOfTrap.x), y: Int(positionOfTrap.y))) == canBeOnPath || pathPositions.contains(CGPoint(x: Int(positionOfTrap.x), y: Int(positionOfTrap.y + 1))) == canBeOnPath)
        } else {
            requirements = pathPositions.contains(positionOfTrap) == canBeOnPath && pathPositions.contains(CGPoint(x: Int(positionOfTrap.x), y: Int(positionOfTrap.y + 1))) == canBeOnPath
        }
        if trap.selected == true && money >= cost && requirements/*(pathPositions.contains(CGPoint(x: Int(positionOfTrap.x), y: Int(positionOfTrap.y))) == canBeOnPath || pathPositions.contains(CGPoint(x: Int(positionOfTrap.x), y: Int(positionOfTrap.y + 1))) == canBeOnPath)*/ {
            
                var trapPositions = [CGPoint]()
                let trap = Trap(imageNamed: trapID)
                trap.size = CGSize(width: trapSize, height: trapSize)
                trap.position = positionOfTrap
                trap.zPosition = 2
                for trap in traps { trapPositions.append(trap.position)}
                if trapPositions.contains(trap.position) == false {
                    let energyMaxPath = UIBezierPath(rect: CGRect(x: positionOfTrap.x - trapSize/2, y: positionOfTrap.y - trapSize/2, width: trapSize, height: trapSize/10))
                    let energyMaxBar = SKShapeNode(path: energyMaxPath.cgPath)
                    energyMaxBar.zPosition = 3
                    addChild(energyMaxBar)
                    let energyPath = UIBezierPath(rect: CGRect(x: positionOfTrap.x - trapSize/2, y: positionOfTrap.y - trapSize/2, width: 0, height: trapSize/10))
                    let energyBar = SKShapeNode(path: energyPath.cgPath)
                    energyBar.fillColor = UIColor.yellow
                    addChild(energyBar)
                    trap.energyBar = energyBar
                    trap.energyPath = energyPath
                    trap.maxEnergyBar = energyMaxBar
                    trap.attackDamage = attackDamage
                    
                    let healthMaxPath = UIBezierPath(rect: CGRect(x: positionOfTrap.x - trapSize/2, y: positionOfTrap.y + trapSize/2 - trapSize/10, width: trapSize, height: trapSize/10))
                    let healthMaxBar = SKShapeNode(path: healthMaxPath.cgPath)
                    healthMaxBar.zPosition = 3
                    addChild(healthMaxBar)
                    let healthPath = UIBezierPath(rect: CGRect(x: positionOfTrap.x - trapSize/2, y: positionOfTrap.y + trapSize/2 - trapSize/10, width: 0, height: trapSize/10))
                    let healthBar = SKShapeNode(path: healthPath.cgPath)
                    healthBar.fillColor = UIColor.red
                    addChild(healthBar)
                    trap.healthBar = healthBar
                    trap.maxHealthBar = healthMaxBar
                    
                    trap.ID = trapID
                    trap.cost = cost
                    self.addChild(trap)
                    traps.append(trap)
                    money -= cost
                    moneyLabel.text = "Money: \(money)"
                    if canBeOnPath {
                        for area in hospitalRepairArea {
                            if area.contains(positionOfTrap) {
                                healingTraps.append(trap)
                                break
                            }
                        }
                    }
                    return (true, trap)
                
                } else {
                    return (false, trap)
            }
        } else{
            return (false, trap)
        }
    }
    func createWave(_ typeOfEnemy: String){
        var lastTimeEnemyWasMade = 0
        var timeSinceLastEnemyWasMade = 0
        let fastEnemy = SKSpriteNode(imageNamed: "fastEnemy")
        let slowEnemy = SKSpriteNode(imageNamed: "slowEnemy")
        //            let graphNode =
        var sequence = [SKAction]()
        var enemyPath = enemyGrid.node(atGridPosition: coordinateForPoint(pathPositions[map.startIndex]))!.findPath(to: (enemyGrid.node(atGridPosition: coordinateForPoint(pathPositions[0])))!) as! [GKGridGraphNode]
        
        
        
//        print(pathPositions)
        
//        for enemy in 0..<numberOfEnemies {
//            if lastTimeEnemyWasMade == (interval + timeSinceLastEnemyWasMade) {
//            let mediumEnemy = SKSpriteNode(imageNamed: "mediumEnemy")
            let enemy = Enemy(imageNamed: typeOfEnemy)
        let multiplier = (numberOfWaves / 10) + 1
        print(multiplier)
        if typeOfEnemy == "fastEnemy" {
            enemy.life = 3 * multiplier
            enemy.maxLife = 3 * multiplier
            enemy.duration = 0.5
//            print("fastEnemy")
            
        } else if typeOfEnemy == "slowEnemy" {
            enemy.life = 20 * multiplier
            enemy.maxLife = 20 * multiplier
            enemy.duration = 2
//            print("slowEnemy")
        } else {
            enemy.life = 10 * multiplier
            enemy.maxLife = 10 * multiplier
            enemy.duration = 1
//            print("medEnemy")
        }
        if enemy.life <= 0 {
            enemy.life = 1
        }
            enemy.size = CGSize(width: trapSize, height: trapSize)
            enemy.position = pathPositions[map.startIndex]
            enemy.zPosition = 5
        
        let healthPath = UIBezierPath(rect: CGRect(x: enemy.position.x - trapSize/2, y: enemy.position.y - trapSize/2, width: trapSize, height: trapSize/10))
        enemy.healthBar = SKShapeNode(path: healthPath.cgPath)
        enemy.healthBar.fillColor = UIColor.red
        enemy.healthBar.zPosition = 9
        addChild(enemy.healthBar)
        
        let maxHealthPath = UIBezierPath(rect: CGRect(x: enemy.position.x - trapSize/2, y: enemy.position.y - trapSize/2, width: trapSize, height: trapSize/10))
        enemy.maxHealthBar = SKShapeNode(path: healthPath.cgPath)
        enemy.maxHealthBar.zPosition = 8
        addChild(enemy.maxHealthBar)
        
//            enemyHealth[]
//            let enemyEntity = GKEntity
            enemies.append(enemy)
            addChild(enemy)
            enemyPath.remove(at: 0)
            for node in enemyPath {
                let action = SKAction.move(to: pointForCoordinate(node.gridPosition), duration: enemy.duration)
                let update = SKAction.run() { [unowned self] in
//                    mediumEnemy.position = self.pointForCoordinate(node.gridPosition)
                }
                sequence += [action, update]
            }
//            print("going to run action")
            enemy.run(SKAction.sequence(sequence))
//            print("ran action")
//            sleep(1)
//            print("waited")
//            }
            
//        }
//        sleep(1)
    }
    func initTrap(_ trap: Trap, selectedTrap: Trap, spacesVertical: CGFloat, spacesHorizontal: CGFloat,  cost: String) {
        let firstColumn = trapSideBar.size.width/5 + trapSize/32
        trap.size = CGSize(width: trapSize,height: trapSize)
        trap.position = CGPoint(x: firstColumn + spacing * spacesHorizontal, y: firstColumn + spacing * spacesVertical)
        trap.zPosition = 2
        selectedTrap.size = trap.size
        selectedTrap.position = trap.position
        selectedTrap.zPosition = trap.zPosition
        let xCoordinate = firstColumn + spacing - trapSize/2 + spacing * spacesHorizontal
        let costLabel = UILabel(frame: CGRect(x: xCoordinate, y: self.frame.maxY - (firstColumn + spacing * spacesVertical) - trapSize/4, width: trapSize * 2, height: trapSize/2))
        costLabel.text = cost
        view!.addSubview(costLabel)
//        trap.trapPriceLabel = costLabel
        stuffToRemove.append(costLabel)
    }
    func connectTraps(_ trap: Trap, traps: [(Bool, Trap)]) {
        for otherTrap in traps {
            if otherTrap.0 {
                connectedItems.append([trap, otherTrap.1])
            }
        }
    }
    func addActions(_ enemy: Enemy , position: CGPoint) {
        var sequence = [SKAction]()
        var enemyPath = enemyGrid.node(atGridPosition: coordinateForPoint(position))!.findPath(to: (enemyGrid.node(atGridPosition: coordinateForPoint(pathPositions[0])))!)  as! [GKGridGraphNode]
        
        enemyPath.remove(at: 0)
        for node in enemyPath {
            let action = SKAction.move(to: pointForCoordinate(node.gridPosition), duration: enemy.duration)
            let update = SKAction.run() { [unowned self] in
                //                    mediumEnemy.position = self.pointForCoordinate(node.gridPosition)
            }
            sequence += [action, update]
        }
        //            print("going to run action")
        enemy.run(SKAction.sequence(sequence))
    }
    func addUpgradeBars(_ trapPosition: CGPoint) {
        
        let centerCirclePath = UIBezierPath(arcCenter: trapPosition, radius: 2 * trapSize, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: false)
//        var upAttackCirclePath = UIBezierPath(arcCenter: CGPoint(x: trapPosition.x, y: trapPosition.y + 2 * trapSize), radius: trapSize, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: false)
//        var upAttackSpeedCirclePath = UIBezierPath(arcCenter: trapPosition, radius: 2, startAngle: 0, endAngle: 360, clockwise: false)
        //        var upLifeCirclePath = UIBezierPath(arcCenter: trapPosition, radius: 2, startAngle: 0, endAngle: 360, clockwise: false)
        let centerCircle = SKShapeNode(path: centerCirclePath.cgPath)
//        var upAttackCircle = SKShapeNode(path: upAttackCirclePath.CGPath)
        let upAttackButton = SKSpriteNode(imageNamed: "upgrade")
        upAttackButton.size = CGSize(width: trapSize, height: trapSize)
        upAttackButton.position = CGPoint(x: trapPosition.x, y: trapPosition.y + round(trapSize * 2))
        print(upAttackButton.position)
        upAttackButton.zPosition = 20
        
        centerCircle.fillColor = UIColor.gray
        centerCircle.strokeColor = UIColor.clear
        centerCircle.alpha = 0.5
        upAttackButton.zPosition = 19
        
        upgradeCircles = [centerCircle, upAttackButton]
        addChild(centerCircle)
        addChild(upAttackButton)
        aTrapHasItsUpgradesShown = true
    }
}
























