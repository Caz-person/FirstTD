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

class PlayScene: SKScene, GADInterstitialDelegate {
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
    var trapSideBar = SKSpriteNode(imageNamed: "trapSideBar")
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
        basicSideBarTrap.name = "basicTrap"
        batterySideBarTrap.name = "battery"
        wireSideBarTrap.name = "wire"
        hospitalSideBarTrap.name = "hospital"
        windTurbineSideBarTrap.name = "windTurbine"
        poisonSideBarTrap.name = "poisonTrap"
        powerPlantSideBarTrap.name = "powerPlant"
        freezeSideBarTrap.name = "freezeTrap"
        reverseSideBarTrap.name = "reverseTrap"
        waterWheelSideBarTrap.name = "waterWheel"
        bombSideBarTrap.name = "bombTrap"
        sleep(1)
        //print("slept")
//         startWaveButton.texture = SKTexture(imageNamed: "arrow")
         bombSideBarTrap.texture  = SKTexture(imageNamed: "bombTrap")
//         bombSideBarTrapSelected.texture = SKTexture(imageNamed: "bombTrapSelected")
         waterWheelSideBarTrap.texture = SKTexture(imageNamed: "waterWheel")
//         waterWheelSideBarTrapSelectedPic.texture = SKTexture(imageNamed: "waterWheelSelected")
         reverseSideBarTrap.texture = SKTexture(imageNamed: "reverseTrap")
//         reverseSideBarTrapSelectedPic.texture = SKTexture(imageNamed: "reverseTrapSelected")
         freezeSideBarTrap.texture = SKTexture(imageNamed: "freezeTrap")
//         freezeSideBarTrapSelectedPic.texture = SKTexture(imageNamed: "freezeTrapSelected")
         powerPlantSideBarTrap.texture = SKTexture(imageNamed: "powerPlant")
//         powerPlantSideBarTrapSelectedPic.texture = SKTexture(imageNamed: "powerPlantSelected")
        sleep(1)
        //print("slept")
//         trapSideBar.texture = SKTexture(imageNamed: "trapSideBar")
//         trapDestroyingHammer.texture = SKTexture(imageNamed: "hammer")
         poisonSideBarTrap.texture = SKTexture(imageNamed: "poisonTrap")
//         poisonSideBarTrapSelectedPic.texture = SKTexture(imageNamed: "poisonTrapSelected")
         windTurbineSideBarTrap.texture = SKTexture(imageNamed: "windTurbine")
//         windTurbineSideBarTrapSelectedPic.texture = SKTexture(imageNamed: "windTurbineSelected")
         hospitalSideBarTrap.texture = SKTexture(imageNamed: "hospital")
//         hospitalSideBarTrapSelectedPic.texture = SKTexture(imageNamed: "hospitalSelected")
         basicSideBarTrap.texture = SKTexture(imageNamed: "basicTrap")
//         basicSideBarTrapSelectedPic.texture = SKTexture(imageNamed: "basicTrapSelected")
         batterySideBarTrap.texture = SKTexture(imageNamed: "battery")
//         batterySideBarTrapSelectedPic.texture = SKTexture(imageNamed: "batterySelected")
         wireSideBarTrap.texture = SKTexture(imageNamed: "wire")
//         wireSideBarTrapSelectedPic.texture = SKTexture(imageNamed: "wireSelected")
        //print("done")
//         restartButton = SKSpriteNode(imageNamed: "restartButton")
//         pauseButton = SKSpriteNode(imageNamed: "pauseButton")

//        trapTypes = [basicSideBarTrap,batterySideBarTrap, wireSideBarTrap, hospitalSideBarTrap, windTurbineSideBarTrap, poisonSideBarTrap, trapDestroyingHammer, powerPlantSideBarTrap, freezeSideBarTrap, reverseSideBarTrap, waterWheelSideBarTrap, bombSideBarTrap]
        
//        selectedTrapTypes = [basicSideBarTrapSelectedPic, batterySideBarTrapSelectedPic, wireSideBarTrapSelectedPic, hospitalSideBarTrapSelectedPic, windTurbineSideBarTrapSelectedPic,poisonSideBarTrapSelectedPic, powerPlantSideBarTrapSelectedPic, freezeSideBarTrapSelectedPic, reverseSideBarTrapSelectedPic, waterWheelSideBarTrapSelectedPic, bombSideBarTrapSelected]
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
        
        var currentTrapTypes = [Trap]()
        var currentSelectedTrapTypes = [Trap]()
        for trapTexture in sideBarTraps {
            for trap in trapTypes {
                if trap.texture!.description == trapTexture.description {
                    var currentTrap = trapTypes[selectedTrapTypes.index(of: trap)!]
                    currentTrapTypes.append(currentTrap)
//                    currentSelectedTrapTypes.append(selectedTrap)
                    
                }
            }
        }
        trapTypes = currentTrapTypes
        selectedTrapTypes = currentSelectedTrapTypes
        //print("current traps \(trapTypes)")
        initTrap(basicSideBarTrap, cost: "100", descripion: "a basic spike trap \n life: \(Int(Trap().life)) \n cost: 100")
//        addChild(basicSideBarTrap)
        
        
        
        
        initTrap(batterySideBarTrap, cost: "75", descripion: "a battery that holds 800 energy \n cost: 75 ")
        
        initTrap(wireSideBarTrap, cost: "25", descripion: "a cheap way to transfer energy \n holds 100 energy \n cost: 25")
        
        initTrap(hospitalSideBarTrap, cost: "150", descripion: "a hospital that heals your damaged traps \n holds 100 energy \n cost: 150")
        
        initTrap(windTurbineSideBarTrap, cost: "50", descripion: "a wind turbine that generates 10 power \n holds 100 energy \n cost: 50")
        
        initTrap(poisonSideBarTrap, cost: "250", descripion: "a poison trap that poisons enemies \n poisons for 5 seconds \n cost: 250")
        
        initTrap(powerPlantSideBarTrap, cost: "500", descripion: "sells energy for money \n cost: 500")
        
        initTrap(freezeSideBarTrap, cost: "150", descripion: "a freeze trap that slows enemies for 5 seconds \n cost: 150")
        
        initTrap(reverseSideBarTrap, cost: "200", descripion: "a spring trap that bounces enemies back 5 spaces \n cost: 200")
        
        initTrap(waterWheelSideBarTrap, cost: "150", descripion: "a water wheel that generates 50 power \n cost: 150")

        initTrap(bombSideBarTrap, cost: "50", descripion: "a bomb that explodes, damaging nearby enemies \n cost: 50")
        
        
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
        enemyGrid = GKGridGraph(fromGridStartingAt: int2(0, 0), width: Int32(19), height: Int32(13), diagonalsAllowed: false)

        gridStart = CGPoint(x: self.frame.minX+(self.frame.height - 19 * trapSize), y: self.frame.minY+(self.frame.height - 13 * trapSize))
        gridNodes.position = CGPoint(x: trapSideBar.size.width, y: 0)
        gridStart = gridNodes.position
 
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
                    
                waterPositions.append(coordinateFromPoint(water.position))
                }
                if mapPath == "path"{
                    paths.append(Path)
                    index += 1
                    Path.zPosition = -1
                    self.addChild(Path)
                    let pathCoordinate = coordinateFromPoint(Path.position)
                    pathPositions.append(pathCoordinate)
                } else {
                    enemyGrid.remove([enemyGrid.node(atGridPosition: coordinateFromPoint((Path.position)))!])
                    
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
                        for trap in traps {
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
                    
                    var waterWheel = createTrap(waterWheelSideBarTrap, trapID: "waterWheel", positionOfTrap: trapPosition, canBeOnPath: false, cost: 150, attackDamage: 0, upgradeName: "energyGenerated", upgradeMultiplier: 0.5, upgradeArray: [waterWheelSideBarTrap.texture!])
                    let waterWheelTrap = waterWheel.trap
                    if waterWheel.madeTrap && contains(waterPositions, itemChecked: coordinateFromPoint(waterWheelTrap.position)) == false {
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
                        if (trapCoordinate.x == coordinate.x && (trapCoordinate.y == coordinate.y - 1 || trapCoordinate.y == coordinate.y + 1)) || (trapCoordinate.y == coordinate.y && (trapCoordinate.x == coordinate.x - 1 || trapCoordinate.x == coordinate.x + 1)) {
                            for otherTrap in [basicTrap, battery, wire, windTurbine, hospital, powerPlant, poisonTrap, freezeTrap, reverseTrap, waterWheel] {
                                if otherTrap.0 {
                                    connectedItems.append([trap, otherTrap.1])
                                }
                            }
                        }
                    }
                }
            }
                
                for trap in trapTypes {
                    trapTouchControl(trap, selectedTrap: selectedTrapTypes[trapTypes.index(of: trap)!], touch: self.atPoint(location), otherTraps: trapTypes, otherTrapsSelected: selectedTrapTypes)
                }
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

                        if trap.ID == "bombTrap" {
                            trap.life = 0
                        }else if trap.ID == "poisonTrap" && trap.energy >= 10{
                            enemy.secondsPoisoned = 0
                            enemy.maxSecondsPoisoned = Int(trap.maxSecondsPoisoned)
                            trap.energy -= 10
                            enemy.poisoned = true
                        } else if trap.ID == "freezeTrap"  && trap.energy >= 15{
                            trap.energy -= 15
                            enemy.secondsFrozen = 0
                            if enemy.frozen == false {
                                enemy.frozen = true
                                enemy.duration = enemy.duration * 2
                                addActions(enemy, position: enemy.position)
                            
                            }
                        } else if trap.ID == "reverseTrap"  && trap.energy >= 20{
                            trap.energy -= 20
                            
                            var reversedPosition = int2()
                            let isOnFirstRow = false
                            let pathNodesInOrder = enemyGrid.node(atGridPosition: pathPositions[map.startIndex])!.findPath(to: (enemyGrid.node(atGridPosition: pathPositions[0]))!) as! [GKGridGraphNode]
                            
                            for node in pathNodesInOrder {
                                let trapCoordinate = coordinateFromPoint(trap.position)
                                if node.gridPosition.x == trapCoordinate.x && node.gridPosition.y == trapCoordinate.y {
                                    reversedPosition = pathNodesInOrder[pathNodesInOrder.index(of: node)! - Int(trap.bounceBackSpaces)].gridPosition
                                }
                            }
                            
                            addActions(enemy, position: pointFromCoordinate(reversedPosition))
                        }
                        
                        enemy.life -= trap.attackDamage
                        
                        
                        if enemy.life <= 0 {
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
                        
                        if trap.life <= 0 {
                                                        
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
                           }
            // share energy but only if wave has started
            for itemArray in connectedItems {
                for item in itemArray {
                    var otherItem = itemArray
                    otherItem.remove(at: itemArray.index(of: item)!)
                    if item.maxEnergy != 0 || otherItem[0].maxEnergy != 0 {
                        
                        let fractionOfItemEnergy = Double(item.energy / item.maxEnergy)
                        let fractionOfOtherItemEnergy = Double(otherItem[0].energy / otherItem[0].maxEnergy)
                        let energyDifference = (fractionOfItemEnergy + fractionOfOtherItemEnergy)/2
                        let energyMoved = energyDifference * Double(item.maxEnergy)
                        if (item.energy / item.maxEnergy) < (otherItem[0].energy / otherItem[0].maxEnergy) {
                            
                            if energyMoved <= Double(item.maxEnergy) {
                                if otherItem[0].energy - (energyMoved - item.energy) >= 0 {
                                    let energyTaken = energyMoved - item.energy
                                    item.energy = energyMoved
                                    otherItem[0].energy -= energyTaken
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
                    enemies.remove(at: enemies.index(of: enemy)!)
                    enemy.healthBar.removeFromParent()
                    enemy.maxHealthBar.removeFromParent()
                    enemy.removeFromParent()
                }

                if enemy.poisoned == true && enemy.secondsPoisoned <= enemy.maxSecondsPoisoned {
                    enemy.life -= 2
                    enemy.secondsPoisoned += 1
                    if enemy.life <= 0 {
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
                        
                    }
                }
            }
            for trap in traps {
                if startedWave {
                    if trap.ID == "windTurbine" || trap.ID == "waterWheel" {
                        if trap.energy <= (trap.maxEnergy - trap.energyGenerated){
                        trap.energy += trap.energyGenerated
                        }else if trap.energy < trap.maxEnergy {
                            let addedEnergy = trap.maxEnergy - trap.energy
                            trap.energy += addedEnergy
                        }
                    
                    
                    } else if trap.ID == "powerPlant" {
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
            
            for hospital in hospitals {
                for trap in traps {
                    if hospital.radius.contains(trap.position) && hospital.energy >= hospital.healAmount * 10 && trap.life <= (Trap().life - hospital.healAmount){
                        trap.life += hospital.healAmount
                        hospital.energy -= hospital.healAmount * 10
                        
                    }
                }
            }
            
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
                        if enemies.count == 0 && enemiesThatCanGoesThroughBeforeLosing >= 0{
                            let Winlabel = SKLabelNode(text: "Level Complete")
                            Winlabel.position = CGPoint(x: frame.midX, y: frame.midY)
                            Winlabel.zPosition = 100
                            Winlabel.fontColor = UIColor.white
                            Winlabel.fontSize = 64
                            addChild(Winlabel)
                            GameScene().unlockedTrapsIndex = map.reward
                            shouldWait = true
                            GameScene().wonLevel = true
                        }
                    }
                }
            lastTimeCalled = currentTime
            time += 1
            }
            if enemies.count == 0 {
                runningWave = false
            }
        }
    }
    func coordinateFromPoint(_ point: CGPoint) -> int2 {
            return int2(Int32((point.x - gridStart.x) / trapSize), Int32((point.y - gridStart.y) / trapSize))
    }
    
    func pointFromCoordinate(_ coordinate: int2) -> CGPoint {
        return CGPoint(x: CGFloat(coordinate.x) * trapSize + gridStart.x + trapSize / 2, y: CGFloat(coordinate.y) * trapSize +
            gridStart.y + trapSize / 2)
    }
    func trapTouchControl(_ trap: Trap, selectedTrap: Trap, touch: SKNode, otherTraps: [Trap], otherTrapsSelected: [Trap] ){
//        if let touchSprite = touch as? SKSpriteNode {
        print("ran?")
            if touch.position == trap.position {
                if trap.selected {
                trap.texture = trap.selectedTexture
    //            trap.removeFromParent()
    //            self.addChild(selectedTrap)
                trap.selected = true
                loadDescription(trap)
                
                var trapsWithOutThisOne = otherTraps
                trapsWithOutThisOne.remove(at: trapsWithOutThisOne.index(of: trap)!)
                for sideBarTrap in trapsWithOutThisOne {
                    if sideBarTrap.selected == true {
                        sideBarTrap.descriptionLabel.removeFromSuperview()
                        sideBarTrap.selected = false
                        otherTrapsSelected[otherTraps.index(of: sideBarTrap)!].texture = otherTrapsSelected[otherTraps.index(of: sideBarTrap)!].normalTexture
                        addChild(sideBarTrap)
                        break
                    }
                }
                
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
            }else {
    //            selectedTrap.removeFromParent()
    //            addChild(trap)
                trap.selected = false
                trap.descriptionLabel.removeFromSuperview()
                trap.texture = trap.normalTexture
                }
//            }
        }
    }
    func createTrap(_ sideBarTrap: Trap, trapID: String, positionOfTrap: CGPoint, canBeOnPath: Bool, cost: Int, attackDamage: Double, upgradeName: String, upgradeMultiplier: Double, upgradeArray: [SKTexture]) -> (madeTrap: Bool, trap: Trap){
        if sideBarTrap.selected == true {
        let trapCoordinate = coordinateFromPoint(positionOfTrap)
        var isOnRightPosition = false
        for position in pathPositions {
            if position.x == trapCoordinate.x && position.y == trapCoordinate.y {
                isOnRightPosition = true
                
                break
            }
        }
        
        if isOnRightPosition == canBeOnPath {
            
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
        var sequence = [SKAction]()
        let enemy = Enemy(imageNamed: typeOfEnemy)
        let multiplier = (numberOfWaves / 20) + 1
        if typeOfEnemy == "fastEnemy" {
            enemy.life = 8 * multiplier
            enemy.maxLife = 8 * multiplier
            enemy.duration = 0.5
            
        } else if typeOfEnemy == "bossEnemy" {
            enemy.life = 35 * multiplier
            enemy.maxLife = 35 * multiplier
        }else if typeOfEnemy == "slowEnemy" {
            enemy.life = 20 * multiplier
            enemy.maxLife = 20 * multiplier
            enemy.duration = 2
        } else {
            enemy.life = 10 * multiplier
            enemy.maxLife = 10 * multiplier
            enemy.duration = 1
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
            enemies.append(enemy)
            addChild(enemy)
            for node in enemyPath {
                let action = SKAction.move(to: pointFromCoordinate(node.gridPosition), duration: enemy.duration)
                let update = SKAction.run() { [unowned self] in
//                    mediumEnemy.position = self.pointFromCoordinate(node.gridPosition)
                }
                sequence += [action, update]
            }
            enemy.run(SKAction.sequence(sequence))
    }
    func initTrap(_ trap: Trap, cost: String, descripion: String) {
        trap.texture = SKTexture(imageNamed: trap.name!)
        for trapTexture in sideBarTraps {
            if trapTexture.description == trap.texture?.description {
                
                let firstCoord =  (trapSideBar.size.width / 3) - trapSize / 1.8
                trap.position = CGPoint(x: firstCoord, y: frame.height / 15 + trapSize/20 + spacing * CGFloat(sideBarTraps.index(of: trapTexture)!))
                trap.size = CGSize(width: trapSize,height: trapSize)
                trap.zPosition = 2
                trap.trapDescription = descripion
                trap.normalTexture = trap.texture
                trap.selectedTexture = SKTexture(imageNamed: trap.name! + "Selected" )
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
        enemy.run(SKAction.sequence(sequence))
    }
    func addUpgradeBars(_ trapPosition: CGPoint, trap: Trap) {
        
        let centerCirclePath = UIBezierPath(arcCenter: trapPosition, radius: trapSize * 2, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: false)
        let centerCircle = SKShapeNode(path: centerCirclePath.cgPath)
        let upAttackButton = SKSpriteNode(imageNamed: "upgradeButton")
        let upgradePriceLabel = SKLabelNode(text: "Cost: \(Int(trap.value(forKey: trap.upgradeName) as! Double * trap.upgradeMultiplier + 25))")
        upAttackButton.size = CGSize(width: trapSize, height: trapSize)
        upAttackButton.position = CGPoint(x: trapPosition.x, y: trapPosition.y + round(trapSize * 2))
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
        label.text = trap.trapDescription
        label.numberOfLines = 0
        label.sizeToFit()
        label.center = CGPoint(x: frame.maxX - label.bounds.width/2, y: frame.maxY - label.bounds.height/2)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .right
        label.backgroundColor = UIColor.white
        stuffToRemove.append(label)
        trap.descriptionLabel = label
        view!.addSubview(label)
        
    }

    func showUpgrades(coordinate: int2) -> Bool {
        if aTrapHasItsUpgradesShown {
            
            if coordinateFromPoint(upgradeCircles[0].position).x != coordinate.x || coordinateFromPoint(upgradeCircles[0].position).y != coordinate.y {
                if (coordinateFromPoint(upgradeCircles[1].position).x != coordinate.x || coordinateFromPoint(upgradeCircles[1].position).y != coordinate.y) && (coordinateFromPoint(upgradeCircles[2].position).x != coordinate.x || coordinateFromPoint(upgradeCircles[2].position).y != coordinate.y) {
                    
                    for circle in upgradeCircles {
                        circle.removeFromParent()
                    }
                    upgradeCircles.removeAll()
                    aTrapHasItsUpgradesShown = false
                }else {
                    //                                find out what trap is being upgraded
                    for trap in traps {
                        if coordinate.x == coordinateFromPoint(trap.position).x && coordinate.y - 2 == coordinateFromPoint(trap.position).y {
                            
                            let upgrade = trap.upgradeName
                            let upgradeValue = trap.value(forKey: upgrade)
                            let upgradeCost = Int(upgradeValue as! Double * trap.upgradeMultiplier + 25)
                            var upgradePictureDescriptions = [String]()
                            for texture in trap.upgradePictures {
                                upgradePictureDescriptions.append(texture.description)
                            }
                            if money - upgradeCost >= 0 {
                                
                                if  upgradePictureDescriptions.index(of: trap.texture!.description) != trap.upgradePictures.endIndex - 1{
                                    trap.texture = trap.upgradePictures[upgradePictureDescriptions.index(of: (trap.texture!.description))! + 1]
                                    trap.cost += upgradeCost
                                    money -= upgradeCost
                                    moneyLabel.text = "Money: \(money)"
                                    trap.setValue((upgradeValue as! Double / 4) + (upgradeValue as! Double), forKey: upgrade)
                                    
                                    let label = SKLabelNode(text: "Cost: \(Int((trap.value(forKey: upgrade) as! Double) * trap.upgradeMultiplier + 25))")
                                    label.position = upgradeCircles[3].position
                                    label.fontSize = trapSize/5
                                    label.zPosition = 100
                                    label.fontColor = UIColor.black
                                    addChild(label)
                                    upgradeCircles[3].removeFromParent()
                                    upgradeCircles[3] = label
                                }
                            }else {
                                numberOfBlinks = 0
                            }
                        } else if coordinate.x == coordinateFromPoint(trap.position).x && coordinate.y + 2 == coordinateFromPoint(trap.position).y {
                            // find out if the trap is being sold
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
                                if item[0] == trap || item[1] == trap {
                                    for index in 0..<connectedItems.count {
                                        if connectedItems[index] == item {
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
























