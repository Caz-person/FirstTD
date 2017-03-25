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
import GoogleMobileAds

class PlaySceneWithCommentedCode: SKScene, GADInterstitialDelegate {
    var startWaveButton = SKSpriteNode(imageNamed: "arrow")
    var bombSideBarTrap  = Trap()
    var bombSideBarTrapSelected = Trap()
    var waterWheelSideBarTrap = Trap()
    var waterWheelSideBarTrapSelectedPic = Trap()
    var reverseSideBarTrap = Trap()
    var reverseSideBarTrapSelectedPic = Trap()
    var freezeSideBarTrap = Trap()
    var freezeSideBarTrapSelectedPic = Trap()
    var powerPlantSideBarTrap = Trap ()
    var powerPlantSideBarTrapSelectedPic = Trap()
    var trapSideBar = Trap(imageNamed: "trapSideBar")
    var trapDestroyingHammer = Trap()
    var poisonSideBarTrap = Trap()
    var poisonSideBarTrapSelectedPic = Trap()
    var windTurbineSideBarTrap = Trap()
    var windTurbineSideBarTrapSelectedPic = Trap()
    var hospitalSideBarTrap = Trap()
    var hospitalSideBarTrapSelectedPic = Trap()
    var basicSideBarTrap = Trap()
    var basicSideBarTrapSelectedPic = Trap()
    var batterySideBarTrap = Trap()
    var batterySideBarTrapSelectedPic = Trap()
    var wireSideBarTrap = Trap()
    var wireSideBarTrapSelectedPic = Trap()
    var restartButton = SKSpriteNode(imageNamed: "restartButton")
    var pauseButton = SKSpriteNode(imageNamed: "pauseButton")
    let pauseLabel = SKLabelNode(text: "Paused")
    
    
    var intersitial = GADInterstitial(adUnitID:"ca-app-pub-8171238278160333/5117195204")
    var sideBarTraps = [SKTexture]()
    var stuffToRemove = [UILabel]()
    var didWin = false
    var map = Map().mapOne()
    var hospitalRepairArea = [SKShapeNode]()
    var healingTraps = [Trap]()
    var trapSize: CGFloat = 0.0
    var gameGrid = GKGridGraph()
    var gridStart = CGPoint()
    var gridNodes = SKNode()
    var spacing = CGFloat()
    var pathPositions = [int2]()
    var waterPositions = [int2]()
    var money = 500
    var time = 0
    var lastTimeCalled = Double()
    var enemies = [Enemy]()
    var enemyGrid = GKGridGraph()
    var startedWave = false
    var runningWave = false
    var traps = [Trap]()
    var basicTrapPositions = [CGPoint]()
    var moneyLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
    var lifeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
    var enemiesThatCanGoesThroughBeforeLosing = 5
    var hospitals = [Trap]()
    var connectedItems = [[Trap]]()
    var timesRan = 1
    var numberOfWaves = 0.0
    var isSameWave = false
    var aTrapHasItsUpgradesShown = false
    var upgradeCircles = [SKShapeNode(), SKSpriteNode()]
    var shouldWait = false
    var gameIsPaused = false
    var enemyActions = [SKAction]()
    var blinking = false
    var numberOfBlinks = 11
    var amountScrolled = CGFloat()
    var paths = [SKSpriteNode]()
    var runningTutorial = false
    var hasRunTutorial = false
    var trapTypes = [Trap]()
    var selectedTrapTypes = [Trap]()
    var currentSpeechBubble: SpeechBubble? = nil
    var enemyPath = [GKGridGraphNode]()
//    var enemyPath = [GKGridGraphNode()]
    
    override func didMove(to view: SKView) {
        sleep(1)
        //print("slept")
         startWaveButton.texture = SKTexture(imageNamed: "arrow")
         bombSideBarTrap.texture  = SKTexture(imageNamed: "bombTrap")
         bombSideBarTrapSelected.texture = SKTexture(imageNamed: "bombTrapSelected")
         waterWheelSideBarTrap.texture = SKTexture(imageNamed: "waterWheel")
         waterWheelSideBarTrapSelectedPic.texture = SKTexture(imageNamed: "waterWheelSelected")
         reverseSideBarTrap.texture = SKTexture(imageNamed: "reverseTrap")
         reverseSideBarTrapSelectedPic.texture = SKTexture(imageNamed: "reverseTrapSelected")
         freezeSideBarTrap.texture = SKTexture(imageNamed: "freezeTrap")
         freezeSideBarTrapSelectedPic.texture = SKTexture(imageNamed: "freezeTrapSelected")
         powerPlantSideBarTrap.texture = SKTexture(imageNamed: "powerPlant")
         powerPlantSideBarTrapSelectedPic.texture = SKTexture(imageNamed: "powerPlantSelected")
        sleep(1)
        //print("slept")
//         trapSideBar.texture = SKTexture(imageNamed: "trapSideBar")
         trapDestroyingHammer.texture = SKTexture(imageNamed: "hammer")
         poisonSideBarTrap.texture = SKTexture(imageNamed: "poisonTrap")
         poisonSideBarTrapSelectedPic.texture = SKTexture(imageNamed: "poisonTrapSelected")
         windTurbineSideBarTrap.texture = SKTexture(imageNamed: "windTurbine")
         windTurbineSideBarTrapSelectedPic.texture = SKTexture(imageNamed: "windTurbineSelected")
         hospitalSideBarTrap.texture = SKTexture(imageNamed: "hospital")
         hospitalSideBarTrapSelectedPic.texture = SKTexture(imageNamed: "hospitalSelected")
         basicSideBarTrap.texture = SKTexture(imageNamed: "basicTrap")
         basicSideBarTrapSelectedPic.texture = SKTexture(imageNamed: "basicTrapSelected")
         batterySideBarTrap.texture = SKTexture(imageNamed: "battery")
         batterySideBarTrapSelectedPic.texture = SKTexture(imageNamed: "batterySelected")
         wireSideBarTrap.texture = SKTexture(imageNamed: "wire")
         wireSideBarTrapSelectedPic.texture = SKTexture(imageNamed: "wireSelected")
        //print("done")
//         restartButton = SKSpriteNode(imageNamed: "restartButton")
//         pauseButton = SKSpriteNode(imageNamed: "pauseButton")

        trapTypes = [basicSideBarTrap,batterySideBarTrap, wireSideBarTrap, hospitalSideBarTrap, windTurbineSideBarTrap, poisonSideBarTrap, trapDestroyingHammer, powerPlantSideBarTrap, freezeSideBarTrap, reverseSideBarTrap, waterWheelSideBarTrap, bombSideBarTrap]
        
        selectedTrapTypes = [basicSideBarTrapSelectedPic, batterySideBarTrapSelectedPic, wireSideBarTrapSelectedPic, hospitalSideBarTrapSelectedPic, windTurbineSideBarTrapSelectedPic,poisonSideBarTrapSelectedPic, powerPlantSideBarTrapSelectedPic, freezeSideBarTrapSelectedPic, reverseSideBarTrapSelectedPic, waterWheelSideBarTrapSelectedPic, bombSideBarTrapSelected]
//        basicSideBarTrap.texture = SKTexture(image: UIImage(named: "basicTrap")!)
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        intersitial.delegate = self
        intersitial.load(request)
        
//        let pan = UIPanGestureRecognizer(target: self, action: #selector(PlayScene.pan(_:)))
//        self.view!.addGestureRecognizer(pan)
        backgroundColor = UIColor.brown
        sleep(1)
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
//        for trap in sideBarTraps {
//            let firstColumn = trapSideBar.size.width/5 + trapSize/32
//            
//            trap.removeFromParent()
//            trap.size = CGSize(width: trapSize, height: trapSize)
//            trap.position = CGPoint(x: firstColumn, y: firstColumn + spacing * CGFloat(sideBarTraps.indexOf(trap)!))
//            trap.zPosition = 2
//            addChild(trap)
        
//        }
        var currentTrapTypes = [Trap]()
        var currentSelectedTrapTypes = [Trap]()
        for trapTexture in sideBarTraps {
            for selectedTrap in selectedTrapTypes {
                if selectedTrap.texture!.description == trapTexture.description {
                    var currentTrap = trapTypes[selectedTrapTypes.index(of: selectedTrap)!]
                    currentTrapTypes.append(currentTrap)
                    currentSelectedTrapTypes.append(selectedTrap)
                    
                }
            }
        }
        trapTypes = currentTrapTypes
        selectedTrapTypes = currentSelectedTrapTypes
        //print("current traps \(trapTypes)")
        initTrap(basicSideBarTrap, selectedTrap: basicSideBarTrapSelectedPic, cost: "100", descripion: "a basic spike trap \n life: \(Int(Trap().life)) \n cost: 100")
//        addChild(basicSideBarTrap)
        
        
        
        
        initTrap(batterySideBarTrap, selectedTrap: batterySideBarTrapSelectedPic, cost: "75", descripion: "a battery that holds 800 energy \n cost: 75 ")
//        addChild(batterySideBarTrap)
        
        initTrap(wireSideBarTrap, selectedTrap: wireSideBarTrapSelectedPic, cost: "25", descripion: "a cheap way to transfer energy \n holds 100 energy \n cost: 25")
//        addChild(wireSideBarTrap)
        
        initTrap(hospitalSideBarTrap, selectedTrap: hospitalSideBarTrapSelectedPic, cost: "150", descripion: "a hospital that heals your damaged traps \n holds 100 energy \n cost: 150")
//        addChild(hospitalSideBarTrap)
        
        initTrap(windTurbineSideBarTrap, selectedTrap: windTurbineSideBarTrapSelectedPic, cost: "50", descripion: "a wind turbine that generates 10 power \n holds 100 energy \n cost: 50")
//        addChild(windTurbineSideBarTrap)
        
        initTrap(poisonSideBarTrap, selectedTrap: poisonSideBarTrapSelectedPic, cost: "250", descripion: "a poison trap that poisons enemies \n poisons for 5 seconds \n cost: 250")
//        addChild(poisonSideBarTrap)
        
//        initTrap(trapDestroyingHammer, selectedTrap: trapDestroyingHammerSelectedPic, spacesVertical: 8, spacesHorizontal: 0 , cost: "sell", descripion: "sells traps for half price")
//        addChild(trapDestroyingHammer)
        
        initTrap(powerPlantSideBarTrap, selectedTrap: powerPlantSideBarTrapSelectedPic, cost: "500", descripion: "sells energy for money \n cost: 500")
//        addChild(powerPlantSideBarTrap)
        
        initTrap(freezeSideBarTrap, selectedTrap: freezeSideBarTrapSelectedPic, cost: "150", descripion: "a freeze trap that slows enemies for 5 seconds \n cost: 150")
//        addChild(freezeSideBarTrap)
        
        initTrap(reverseSideBarTrap, selectedTrap: reverseSideBarTrapSelectedPic, cost: "200", descripion: "a spring trap that bounces enemies back 5 spaces \n cost: 200")
//        addChild(reverseSideBarTrap)
        
        initTrap(waterWheelSideBarTrap, selectedTrap: waterWheelSideBarTrapSelectedPic, cost: "150", descripion: "a water wheel that generates 50 power \n cost: 150")
//        addChild(waterWheelSideBarTrap)

        initTrap(bombSideBarTrap, selectedTrap: bombSideBarTrapSelected, cost: "50", descripion: "a bomb that explodes, damaging nearby enemies \n cost: 50")
        
        
        moneyLabel.textAlignment = NSTextAlignment.right
        self.view!.addSubview(moneyLabel)
        moneyLabel.center = CGPoint(x: (self.frame.maxX - moneyLabel.bounds.width/2) - 5 ,y: moneyLabel.bounds.height/2)
        moneyLabel.text = "Money: \(money)"
        stuffToRemove.append(moneyLabel)
        
        lifeLabel.textAlignment = NSTextAlignment.right
        lifeLabel.text = "Lifes: \(enemiesThatCanGoesThroughBeforeLosing)"
        lifeLabel.center = CGPoint(x: (self.frame.maxX - lifeLabel.bounds.width/2) - 5 ,y: moneyLabel.bounds.height/2 + lifeLabel.bounds.height/2 + 10)
        stuffToRemove.append(lifeLabel)
        self.view!.addSubview(lifeLabel)
        
        
        restartButton.size = CGSize(width: trapSize, height: trapSize)
        restartButton.position = CGPoint(x: frame.width - moneyLabel.bounds.width / 2 - restartButton.size.width/2, y: frame.height - restartButton.size.height/2)
        addChild(restartButton)
        
        pauseButton.size = CGSize(width: trapSize, height: trapSize)
        pauseButton.position = CGPoint(x: frame.width - moneyLabel.bounds.width / 2 - trapSize * 1.5 , y: frame.height - restartButton.size.height / 2)
        addChild(pauseButton)
        
        pauseLabel.position = CGPoint(x: frame.width/2, y: frame.height/2)
        pauseLabel.zPosition = 50
        
        let extraTrap = Trap()
        extraTrap.position = CGPoint(x: -100, y: -100)
        extraTrap.size = CGSize(width: trapSize, height: trapSize)
        traps.append(extraTrap)

        //print("1")
        gameGrid = GKGridGraph(fromGridStartingAt: int2(0, 0), width: Int32(19), height: Int32(13), diagonalsAllowed: false)
//            GKGridGraph(fromGridStartingAt: int2(0, 0), width: Int32(CGRectGetMaxX(self.frame)), height: Int32(CGRectGetMaxY(self.frame)), diagonalsAllowed: false)
//        enemyGrid = GKGridGraph(fromGridStartingAt: int2(0, 0), width: Int32(CGRectGetMaxX(self.frame)), height: Int32(CGRectGetMaxY(self.frame)), diagonalsAllowed: false)
//        enemyGrid = GKGridGraph(nodes: [])
        enemyGrid = GKGridGraph(fromGridStartingAt: int2(0, 0), width: Int32(19), height: Int32(13), diagonalsAllowed: false)

        gridStart = CGPoint(x: self.frame.minX+(self.frame.height - 19 * trapSize), y: self.frame.minY+(self.frame.height - 13 * trapSize))
        gridNodes.position = CGPoint(x: trapSideBar.size.width, y: 0)
        gridStart = gridNodes.position
//        //print(gridNodes.position)
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
        var index = 0
        for row in 0 ..< 13 {
            for col in 0 ..< 19 {
                let mapPath = map.template[row][col]
                let Path = SKSpriteNode(imageNamed: "path")
                Path.size = CGSize(width: trapSize, height: trapSize)
                Path.position = CGPoint(x: CGFloat(col) * trapSize + trapSideBar.size.width + trapSize/2, y: CGFloat(row) * trapSize + trapSize/2)
                //print( CGFloat(col) * trapSize + trapSideBar.size.width)
                
                if mapPath == "water" {
                let water = SKSpriteNode()
                water.size = Path.size
                water.position = Path.position
                water.color = UIColor.blue
                water.zPosition = -1
                addChild(water)
                paths.append(water)
//                waterPositions.append(CGPoint(x: Int(water.position.x), y: Int(water.position.y)))'
                    
                waterPositions.append(coordinateFromPoint(water.position))
                }
                if mapPath == "path"{
                    paths.append(Path)
                    index += 1
//                    //print(Path.position)
//                    //print("_________")
                    Path.zPosition = -1
                    self.addChild(Path)
//                    pathPositions.append(CGPoint(x: Int(Path.position.x), y: Int(Path.position.y)))
                    //print(Path.position)
                    let pathCoordinate = coordinateFromPoint(Path.position)
                    pathPositions.append(pathCoordinate)
                } else {
//                    var obstacle = GKPolygonObstacle()
//                    enemyGrid.addNodes([gameGrid.nodeAtGridPosition(coordinateFromPoint((Path.position)))!])
//                    enemyGrid.addObstacles([obstacle])
                    enemyGrid.remove([enemyGrid.node(atGridPosition: coordinateFromPoint((Path.position)))!])
                    
                    
//                    obstacle.dynamicType.init(points: enemyGrid.nodeAtGridPosition(coordinateFromPoint((Path.position)))!/*, UnsafeMutablePointer<vector_float2>*/, count: 3)
                    
                }
            }
            
        }
        
        enemyPath = enemyGrid.node(atGridPosition: pathPositions[map.startIndex])!.findPath(to: (enemyGrid.node(atGridPosition: pathPositions[0]))!) as! [GKGridGraphNode]
        enemyPath.remove(at: 0)
        startWaveButton.size = CGSize(width: trapSize, height: trapSize)
        startWaveButton.position = pointFromCoordinate(int2(0,12))
        addChild(startWaveButton)
        if runningTutorial {
        currentSpeechBubble = SpeechBubble(arrowDirection: .left, Text: "This is where your selected traps are, select the spike trap.")
        currentSpeechBubble?.load(scene: self, position: CGPoint(x: trapSideBar.size.width + trapSize * 4 , y: trapSize * 1), size: CGSize(width: trapSize * 8, height: trapSize * 2))
        }
        hasRunTutorial = runningTutorial
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.location(in: self)
            //print(location)
            //print(pauseButton.position)
            if location.x <= pauseButton.position.x + trapSize/2 && location.x >= pauseButton.position.x - trapSize/2 && location.y <= pauseButton.position.y + trapSize/2 && location.y >= pauseButton.position.y - trapSize/2{
                if isPaused == false {
                    isPaused = true
                    gameIsPaused = true
                    addChild(pauseLabel)
                    pauseButton.texture = SKTexture(imageNamed: "playButton")
                    
                    break
                } else {
                    pauseButton.texture = SKTexture(imageNamed: "pauseButton")
                    pauseLabel.removeFromParent()
                    gameIsPaused = false
                    isPaused = false
                    break
                }
            }
            if isPaused == false {
            if self.atPoint(location) != trapSideBar {
                if gameGrid.node(atGridPosition: coordinateFromPoint(location)) != nil {
                    let coordinate = coordinateFromPoint(location)
////                    let trapPosition = CGPoint(x: CGFloat(Int(CGFloat(trapNode.gridPosition.x) * trapSize + trapSideBar.size.width + trapSize/2)), y: CGFloat(Int(CGFloat(trapNode.gridPosition.y) * trapSize + trapSize/2)))
                    let trapPosition = pointFromCoordinate(coordinate)
                    if atPoint(location) == startWaveButton {
                        if currentSpeechBubble != nil {
                            currentSpeechBubble?.textLabel.removeFromSuperview()
                            currentSpeechBubble?.speechBubble?.removeFromParent()
                            currentSpeechBubble = nil
                        }
                        runningTutorial = false
                        startedWave = true
                        startWaveButton.removeFromParent()
                        time = 0
                        break
                    }
                    // if tap on restart button
                    if location.x <= restartButton.position.x + trapSize/2 && location.x >= restartButton.position.x - trapSize/2 && location.y <= restartButton.position.y + trapSize/2 && location.y >= restartButton.position.y - trapSize/2 {
                        let scene = GameScene(size: self.size)
                        for stuff in stuffToRemove {
                            stuff.removeFromSuperview()
                        }
                        scene.wonLevel = false
                        let skView = self.view! as SKView
                        skView.ignoresSiblingOrder = true
                        scene.scaleMode = .resizeFill
                        scene.size = skView.bounds.size
                        skView.presentScene(scene, transition: .fade(with: UIColor.black, duration: 3.0))
                        
                    }
//                  show upgrades
                    if showUpgrades(coordinate: coordinate) == false {
                        for trap in traps { /*trapPositions.append(trap.position)*/
                            let trapCoordinate = coordinateFromPoint(trap.position)
                            if trapCoordinate.x == coordinate.x && trapCoordinate.y == coordinate.y {
                                addUpgradeBars(trapPosition, trap: trap)
                            }
                        }

                        let basicTrap = createTrap(basicSideBarTrap, trapID: "basicTrap", positionOfTrap: trapPosition, canBeOnPath: true,cost: 100, attackDamage: 4, upgradeName: "attackDamage", upgradeMultiplier: 5, upgradeArray: [basicSideBarTrap.texture! , SKTexture(imageNamed: "basicTrapUpgrade1")])
                        if runningTutorial && basicTrap.madeTrap{
                            if currentSpeechBubble != nil {
                                currentSpeechBubble?.textLabel.removeFromSuperview()
                                currentSpeechBubble?.speechBubble?.removeFromParent()
                                currentSpeechBubble = nil
                                
                            }
                            currentSpeechBubble = SpeechBubble(arrowDirection: .left, Text: "There are also support towers that can't be placed on the track, select the hospital.")
                            currentSpeechBubble?.load(scene: self, position: CGPoint(x: trapSideBar.size.width + trapSize * 4 , y: trapSize * 2), size: CGSize(width: trapSize * 8, height: trapSize * 2))
                        }
                    basicTrap.trap.energy = 0
                    basicTrap.trap.maxEnergy = 0
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
////                                //print("made a basic trap")
//                    
////                    if batterySideBarTrap.selected == true{
////                        let battery = SKSpriteNode(imageNamed: "battery")
////                        battery.size = CGSize(width: trapSize, height: trapSize)
////                        //                        basicTrap.position = pointFromCoordinate(trapNode.gridPosition)
////                        battery.position = trapPosition
////                        battery.zPosition = 2
////                            if pathPositions.contains(battery.position) == false {
////                                self.addChild(battery)
////                                //print("battery")
////                            }
////                        
////                        //print("___")
////                    }
////                    if wireSideBarTrap.selected == true{
////                        let wire = SKSpriteNode(imageNamed: "wire")
////                        wire.size = CGSize(width: trapSize, height: trapSize)
////                        //                        basicTrap.position = pointFromCoordinate(trapNode.gridPosition)
////                        wire.position = trapPosition
////                        wire.zPosition = 2
////                        if pathPositions.contains(wire.position) == false {
////                            self.addChild(wire)
////                            //print("wire")
////                        }
////                        
////                        //print("___")
////                    }
////                    if hospitalSideBarTrap.selected == true{
////                        let hospital = SKSpriteNode(imageNamed: "hospital")
////                        hospital.size = CGSize(width: trapSize, height: trapSize)
////                        //                        basicTrap.position = pointFromCoordinate(trapNode.gridPosition)
////                        hospital.position = trapPosition
////                        hospital.zPosition = 2
////                        if pathPositions.contains(hospital.position) == false {
////                            self.addChild(hospital)
////                            //print("hospital")
////                        }
////                        
////                        //print("___")
////                    }
//                    
////                    let touchPosition = CGPointMake(CGFloat(coordinate.x) * trapSize + gridStart.x + trapSize / 2, CGFloat(coordinate.y) * trapSize + gridStart.y + trapSize / 2)
////                    let touchPositionInt = CGPointMake(CGFloat(Int(touchPosition.x)), CGFloat(Int(touchPosition.y)))
////                    let touchPositionTestingForRightX = CGPointMake(CGFloat(Int(touchPosition.x - trapSize)), CGFloat(Int(touchPosition.y)))
////                    let touchPositionTestingForLeftX = CGPointMake(CGFloat(Int(touchPosition.x + trapSize)), CGFloat(Int(touchPosition.y)))
////                    let touchPositionTestingForUpperY = CGPointMake(CGFloat(Int(touchPosition.x)), CGFloat(Int(touchPosition.y + trapSize)))
////                    let touchPositionTestingForLowerY = CGPointMake(CGFloat(Int(touchPosition.x)), CGFloat(Int(touchPosition.y - trapSize)))
//                    
//                    
                    var waterWheel = createTrap(waterWheelSideBarTrap, trapID: "waterWheel", positionOfTrap: trapPosition, canBeOnPath: false, cost: 150, attackDamage: 0, upgradeName: "energyGenerated", upgradeMultiplier: 0.5, upgradeArray: [waterWheelSideBarTrap.texture!])
                    let waterWheelTrap = waterWheel.trap
                    if waterWheel.madeTrap && contains(waterPositions, itemChecked: coordinateFromPoint(waterWheelTrap.position))/*waterPositions.contains(coordinateFromPoint(waterWheelTrap.position))*/ == false {
                        waterWheelTrap.maxEnergyBar.removeFromParent()
                        waterWheelTrap.healthBar.removeFromParent()
                        waterWheelTrap.maxHealthBar.removeFromParent()
                        waterWheelTrap.energyBar.removeFromParent()
                        waterWheelTrap.removeFromParent()
                        traps.remove(at: traps.index(of: waterWheelTrap)!)
                        money += 150
                        moneyLabel.text = "Money: \(money)"
                        waterWheel.madeTrap = false
                    }
                    waterWheel.trap.energy = 0
                    waterWheel.trap.maxEnergy = 200
                    
                    let freezeTrap = createTrap(freezeSideBarTrap, trapID: "freezeTrap", positionOfTrap: trapPosition, canBeOnPath: true, cost: 150, attackDamage: 1, upgradeName: "maxSecondsFrozen", upgradeMultiplier: 2, upgradeArray: [freezeSideBarTrap.texture!])

                    let powerPlant = createTrap(powerPlantSideBarTrap, trapID: "powerPlant", positionOfTrap: trapPosition, canBeOnPath: false, cost: 500, attackDamage: 0, upgradeName: "sellAmount", upgradeMultiplier: 0.5, upgradeArray: [powerPlantSideBarTrap.texture!])
                    powerPlant.trap.energy = 0
                    powerPlant.trap.maxEnergy = 200

                    let bombTrap = createTrap(bombSideBarTrap, trapID: "bombTrap", positionOfTrap: trapPosition, canBeOnPath: true, cost: 50, attackDamage: 100, upgradeName: "attackDamage", upgradeMultiplier: 5, upgradeArray: [bombSideBarTrap.texture!])


                        let reverseTrap = createTrap(reverseSideBarTrap, trapID: "reverseTrap", positionOfTrap: trapPosition, canBeOnPath: true, cost: 200, attackDamage: 3, upgradeName: "bounceBackSpaces", upgradeMultiplier: 6, upgradeArray: [reverseSideBarTrap.texture!, SKTexture(imageNamed: "reverseTrapUpgradedOne")])

                        let poisonTrap = createTrap(poisonSideBarTrap, trapID: "poisonTrap", positionOfTrap: trapPosition, canBeOnPath: true, cost: 250, attackDamage: 2, upgradeName: "maxSecondsPoisoned", upgradeMultiplier: 5, upgradeArray: [poisonSideBarTrap.texture! ,SKTexture(imageNamed: "oneUpgradePoisonTrap")])

                    let windTurbine = createTrap(windTurbineSideBarTrap, trapID: "windTurbine", positionOfTrap: trapPosition, canBeOnPath: false, cost: 50, attackDamage: 0, upgradeName: "energyGenerated", upgradeMultiplier: 0.2, upgradeArray: [windTurbineSideBarTrap.texture!, SKTexture(imageNamed: "windTurbineUpgrade1"), SKTexture(imageNamed: "windTurbineUpgrade2")])
                    windTurbine.trap.energy = 0
                        if runningTutorial && windTurbine.madeTrap {
                            if currentSpeechBubble != nil {
                                currentSpeechBubble?.textLabel.removeFromSuperview()
                                currentSpeechBubble?.speechBubble?.removeFromParent()
                                currentSpeechBubble = nil
                            }
                            currentSpeechBubble = SpeechBubble(arrowDirection: .left, Text: "When you are ready tap the start button it will start the wave, note: it takes about 3 spike traps to destroy a blue enemy, good luck!")
                            currentSpeechBubble?.load(scene: self, position: CGPoint(x: trapSideBar.size.width + trapSize * 5 , y: startWaveButton.position.y), size: CGSize(width: trapSize * 8, height: trapSize * 2))
                            runningTutorial = false
                        }
                    let battery = createTrap(batterySideBarTrap, trapID: "battery", positionOfTrap: trapPosition, canBeOnPath: false, cost: 75, attackDamage: 0, upgradeName: "maxEnergy", upgradeMultiplier: 0.01, upgradeArray: [batterySideBarTrap.texture!])
                    battery.trap.energy = 0
                    battery.trap.maxEnergy = 800
                    let wire = createTrap(wireSideBarTrap, trapID: "wire", positionOfTrap: trapPosition, canBeOnPath: false, cost: 25, attackDamage: 0, upgradeName: "maxEnergy", upgradeMultiplier: 0.005, upgradeArray: [wireSideBarTrap.texture!])
                    wire.trap.energy = 0
                    let hospital = createTrap(hospitalSideBarTrap, trapID: "hospital", positionOfTrap: trapPosition, canBeOnPath: false, cost: 150, attackDamage: 0, upgradeName: "healAmount", upgradeMultiplier: 25, upgradeArray: [hospitalSideBarTrap.texture!])
                        if runningTutorial && hospital.madeTrap {
                            if currentSpeechBubble != nil {
                                currentSpeechBubble?.textLabel.removeFromSuperview()
                                currentSpeechBubble?.speechBubble?.removeFromParent()
                                currentSpeechBubble = nil
                            }
                            currentSpeechBubble = SpeechBubble(arrowDirection: .left, Text: "select the wind turbine, this produces energy to power other buildings")
                            currentSpeechBubble?.load(scene: self, position: CGPoint(x: trapSideBar.size.width + trapSize * 4 , y: trapSize * 3), size: CGSize(width: trapSize * 8, height: trapSize * 2))
                        }
                    if hospital.madeTrap {
                        let Area = SKShapeNode()
                        let AreaPath = UIBezierPath()
                        AreaPath.addArc(withCenter: trapPosition, radius: trapSize * 3, startAngle: 0, endAngle: CGFloat(M_PI*2), clockwise: true)
                        AreaPath.stroke()
                        Area.path = AreaPath.cgPath
                        hospital.trap.radius = Area
                        self.addChild(Area)
                        hospitals.append(hospital.trap)
                        hospitalRepairArea.append(Area)
                        for trap in traps {
                            if Area.contains(trap.position) {
                                healingTraps.append(trap)
                            }
                        }
                    }
                    for trap  in traps {
                        let trapCoordinate = coordinateFromPoint(trap.position)
                        if /*trap.position == touchPositionTestingForLeftX || trap.position == touchPositionTestingForRightX || trap.position == touchPositionTestingForUpperY || trap.position == touchPositionTestingForLowerY*/ (trapCoordinate.x == coordinate.x && (trapCoordinate.y == coordinate.y - 1 || trapCoordinate.y == coordinate.y + 1)) || (trapCoordinate.y == coordinate.y && (trapCoordinate.x == coordinate.x - 1 || trapCoordinate.x == coordinate.x + 1)) {
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
////                            //print(connectedItems)
////                            //print("connectedItemsAbove")
                            
                            for otherTrap in [basicTrap, battery, wire, windTurbine, hospital, powerPlant, poisonTrap, freezeTrap, reverseTrap, waterWheel] {
                                if otherTrap.0 {
                                    connectedItems.append([trap, otherTrap.1])
                                }
                            }
                        }
////                        if trapDestroyingHammer.selected {
////                            //print(trap.position)
////                            if  trapCoordinate.x == coordinateFromPoint(trapPosition).x && trapCoordinate.y == coordinateFromPoint(trapPosition).y {
////                                
////                                if trap.ID == "hospital" {
////                                    trap.radius.removeFromParent()
////                                    hospitals.removeAtIndex(hospitals.indexOf(trap)!)
////                                }
////                                money += trap.cost/2
////                                moneyLabel.text = "Money: \(money)"
////                                traps.removeAtIndex(traps.indexOf(trap)!)
////                                trap.energyBar.removeFromParent()
////                                trap.maxEnergyBar.removeFromParent()
////                                trap.healthBar.removeFromParent()
////                                trap.maxHealthBar.removeFromParent()
////                                trap.removeFromParent()
////                                for item in connectedItems {
////                                    if item[0] == trap || item[1] == trap{
//////                                        var itemIndex = 0
////                                        for index in 0..<connectedItems.count {
////                                            if connectedItems[index] == item {
//////                                                connectedItems.removeAtIndex(index)
////                                                break
////                                            }
////                                        }
////                                        
////                                    }
////                                }
////                            }
////                        }
                    }
////                    if windTurbine.trap.position == touchPositionTestingForLeftX || windTurbine.trap.position == touchPositionTestingForRightX || windTurbine.trap.position == touchPositionTestingForUpperY || windTurbine.trap.position == touchPositionTestingForLowerY {
////                        for  trap in traps {
////                            if trap.position
////                        }
////                        connectedItems.append([])
////                    }
                }
//
            }
//            let trapTypes = [basicSideBarTrap,batterySideBarTrap, wireSideBarTrap, hospitalSideBarTrap, windTurbineSideBarTrap, poisonSideBarTrap, trapDestroyingHammer, powerPlantSideBarTrap, freezeSideBarTrap, reverseSideBarTrap, waterWheelSideBarTrap, bombSideBarTrap]
            
//            let selectedTrapTypes = [basicSideBarTrapSelectedPic, batterySideBarTrapSelectedPic, wireSideBarTrapSelectedPic, hospitalSideBarTrapSelectedPic, windTurbineSideBarTrapSelectedPic,poisonSideBarTrapSelectedPic, powerPlantSideBarTrapSelectedPic, freezeSideBarTrapSelectedPic, reverseSideBarTrapSelectedPic, waterWheelSideBarTrapSelectedPic, bombSideBarTrapSelected]
            
                for trap in trapTypes {
                    trapTouchControl(trap, selectedTrap: selectedTrapTypes[trapTypes.index(of: trap)!], touch: self.atPoint(location), otherTraps: trapTypes, otherTrapsSelected: selectedTrapTypes)
                }
//            trapTouchControl(basicSideBarTrap, selectedTrap: basicSideBarTrapSelectedPic,  touch: self.atPoint(location), otherTraps: /*[batterySideBarTrap, wireSideBarTrap, hospitalSideBarTrap, windTurbineSideBarTrap, poisonSideBarTrap, trapDestroyingHammer, powerPlantSideBarTrap, freezeSideBarTrap]*/ trapTypes, otherTrapsSelected: /*[batterySideBarTrapSelectedPic, wireSideBarTrapSelectedPic, hospitalSideBarTrapSelectedPic, windTurbineSideBarTrapSelectedPic,poisonSideBarTrapSelectedPic, trapDestroyingHammerSelectedPic, powerPlantSideBarTrapSelectedPic, freezeSideBarTrapSelectedPic]*/selectedTrapTypes)
//                
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
////            trapTouchControl(trapDestroyingHammer, selectedTrap: trapDestroyingHammerSelectedPic, touch: self.atPoint(location), otherTraps: /*[basicSideBarTrap, batterySideBarTrap, wireSideBarTrap, hospitalSideBarTrap, windTurbineSideBarTrap, poisonSideBarTrap, powerPlantSideBarTrap, freezeSideBarTrap]*/trapTypes, otherTrapsSelected: /* [basicSideBarTrapSelectedPic, batterySideBarTrapSelectedPic, wireSideBarTrapSelectedPic, hospitalSideBarTrapSelectedPic, windTurbineSideBarTrapSelectedPic, poisonSideBarTrapSelectedPic, powerPlantSideBarTrapSelectedPic, freezeSideBarTrapSelectedPic]*/selectedTrapTypes)
//            
//            trapTouchControl(powerPlantSideBarTrap , selectedTrap: powerPlantSideBarTrapSelectedPic, touch: self.atPoint(location), otherTraps: /*[basicSideBarTrap, batterySideBarTrap, wireSideBarTrap, hospitalSideBarTrap, windTurbineSideBarTrap, poisonSideBarTrap, trapDestroyingHammer, freezeSideBarTrap]*/trapTypes, otherTrapsSelected:/* [basicSideBarTrapSelectedPic, batterySideBarTrapSelectedPic, wireSideBarTrapSelectedPic, hospitalSideBarTrapSelectedPic, windTurbineSideBarTrapSelectedPic, poisonSideBarTrapSelectedPic, trapDestroyingHammerSelectedPic, freezeSideBarTrapSelectedPic]*/ selectedTrapTypes)
//            
//            trapTouchControl(freezeSideBarTrap, selectedTrap: freezeSideBarTrapSelectedPic, touch: self.atPoint(location), otherTraps: trapTypes/*[basicSideBarTrap, batterySideBarTrap, wireSideBarTrap, hospitalSideBarTrap, windTurbineSideBarTrap, poisonSideBarTrap, trapDestroyingHammer, powerPlantSideBarTrap]*/, otherTrapsSelected:/*[basicSideBarTrapSelectedPic, batterySideBarTrapSelectedPic, wireSideBarTrapSelectedPic, hospitalSideBarTrapSelectedPic, windTurbineSideBarTrapSelectedPic, poisonSideBarTrapSelectedPic, trapDestroyingHammerSelectedPic, powerPlantSideBarTrapSelectedPic]*/selectedTrapTypes)
//            
//            trapTouchControl(reverseSideBarTrap, selectedTrap: reverseSideBarTrapSelectedPic, touch: self.atPoint(location), otherTraps: trapTypes, otherTrapsSelected: selectedTrapTypes)
//            
//            trapTouchControl(waterWheelSideBarTrap, selectedTrap: waterWheelSideBarTrapSelectedPic, touch: self.atPoint(location), otherTraps: trapTypes, otherTrapsSelected: selectedTrapTypes)
//                
//            trapTouchControl(bombSideBarTrap, selectedTrap: bombSideBarTrapSelected, touch: atPoint(location), otherTraps: trapTypes, otherTrapsSelected: selectedTrapTypes)
                }
            }
        }
        
    }
   
    override func update(_ currentTime: TimeInterval) {
//        if gameIsPaused == false {
        if isPaused == false {
        if runningWave == true {
            for trap in traps {
                var attacked = false
                for enemy in enemies {
                    if ((trap.position.x - trapSize/2) <= enemy.position.x && (trap.position.x + trapSize/2) >= enemy.position.x) && (trap.position.y - trapSize/2) <= enemy.position.y && (trap.position.y + trapSize/2) >= enemy.position.y && trap.timeSinceLastAttack >= trap.reloadTime {
                        if trap.ID == "basicTrap" {
//                            enemy.life -= 4
                            //print("basicTrap attacked")
                        }else if trap.ID == "bombTrap" {
                            trap.life = 0
                        }else if trap.ID == "poisonTrap" && trap.energy >= 10{
//                            enemy.life -= 2
                            enemy.secondsPoisoned = 0
                            enemy.maxSecondsPoisoned = Int(trap.maxSecondsPoisoned)
                            trap.energy -= 10
                            //print("poisonTrap attacked")
                            enemy.poisoned = true
                            //print(enemy.poisoned)
                        } else if trap.ID == "freezeTrap"  && trap.energy >= 15{
//                            enemy.life -= 1
                            trap.energy -= 15
                            enemy.secondsFrozen = 0
                            if enemy.frozen == false {
                                enemy.frozen = true
                                enemy.duration = enemy.duration * 2
                                addActions(enemy, position: enemy.position)
//                            var sequence = [SKAction]()
//                            enemy.removeAllActions()
//                            var enemyPath = enemyGrid.nodeAtGridPosition(coordinateFromPoint(enemy.position))!.findPathToNode((enemyGrid.nodeAtGridPosition(coordinateFromPoint(pathPositions[0])))!) as! [GKGridGraphNode]
//                                
//                            enemyPath.removeAtIndex(0)
//                            for node in enemyPath {
//                                let action = SKAction.moveTo(pointFromCoordinate(node.gridPosition), duration: enemy.duration)
//                                let update = SKAction.runBlock() { [unowned self] in
//                                    //                    mediumEnemy.position = self.pointFromCoordinate(node.gridPosition)
//                                }
//                                sequence += [action, update]
//                            }
//                            //            //print("going to run action")
//                            enemy.runAction(SKAction.sequence(sequence))
                            }
                        } else if trap.ID == "reverseTrap"  && trap.energy >= 20{
//                            enemy.life -= 3
                            trap.energy -= 20
                            
                            var reversedPosition = int2()
                            let isOnFirstRow = false
//                            for tile in pathPositions[(pathPositions.count - map.startIndex)..<pathPositions.count] {
//                                if tile.y == coordinateFromPoint(trap.position).y {
//                                    reversedPosition = CGPoint(x: trap.position.x - (CGFloat(trap.bounceBackSpaces) * trapSize), y: trap.position.y)
//                                    isOnFirstRow = true
//                                    break
//                                }
//                                
//                            }
                            let pathNodesInOrder = enemyGrid.node(atGridPosition: pathPositions[map.startIndex])!.findPath(to: (enemyGrid.node(atGridPosition: pathPositions[0]))!) as! [GKGridGraphNode]
                            
                            for node in pathNodesInOrder {
                                let trapCoordinate = coordinateFromPoint(trap.position)
                                if node.gridPosition.x == trapCoordinate.x && node.gridPosition.y == trapCoordinate.y {
                                    reversedPosition = pathNodesInOrder[pathNodesInOrder.index(of: node)! - Int(trap.bounceBackSpaces)].gridPosition
                                }
                            }
//                            if pathNodesInOrder[0].gridPosition == coordinateFromPoint(trap.position){
                            
//                            }
                            
                            if isOnFirstRow == false {
//                                reversedPosition = pathPositions[pathPositions.indexOf(coordinateFromPoint(trap.position))! + 5]
                            }
                            if enemyGrid.node(atGridPosition: reversedPosition) == nil {
//                                        reversedPosition = pathPositions[map.startIndex]
                            }
                            addActions(enemy, position: pointFromCoordinate(reversedPosition))
                        }
                        
                        enemy.life -= trap.attackDamage
                        
                        
                        if enemy.life <= 0 {
                            //                                //print("enemy has died")
                            money += 25
                            moneyLabel.text = "Money: \(money)"
                            enemy.removeAllActions()
                            enemy.removeFromParent()
                            enemy.healthBar.removeFromParent()
                            enemy.maxHealthBar.removeFromParent()
                            enemies.remove(at: enemies.index(of: enemy)!)
                        }
                        
                        
                        
                        trap.life -= 2
                        attacked = true
//                                                    //print(enemy.life)
                        //                            //print(trap.life)
                        
                        if trap.life <= 0 {
                            //                            let node = GKGridGraphNode(gridPosition: coordinateFromPoint(trap.position))
                            //                            gameGrid.addNodes([node])
                            //                            //print(node)
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
            
            
            
//            if enemy.hasActions() == false {
//                enemiesThatCanGoesThroughBeforeLosing -= 1
//                
//                lifeLabel.text = "Lifes: \(enemiesThatCanGoesThroughBeforeLosing)"
////                //print("lost life")
//                enemies.removeAtIndex(enemies.indexOf(enemy)!)
//                enemy.healthBar.removeFromParent()
//                enemy.maxHealthBar.removeFromParent()
//                enemy.removeFromParent()
//            }
            
//            if enemy.life <= 0 {
//                //                                //print("enemy has died")
//                money += 25
//                moneyLabel.text = "Money: \(money)"
//                enemy.removeAllActions()
//                enemy.removeFromParent()
//                enemy.healthBar.removeFromParent()
//                enemy.maxHealthBar.removeFromParent()
//                enemies.removeAtIndex(enemies.indexOf(enemy)!)
//            }
        }
        
            if currentTime >= lastTimeCalled + 0.5 {
                if numberOfBlinks < 10{
                    if moneyLabel.textColor == UIColor.red {
                        moneyLabel.textColor = UIColor.black
                    } else {
                        moneyLabel.textColor = UIColor.red
                    }
                    numberOfBlinks += 1
                }
            }
            
        
        if currentTime >= lastTimeCalled + 1 {
            if shouldWait {
                sleep(5)
                let rootViewController:UIViewController=UIApplication.shared.keyWindow!.rootViewController!
//                let adViewController = AdViewController()
//                AdViewController.init()
//                for enemy in enemies {
//                    enemy.removeFromParent()
//                }
                if intersitial.isReady {
                    intersitial.present(fromRootViewController: rootViewController)
                }
                
                let scene = GameScene(size: self.size)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                if hasRunTutorial {
                    GameScene().wonLevel = false
                }
                scene.size = skView.bounds.size
                skView.presentScene(scene, transition: .fade(with: UIColor.black, duration: 3.0))
                for item in stuffToRemove {
                    item.removeFromSuperview()
                }
            }
            if enemiesThatCanGoesThroughBeforeLosing <= 0 {
                let loselabel = SKLabelNode(text: "You Lose")
                loselabel.position = CGPoint(x: frame.midX, y: frame.midY)
                loselabel.zPosition = 100
                loselabel.fontColor = UIColor.white
                loselabel.fontSize = 64
                addChild(loselabel)
                shouldWait = true
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
            // share energy but only if wave has started
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
                if enemy.hasActions() == false {
                    enemiesThatCanGoesThroughBeforeLosing -= 1
                    
                    lifeLabel.text = "Lifes: \(enemiesThatCanGoesThroughBeforeLosing)"
                    //                //print("lost life")
                    enemies.remove(at: enemies.index(of: enemy)!)
                    enemy.healthBar.removeFromParent()
                    enemy.maxHealthBar.removeFromParent()
                    enemy.removeFromParent()
                }

                if enemy.poisoned == true && enemy.secondsPoisoned <= enemy.maxSecondsPoisoned {
                    enemy.life -= 2
                    enemy.secondsPoisoned += 1
                    if enemy.life <= 0 {
                        //                                //print("enemy has died")
                        money += 25
                        moneyLabel.text = "Money: \(money)"
                        enemy.removeAllActions()
                        enemy.removeFromParent()
                        enemy.healthBar.removeFromParent()
                        enemy.maxHealthBar.removeFromParent()
                        enemies.remove(at: enemies.index(of: enemy)!)
                    }
                }
                if enemy.frozen {
                    if enemy.secondsFrozen <= enemy.maxSecondsFrozen {
                    enemy.secondsFrozen += 1
                    } else {
                        enemy.frozen = false
                        enemy.duration = enemy.duration / 2
                        addActions(enemy, position: enemy.position)
//                        var sequence = [SKAction]()
//                        var enemyPath = enemyGrid.nodeAtGridPosition(coordinateFromPoint(enemy.position))!.findPathToNode((enemyGrid.nodeAtGridPosition(coordinateFromPoint(pathPositions[0])))!) as! [GKGridGraphNode]
//                        
//                        enemyPath.removeAtIndex(0)
//                        for node in enemyPath {
//                            let action = SKAction.moveTo(pointFromCoordinate(node.gridPosition), duration: enemy.duration)
//                            let update = SKAction.runBlock() { [unowned self] in
//                                //                    mediumEnemy.position = self.pointFromCoordinate(node.gridPosition)
//                            }
//                            sequence += [action, update]
//                        }
//                        //            //print("going to run action")
//                        enemy.runAction(SKAction.sequence(sequence))
                    }
                }
            }
            for trap in traps {
                if startedWave {
                    if trap.ID == "windTurbine" || trap.ID == "waterWheel" {
                        if trap.energy <= (trap.maxEnergy - trap.energyGenerated){
                        trap.energy += trap.energyGenerated
    //                    //print(trap.energy)
                        }else if trap.energy < trap.maxEnergy {
                            let addedEnergy = trap.maxEnergy - trap.energy
                            trap.energy += addedEnergy
                        }
    //                }else if trap.ID == "waterWheel" {
    //                    if trap.energy <= (trap.maxEnergy - 50) {
    //                        trap.energy += 50
    //                    } else if trap.energy < trap.maxEnergy {
    //                        let addedEnergy = trap.maxEnergy - trap.energy
    //                        trap.energy += addedEnergy
    //                    }
                    
                    } else if trap.ID == "powerPlant"/* && trap.energy >= trap.sellAmount * 10*/ {
    //                    let moneyMade = Int(trap.energy / 10)
                        if trap.energy >= trap.sellAmount * 10 {
                            money += Int(trap.sellAmount)
                            moneyLabel.text = "Money: \(money)"
                            trap.energy -= trap.sellAmount * 10
                        } else {
                            let moneyMade = Int(trap.energy / 10)
                            money += moneyMade
                            moneyLabel.text = "Money: \(money)"
                            trap.energy = 0
                        }
                    }
                }
//                //print(trap.energy)
//                //print(trap.ID)
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
//                    //print("healedTrap")
//                    //print(trap.life)
//                }
//            }
            for hospital in hospitals {
//                //print(hospital.radius)
                for trap in traps {
//                    //print(trap.position)
                    if hospital.radius.contains(trap.position) && hospital.energy >= hospital.healAmount * 10 && trap.life <= (Trap().life - hospital.healAmount){
                        //print(trap.life)
                        trap.life += hospital.healAmount
                        hospital.energy -= hospital.healAmount * 10
                        //print("trap \(trap.ID) has \(trap.life) attacks left")
                        
                    }
                }
                //print("energy: \(hospital.energy)")
            }
//            //print(basicSideBarTrap.selected)
//            //print(basicSideBarTrapSelectedPic.selected)
//            //print("____")
            if startedWave {
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
                        if enemies.count == 0 && enemiesThatCanGoesThroughBeforeLosing >= 0{
    ////                        //print("you win!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    //                        let currentMap = maps.indexOf(mapName)
    //                        mapName = maps[currentMap! + 1]
    //                        GameScene().lastLevel = mapName
                            let Winlabel = SKLabelNode(text: "Level Complete")
                            Winlabel.position = CGPoint(x: frame.midX, y: frame.midY)
                            Winlabel.zPosition = 100
                            Winlabel.fontColor = UIColor.white
                            Winlabel.fontSize = 64
                            addChild(Winlabel)
                            GameScene().unlockedTrapsIndex = map.reward
                            shouldWait = true
    //                        var scene = GameScene(size: self.size)
    //                        let skView = self.view! as SKView
    //                        skView.ignoresSiblingOrder = true
    //                        scene.scaleMode = .ResizeFill
    //                        scene.size = skView.bounds.size
    //                        skView.presentScene(scene)
    ////                        moneyLabel.removeFromSuperview()
    //                        for item in stuffToRemove {
    //                            item.removeFromSuperview()
    //                        }
    //                        didWin = true
                            GameScene().wonLevel = true
                        }
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
    }
    func coordinateFromPoint(_ point: CGPoint) -> int2 {
//        if point.x != nil && point.y != nil {
            return int2(Int32((point.x - gridStart.x) / trapSize), Int32((point.y - gridStart.y) / trapSize))
//        }else {
//            //print("error")
//            return int2()
//        }
    }
    
    func pointFromCoordinate(_ coordinate: int2) -> CGPoint {
        return CGPoint(x: CGFloat(coordinate.x) * trapSize + gridStart.x + trapSize / 2, y: CGFloat(coordinate.y) * trapSize +
            gridStart.y + trapSize / 2)
    }
    func trapTouchControl(_ trap: Trap, selectedTrap: Trap, touch: SKNode, otherTraps: [Trap], otherTrapsSelected: [Trap] ){
        if touch == trap {
            trap.removeFromParent()
            self.addChild(selectedTrap)
            trap.selected = true
            loadDescription(trap)
            
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
                    sideBarTrap.descriptionLabel.removeFromSuperview()
                    sideBarTrap.selected = false
                    otherTrapsSelected[otherTraps.index(of: sideBarTrap)!].removeFromParent()
                    addChild(sideBarTrap)
                    break
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
            if runningTutorial {
                if basicSideBarTrap.selected {
                    if currentSpeechBubble != nil {
                        currentSpeechBubble?.textLabel.removeFromSuperview()
                        currentSpeechBubble?.speechBubble?.removeFromParent()
                        currentSpeechBubble = nil
                    }
                    currentSpeechBubble = SpeechBubble(arrowDirection: .right, Text: "This is the track, waves run along the track, traps are placed on the track place your spike trap")
                    currentSpeechBubble?.load(scene: self, position: CGPoint(x: trapSideBar.size.width + trapSize * 5, y: frame.height/2), size: CGSize(width: trapSize * 8, height: trapSize * 4))
                }else if hospitalSideBarTrap.selected {
                    if currentSpeechBubble != nil {
                        currentSpeechBubble?.textLabel.removeFromSuperview()
                        currentSpeechBubble?.speechBubble?.removeFromParent()
                        currentSpeechBubble = nil
                    }
                    currentSpeechBubble = SpeechBubble(arrowDirection: .right, Text: "place the hospital next to the spike trap, hospitals use energy to heal your traps")
                    currentSpeechBubble?.load(scene: self, position: CGPoint(x: trapSideBar.size.width + trapSize * 4, y: frame.height/2), size: CGSize(width: trapSize * 8, height: trapSize * 4))
                }else if windTurbineSideBarTrap.selected {
                        if currentSpeechBubble != nil {
                            currentSpeechBubble?.textLabel.removeFromSuperview()
                            currentSpeechBubble?.speechBubble?.removeFromParent()
                            currentSpeechBubble = nil
                        }
                        currentSpeechBubble = SpeechBubble(arrowDirection: .right, Text: "place the turbine next to the hospital, buildings next touching each other transfer energy")
                        currentSpeechBubble?.load(scene: self, position: CGPoint(x: trapSideBar.size.width + trapSize * 3, y: frame.height/2), size: CGSize(width: trapSize * 8, height: trapSize * 4))
                }
            }
        }else if touch == selectedTrap {
            selectedTrap.removeFromParent()
            addChild(trap)
            trap.selected = false
            trap.descriptionLabel.removeFromSuperview()
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
    func createTrap(_ sideBarTrap: Trap, trapID: String, positionOfTrap: CGPoint, canBeOnPath: Bool, cost: Int, attackDamage: Double, upgradeName: String, upgradeMultiplier: Double, upgradeArray: [SKTexture]) -> (madeTrap: Bool, trap: Trap){
        if sideBarTrap.selected == true {
//        var requirements = false
//        if canBeOnPath  {
//            requirements = (pathPositions.contains(CGPoint(x: Int(positionOfTrap.x), y: Int(positionOfTrap.y))) == canBeOnPath || pathPositions.contains(CGPoint(x: Int(positionOfTrap.x), y: Int(positionOfTrap.y + 1))) == canBeOnPath)
//        } else {
//            requirements = pathPositions.contains(positionOfTrap) == canBeOnPath && pathPositions.contains(CGPoint(x: Int(positionOfTrap.x), y: Int(positionOfTrap.y + 1))) == canBeOnPath
//        }
        
//        let isOnRightPosition = pathPositions.contains { (trapCoordinate) -> Bool in
//            return
//        }
        let trapCoordinate = coordinateFromPoint(positionOfTrap)
        var isOnRightPosition = false
        for position in pathPositions {
            if position.x == trapCoordinate.x && position.y == trapCoordinate.y {
                isOnRightPosition = true
                
                break
            }
        }
        
        if /* && money >= cost */  isOnRightPosition == canBeOnPath/*requirements*//*(pathPositions.contains(CGPoint(x: Int(positionOfTrap.x), y: Int(positionOfTrap.y))) == canBeOnPath || pathPositions.contains(CGPoint(x: Int(positionOfTrap.x), y: Int(positionOfTrap.y + 1))) == canBeOnPath)*/ {
            
                    var trapPositions = [CGPoint]()
                    let trap = Trap(imageNamed: trapID)
                    trap.size = CGSize(width: trapSize, height: trapSize)
                    trap.position = positionOfTrap
                    trap.zPosition = 2
                    for everyTrap in traps { trapPositions.append(everyTrap.position)}
                    if trapPositions.contains(trap.position) == false {
                        if money >= cost {
                        trap.upgradeMultiplier = upgradeMultiplier
                        trap.upgradeName = upgradeName
                        trap.upgradePictures = upgradeArray
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
                        let healthPath = UIBezierPath(rect: CGRect(x: positionOfTrap.x - trapSize/2, y: positionOfTrap.y + trapSize/2 - trapSize/10, width: trapSize, height: trapSize/10))
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
                        }else {
                            numberOfBlinks = 0
                            moneyLabel.textColor = UIColor.black
                            return (false, sideBarTrap)
                        }
                } else {
                    return (false, sideBarTrap)
                }
            
                }else {
                    return (false, sideBarTrap)
            }
        } else{
            return (false, sideBarTrap)
        }
    }
    func createWave(_ typeOfEnemy: String){
        
        //            let graphNode =
        var sequence = [SKAction]()
        //print(pathPositions[map.startIndex])
        
        
        
//        //print(pathPositions)
        
//        for enemy in 0..<numberOfEnemies {
//            if lastTimeEnemyWasMade == (interval + timeSinceLastEnemyWasMade) {
//            let mediumEnemy = SKSpriteNode(imageNamed: "mediumEnemy")
            let enemy = Enemy(imageNamed: typeOfEnemy)
        let multiplier = (numberOfWaves / 20) + 1
        //print(multiplier)
        if typeOfEnemy == "fastEnemy" {
            enemy.life = 8 * multiplier
            enemy.maxLife = 8 * multiplier
            enemy.duration = 0.5
//            //print("fastEnemy")
            
        } else if typeOfEnemy == "bossEnemy" {
            enemy.life = 35 * multiplier
            enemy.maxLife = 35 * multiplier
        }else if typeOfEnemy == "slowEnemy" {
            enemy.life = 20 * multiplier
            enemy.maxLife = 20 * multiplier
            enemy.duration = 2
//            //print("slowEnemy")
        } else {
            enemy.life = 10 * multiplier
            enemy.maxLife = 10 * multiplier
            enemy.duration = 1
//            //print("medEnemy")
        }
            enemy.size = CGSize(width: trapSize, height: trapSize)
            enemy.position = pointFromCoordinate(pathPositions[map.startIndex])
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
            for node in enemyPath {
                let action = SKAction.move(to: pointFromCoordinate(node.gridPosition), duration: enemy.duration)
                let update = SKAction.run() { [unowned self] in
//                    mediumEnemy.position = self.pointFromCoordinate(node.gridPosition)
                }
                sequence += [action, update]
            }
//            //print("going to run action")
            enemy.run(SKAction.sequence(sequence))
//            //print("ran action")
//            sleep(1)
//            //print("waited")
//            }
            
//        }
//        sleep(1)
    }
    func initTrap(_ trap: Trap, selectedTrap: Trap,  cost: String, descripion: String) {
        for trapTexture in sideBarTraps {
            if trapTexture.description == selectedTrap.texture!.description{
                let firstCoord =  (trapSideBar.size.width / 3) - trapSize / 1.8
                trap.position = CGPoint(x: firstCoord, y: frame.height / 15 + trapSize/20 + spacing * CGFloat(sideBarTraps.index(of: trapTexture)!))
//                let firstColumn = trapSideBar.size.width/5 + trapSize/32
                trap.size = CGSize(width: trapSize,height: trapSize)
//                trap.position = CGPoint(x: firstColumn + spacing * spacesHorizontal, y: firstColumn + spacing * spacesVertical)
//                trap.position = CGPoint(x: firstColumn , y: firstColumn + spacing * CGFloat(sideBarTraps.indexOf(trapTexture)!))
                trap.zPosition = 2
                trap.trapDescription = descripion
                selectedTrap.size = trap.size
                selectedTrap.position = trap.position
                selectedTrap.zPosition = trap.zPosition
//                let xCoordinate = firstColumn + spacing - trapSize/2 + spacing * spacesHorizontal
//                let costLabel = UILabel(frame: CGRect(x: xCoordinate, y: self.frame.maxY - (firstColumn + spacing * spacesVertical) - trapSize/4, width: trapSize * 2, height: trapSize/2))
                
//                costLabel.text = cost
//                view!.addSubview(costLabel)
        //        trap.trapPriceLabel = costLabel
//                stuffToRemove.append(costLabel)
                addChild(trap)
                break
            }
        }
    }
    func addActions(_ enemy: Enemy , position: CGPoint) {
        var sequence = [SKAction]()
        var enemyPath = enemyGrid.node(atGridPosition: coordinateFromPoint(position))!.findPath(to: (enemyGrid.node(atGridPosition: pathPositions[0]))!)  as! [GKGridGraphNode]
        
        enemyPath.remove(at: 0)
        for node in enemyPath {
            let action = SKAction.move(to: pointFromCoordinate(node.gridPosition), duration: enemy.duration)
            let update = SKAction.run() { [unowned self] in
                //                    mediumEnemy.position = self.pointFromCoordinate(node.gridPosition)
            }
            sequence += [action, update]
        }
        //            //print("going to run action")
        enemy.run(SKAction.sequence(sequence))
    }
    func addUpgradeBars(_ trapPosition: CGPoint, trap: Trap) {
        
        let centerCirclePath = UIBezierPath(arcCenter: trapPosition, radius: trapSize * 2, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: false)
//        var upAttackCirclePath = UIBezierPath(arcCenter: CGPoint(x: trapPosition.x, y: trapPosition.y + 2 * trapSize), radius: trapSize, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: false)
//        var upAttackSpeedCirclePath = UIBezierPath(arcCenter: trapPosition, radius: 2, startAngle: 0, endAngle: 360, clockwise: false)
        //        var upLifeCirclePath = UIBezierPath(arcCenter: trapPosition, radius: 2, startAngle: 0, endAngle: 360, clockwise: false)
        let centerCircle = SKShapeNode(path: centerCirclePath.cgPath)
//        var upAttackCircle = SKShapeNode(path: upAttackCirclePath.CGPath)
        let upAttackButton = SKSpriteNode(imageNamed: "upgradeButton")
        let upgradePriceLabel = SKLabelNode(text: "Cost: \(Int(trap.value(forKey: trap.upgradeName) as! Double * trap.upgradeMultiplier + 25))")
        upAttackButton.size = CGSize(width: trapSize, height: trapSize)
        upAttackButton.position = CGPoint(x: trapPosition.x, y: trapPosition.y + round(trapSize * 2))
        //print(upAttackButton.position)
        upAttackButton.zPosition = 20
        upgradePriceLabel.position = CGPoint(x: upAttackButton.position.x, y: upAttackButton.position.y + trapSize/40 - trapSize/2)
        upgradePriceLabel.fontColor = UIColor.black
        upgradePriceLabel.fontSize = trapSize / 5
        upgradePriceLabel.zPosition = 100
        addChild(upgradePriceLabel)
        
        centerCircle.fillColor = UIColor.gray
        centerCircle.strokeColor = UIColor.clear
        centerCircle.alpha = 0.5
        centerCircle.zPosition = 19
        
        let sellButton = SKSpriteNode(imageNamed: "hammer")
        sellButton.size = upAttackButton.size
        sellButton.position = CGPoint(x: trapPosition.x, y: trapPosition.y - round(trapSize * 2))
        sellButton.zPosition = 19
        
        upgradeCircles = [centerCircle, upAttackButton, sellButton, upgradePriceLabel]
        addChild(sellButton)
        addChild(centerCircle)
        addChild(upAttackButton)
        aTrapHasItsUpgradesShown = true
    }
    func contains(_ array: [int2], itemChecked: int2) -> Bool {
        for item in array {
            if item.x == itemChecked.x && item.y == itemChecked.y {
                
                return true
            }
        }
        return false
    }
    func loadDescription(_ trap: Trap) {
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: frame.width/4, height: frame.height/4))
//        var labelText = trap.trapDescription
//        for char in trap.trapDescription.characters {
//            if char == "$" {
//                
//            }
        //        }
        
        label.text = trap.trapDescription
        
//        label.font = UIFont(name: "SFUIText-Regular", size: 5.0)
//        label.drawTextInRect(CGRect(x: frame.maxX - label.bounds.width/2, y: frame.maxY - label.bounds.height/2, width: frame.width/4 - 10, height: frame.height/4 - 10))
        label.numberOfLines = 0
        label.sizeToFit()
//        moneyLabel.center = CGPoint(x: (self.frame.maxX - moneyLabel.bounds.width/2) - 5 ,y: moneyLabel.bounds.height/2)
        label.center = CGPoint(x: frame.maxX - label.bounds.width/2, y: frame.maxY - label.bounds.height/2)
        //print(label.font.fontName)
        
        //print(label.font.fontName)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .right
        label.backgroundColor = UIColor.white
//        label.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        stuffToRemove.append(label)
        trap.descriptionLabel = label
        view!.addSubview(label)
        
    }
//    func pan(gesture: UIPanGestureRecognizer) {
//        switch gesture.state {
//        case .Ended:
//            fallthrough
//        case .Changed:
//            for trap in traps {
//             trap.removeFromParent()
//             trap.position.x += gesture.translationInView(self.view).x
//             addChild(trap)
//            }
//            gridNodes.position.x += gesture.translationInView(self.view).x
//            gesture.setTranslation(CGPointZero, inView: self.view)
//            for path in paths {
//                path.removeFromParent()
//                path.position.x += gesture.translationInView(self.view).x
//                addChild(path)
//            }
//            
//            
//        default:
//            break
//        }
    
//
    func showUpgrades(coordinate: int2) -> Bool {
        if aTrapHasItsUpgradesShown {
            
            if coordinateFromPoint(upgradeCircles[0].position).x != coordinate.x || coordinateFromPoint(upgradeCircles[0].position).y != coordinate.y {
                if (coordinateFromPoint(upgradeCircles[1].position).x != coordinate.x || coordinateFromPoint(upgradeCircles[1].position).y != coordinate.y) && (coordinateFromPoint(upgradeCircles[2].position).x != coordinate.x || coordinateFromPoint(upgradeCircles[2].position).y != coordinate.y) {
                    
                    for circle in upgradeCircles {
                        circle.removeFromParent()
                    }
                    //                              upgradeCircles[0].removeFromParent()
                    //                              upgradeCircles[1].removeFromParent()
                    upgradeCircles.removeAll()
                    aTrapHasItsUpgradesShown = false
                }else {
                    //                                find out what trap is being upgraded
                    for trap in traps {
                        if /*trap.position == CGPoint(x: trapPosition.x, y: trapPosition.y - /*round(*/trapSize * 2/*)*/)*/ coordinate.x == coordinateFromPoint(trap.position).x && coordinate.y - 2 == coordinateFromPoint(trap.position).y {
                            //                                        if pathPositions.contains(coordinateFromPoint(trap.position)) {
                            
                            let upgrade = trap.upgradeName
                            let upgradeValue = trap.value(forKey: upgrade)
                            //                                        let upgradeCost = Int(trap.attackDamage * 4 + 50)
                            let upgradeCost = Int(upgradeValue as! Double * trap.upgradeMultiplier + 25)
                            //                                        if upgrade == "maxEnergy" {
                            //                                            upgradeCost = Int(upgradeValue as! Double / 50 + 50)
                            //                                        }
                            var upgradePictureDescriptions = [String]()
                            for texture in trap.upgradePictures {
                                upgradePictureDescriptions.append(texture.description)
                            }
                            if money - upgradeCost >= 0 {
                                
                                if /*trap.upgradePictures.indexOf((trap.texture!)) != trap.upgradePictures.endIndex - 1*/ upgradePictureDescriptions.index(of: trap.texture!.description) != trap.upgradePictures.endIndex - 1{
                                    //                                            if trap.ID == "basicTrap" {
                                    //                                                trap.attackDamage += trap.attackDamage / 4
                                    //print(trap.attackDamage)
                                    //print(upgradeCost)
                                    //                                                }else if trap.ID == "poisonTrap" {
                                    //                                                    trap.maxSecondsPoisoned += 2
                                    //print(trap.texture)
                                    //print(trap.upgradePictures)
                                    trap.texture = trap.upgradePictures[upgradePictureDescriptions.index(of: (trap.texture!.description))! + 1]
                                    trap.cost += upgradeCost
                                    money -= upgradeCost
                                    moneyLabel.text = "Money: \(money)"
                                    //                                            }
                                    
                                    //                                        }else {
                                    //print(upgradeValue)
                                    trap.setValue((upgradeValue as! Double / 4) + (upgradeValue as! Double), forKey: upgrade)
                                    //print(trap.value(forKey: upgrade))
                                    
                                    let label = SKLabelNode(text: "Cost: \(Int((trap.value(forKey: upgrade) as! Double) * trap.upgradeMultiplier + 25))")
                                    label.position = upgradeCircles[3].position
                                    label.fontSize = trapSize/5
                                    label.zPosition = 100
                                    label.fontColor = UIColor.black
                                    addChild(label)
                                    upgradeCircles[3].removeFromParent()
                                    upgradeCircles[3] = label
                                    
                                    //                                            }
                                }
                            }else {
                                numberOfBlinks = 0
                            }
                        } else if coordinate.x == coordinateFromPoint(trap.position).x && coordinate.y + 2 == coordinateFromPoint(trap.position).y {
                            //                                        find out if the trap is being sold
                            if trap.ID == "hospital" {
                                trap.radius.removeFromParent()
                                hospitals.remove(at: hospitals.index(of: trap)!)
                            }
                            money += trap.cost/2
                            moneyLabel.text = "Money: \(money)"
                            traps.remove(at: traps.index(of: trap)!)
                            trap.energyBar.removeFromParent()
                            trap.maxEnergyBar.removeFromParent()
                            trap.healthBar.removeFromParent()
                            trap.maxHealthBar.removeFromParent()
                            trap.removeFromParent()
                            for circle in upgradeCircles{
                                circle.removeFromParent()
                            }
                            upgradeCircles.removeAll()
                            aTrapHasItsUpgradesShown = false
                            for item in connectedItems {
                                if item[0] == trap || item[1] == trap{
                                    //                                        var itemIndex = 0
                                    for index in 0..<connectedItems.count {
                                        if connectedItems[index] == item {
                                            //                                                connectedItems.removeAtIndex(index)
                                            break
                                        }
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }
            return true
        }
        return false
    }
}
























