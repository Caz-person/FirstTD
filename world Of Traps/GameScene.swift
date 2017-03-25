
//
//  GameScene.swift
//  world Of Traps
//
//  Created by Rebecca Cullimore on 5/30/16.
//  Copyright © 2016 Cullimore Family. All rights reserved.
//

import SpriteKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

class GameScene: SKScene {
//     this crashes when un-commented on mom's phone
//    let startWaveButton = SKSpriteNode()
//    let bombSideBarTrap  = SKSpriteNode()
//    let bombSideBarTrapSelected = SKSpriteNode()
//    let waterWheelSideBarTrap = SKSpriteNode()
//    let waterWheelSideBarTrapSelectedPic = SKSpriteNode()
//    let reverseSideBarTrap = SKSpriteNode()
//    let reverseSideBarTrapSelectedPic = SKSpriteNode()
//    let freezeSideBarTrap = SKSpriteNode()
//    let freezeSideBarTrapSelectedPic = SKSpriteNode()
//    let powerPlantSideBarTrap = SKSpriteNode()
//    let powerPlantSideBarTrapSelectedPic = SKSpriteNode()
////    let trapSideBar = Trap(imageNamed: "trapSideBar")
//    let trapDestroyingHammer = SKSpriteNode()
//    let poisonSideBarTrap = SKSpriteNode()
//    let poisonSideBarTrapSelectedPic = SKSpriteNode()
//    let windTurbineSideBarTrap = SKSpriteNode()
//    let windTurbineSideBarTrapSelectedPic = SKSpriteNode()
//    let hospitalSideBarTrap = SKSpriteNode()
//    let hospitalSideBarTrapSelectedPic = SKSpriteNode(imageNamed: "hospitalSelected")
//    let basicSideBarTrap = SKSpriteNode(imageNamed: "basicTrap")
//    let basicSideBarTrapSelectedPic = SKSpriteNode(imageNamed: "basicTrapSelected")
//    let batterySideBarTrap = SKSpriteNode(imageNamed: "battery")
//    let batterySideBarTrapSelectedPic = SKSpriteNode(imageNamed: "batterySelected")
//    let wireSideBarTrap = SKSpriteNode(imageNamed: "wire")
//    let wireSideBarTrapSelectedPic = SKSpriteNode(imageNamed: "wireSelected")
//    let restartButton = SKSpriteNode(imageNamed: "restartButton")
//    let pauseButton = SKSpriteNode(imageNamed: "pauseButton")
//    let pauseLabel = SKLabelNode(text: "Paused")

    let trapSideBar = SKSpriteNode(imageNamed: "trapSideBar")
    var numberOfTraps = 0
    var trapSize = CGFloat()
    let basicTrap = Trap(imageNamed: "basicTrap")
    let battery = Trap(imageNamed: "battery")
    let wire = Trap(imageNamed: "wire")
    let hospital = Trap(imageNamed: "hospital")
    let windTurbine = Trap(imageNamed: "windTurbine")
    let poisonTrap = Trap(imageNamed: "poisonTrap")
    let powerPlant = Trap(imageNamed: "powerPlant")
    let freezeTrap = Trap(imageNamed: "freezeTrap")
    let reverseTrap = Trap(imageNamed: "reverseTrap")
    let waterWheel = Trap(imageNamed: "waterWheel")
    let bombTrap = Trap(imageNamed: "bombTrap")
    let playButton = SKSpriteNode(imageNamed: "startButton")
    let tutorialButton = SKSpriteNode(imageNamed: "tutorialPlayButton")
    let defaults = UserDefaults.standard
    var allTraps = [Trap]()
    var traps = [Trap]()
    let maps = [Map().mapOne(), Map().mapTwo(), Map().mapThree(), Map().mapFour(), Map().mapFive(), Map().mapSix(), Map().mapSeven(), Map().mapEight(), Map().mapNine(), Map().mapTen(), Map().mapEleven(), Map().mapTwelve(), Map().mapThirteen(), Map().map14(), Map().map15(), Map().map20()]
    let mapNames = ["mapOne", "mapTwo", "mapThree", "mapFour", "mapFive", "mapSix", "mapSeven", "mapEight"]
    var runningTutorial = false
    var currentSpeechBubble: SpeechBubble? = nil
    var wonLevel: Bool {
        get { return defaults.object(forKey: "didWinLastLevel") as? Bool ?? false }
        set { defaults.set(newValue, forKey: "didWinLastLevel") }
    }
    
//    var lastLevel: String {
//        get { return defaults.objectForKey("lastMap") as? String ?? "mapOne" }
//        set { defaults.setObject( newValue, forKey: "lastMap") }
//    }
    var lastLevel: Int {
        get{return defaults.object(forKey: "lastMap") as? Int ?? 0}
        set{defaults.set(newValue, forKey: "lastMap")}
    }
    var unlockedTrapsIndex: Int {
        get{return defaults.object(forKey: "unlockedTraps") as? Int ?? 2}
        set{defaults.set(newValue, forKey: "unlockedTraps")}
    }
    var lastUnlockedTraps = 0
    override func didMove(to view: SKView) {
        print(mapNames[lastLevel])
        allTraps = [basicTrap, hospital, windTurbine, battery, wire, freezeTrap, poisonTrap, bombTrap, powerPlant, reverseTrap, waterWheel]
        for index in 0...unlockedTrapsIndex {
            traps.append(allTraps[index])
        }
        
        basicTrap.name = "basicTrap"
        battery.name = "battery"
        wire.name = "wire"
        hospital.name = "hospital"
        windTurbine.name = "windTurbine"
        poisonTrap.name = "poisonTrap"
        powerPlant.name = "powerPlant"
        freezeTrap.name = "freezeTrap"
        reverseTrap.name = "reverseTrap"
        waterWheel.name = "waterWheel"
        bombTrap.name = "bombTrap"
//        basicTrap.selectedTexture = SKTexture(imageNamed: "basicTrapSelected")
//        battery.selectedTexture = SKTexture(imageNamed: "batterySelected")
//        wire.selectedTexture = SKTexture(imageNamed: "wireSelected")
//        hospital.selectedTexture = SKTexture(imageNamed: "hospitalSelected")
//        windTurbine.selectedTexture = SKTexture(imageNamed: "windturbineSelected")
//        poisonTrap.selectedTexture = SKTexture(imageNamed: "poisonTrapSelected")
//        powerPlant.selectedTexture = SKTexture(imageNamed: "powerPlantSelected")
//        freezeTrap.selectedTexture = SKTexture(imageNamed: "freezeTrapSelected")
//        bounceTrap.selectedTexture = SKTexture(imageNamed: "bounceTrapSelected")
//        waterWheel.selectedTexture = SKTexture(imageNamed: "waterWheelSelected")
        
        
        basicTrap.trapDescription = "a basic spike trap \n life: \(Int(Trap().life)) \n cost: 100"
        battery.trapDescription = "a battery that holds 800 energy \n cost: 75"
        wire.trapDescription = "a cheap way to transfer energy \n holds 100 energy \n cost: 25"
        hospital.trapDescription = "a hospital that heals your damaged traps \n holds 100 energy \n cost: 150"
        windTurbine.trapDescription = "a wind turbine that generates 10 power \n holds 100 energy \n cost: 50"
        poisonTrap.trapDescription = "a poison trap that poisons enemies \n poisons for 5 seconds \n cost: 250"
        powerPlant.trapDescription = "sells energy for money \n cost: 500"
        freezeTrap.trapDescription = "a freeze trap that slows enemies for 5 seconds \n cost: 150"
        reverseTrap.trapDescription = "a spring trap that bounces enemies back 5 spaces \n cost: 200"
        waterWheel.trapDescription = "a water wheel that generates 50 power \n cost: 150"
        bombTrap.trapDescription = "a bomb that explodes, damaging nearby enemies \n cost: 50"
        trapSize = self.frame.maxY * 0.075
        /* Setup your scene here */
        let trapSideBarSize = SKSpriteNode(imageNamed: "trapSideBar").size
//        let trapSideBar = self.childNodeWithName("trapSideBar") as! SKSpriteNode
        trapSideBar.size = CGSize(width:   (trapSideBarSize.width / trapSideBarSize.height) * frame.height, height: frame.height)
        trapSideBar.position = CGPoint(x: frame.width - trapSideBar.size.width/2, y: frame.height/2)
        trapSideBar.zPosition = -1
        addChild(trapSideBar)
        let spacing = trapSize * 1.25
        for trap in traps {
            trap.size = CGSize(width: trapSize, height: trapSize)
            if traps.index(of: trap) < 9 {
            
                let firstCoord = frame.width - (trapSideBar.size.width / 1.5) - trapSize / 1.8
                trap.position = CGPoint(x: firstCoord, y: frame.height / 15 + trapSize/20 + spacing * CGFloat(traps.index(of: trap)!))
            
            } else {
                let firstCoord = (frame.width - (trapSideBar.size.width / 3 * 2) - trapSize / 1.8 + spacing)
                trap.position = CGPoint(x: firstCoord, y: frame.height / 15 + trapSize/20 + spacing * CGFloat(traps.index(of: trap)! - 9))
            }
            trap.zPosition = 1
            addChild(trap)
            
        }
//        basicTrap.size = CGSize(width: trapSize, height: trapSize)
//        basicTrap.position = CGPoint(x: 827.169, y: 54.582)
//        basicTrap.position = CGPoint(x: frame.width - 197, y: 10)
//        basicTrap.position = CGPoint(x: 0.8 * frame.width, y: frame.height * 0.072)
//        basicTrap.position = CGPoint(x: frame.width - (trapSideBar.size.width / 3 * 2) - trapSize / 1.8, y: frame.height / 15 + trapSize/20)
//        basicTrap.zPosition = 1
//        addChild(basicTrap)
        
        self.playButton.position = CGPoint(x:(self.frame.maxX - trapSideBar.size.width) / 2 , y:self.frame.midY)
        playButton.size = CGSize(width: frame.width * 0.4, height: playButton.size.height/playButton.size.width * (frame.width * 0.4))
        self.addChild(self.playButton)
        print(playButton.size)
        self.backgroundColor = UIColor.blue
        
        tutorialButton.position = CGPoint(x: playButton.position.x, y: playButton.position.y - playButton.size.height)
        tutorialButton.size = CGSize(width: playButton.size.width/2, height: tutorialButton.size.height / tutorialButton.size.width * playButton.size.width/2)
        addChild(tutorialButton)
        
        if runningTutorial {
            currentSpeechBubble = SpeechBubble(arrowDirection: .right, Text: "First, select a trap, \n you can select up to five traps, should select all of them")
            currentSpeechBubble?.load(scene: self, position: CGPoint(x: frame.width - trapSideBar.size.width - trapSize * 3.5, y: basicTrap.position.y) , size: CGSize(width: trapSize * 8, height: trapSize * 2))
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            for trap in traps {
                    if self.atPoint(location) == trap {
                    if trap.selected == false{
                        trap.selected = true
                        if runningTutorial && basicTrap.selected && hospital.selected && windTurbine.selected{
                            if currentSpeechBubble != nil {
                                currentSpeechBubble?.textLabel.removeFromSuperview()
                                currentSpeechBubble?.speechBubble?.removeFromParent()
                                currentSpeechBubble = nil
                            }
                            currentSpeechBubble = SpeechBubble(arrowDirection: .right, Text: "Now, tap the start button")
                            currentSpeechBubble?.load(scene: self, position: CGPoint(x: playButton.position.x - trapSize * 1.5 - playButton.size.width/2,y: playButton.position.y), size: CGSize(width: trapSize * 3, height: trapSize * 3))
                        }
                        if  numberOfTraps < 5 {
//                        trap.texture = trap.selectedTexture
                        
                        trap.texture = SKTexture(imageNamed: trap.name! + "Selected")
                        numberOfTraps += 1
                        loadDescription(trap)
                        }
                    }else {
                         trap.selected = false
                        trap.texture = SKTexture(imageNamed: trap.name!)
                        numberOfTraps -= 1
                    }
                }
            }
//            if self.nodeAtPoint(location) == basicTrap {
//                if basicTrap.selected == false {
//                    basicTrap.texture = SKTexture(imageNamed: "basicTrapSelected")
//                    basicTrap.selected = true
//                } else {
//                    basicTrap.texture = SKTexture(imageNamed: "basicTrap")
//                    basicTrap.selected = false
//                }
//                
//            }
            if atPoint(location) == tutorialButton {
                if currentSpeechBubble != nil {
                    currentSpeechBubble?.textLabel.removeFromSuperview()
                    currentSpeechBubble?.speechBubble?.removeFromParent()
                    currentSpeechBubble = nil
                }
                
                let scene  = GameScene(size: self.size)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                scene.size = skView.bounds.size
                scene.lastUnlockedTraps = unlockedTrapsIndex
                scene.unlockedTrapsIndex = 2
                scene.runningTutorial = true
                view?.presentScene(scene)
                runningTutorial = true
                
                
                
            }else if self.atPoint(location) == self.playButton {
                if runningTutorial {
                    unlockedTrapsIndex = lastUnlockedTraps
                }
//                var level: (template: [[String]], startIndex: Int, waves: [String]) {
//                    get { return defaults.objectForKey("playScene.level") as? (template: [[String]], startIndex: Int, waves: [String]) ?? Map().mapOne() }
                
//                    set { defaults.setObject(newValue as? AnyObject, forKey: "playScene.level") }
//                }
                print("about to load playscene")
                let scene = PlayScene(size: self.size)
                print("just loaded playscene")
                for thing in view!.subviews {
                    thing.removeFromSuperview()
                }
                for child in children {
                    child.removeFromParent()
                }
                for trap in traps {
                    if trap.selected {
                        scene.sideBarTraps.append(SKTexture(imageNamed: trap.name!))
                    }
                }

//                scene.map = lastLevel
//                commented out for level selection testing
                if wonLevel {
//                    var mapIndex = mapNames.indexOf(lastLevel)! + 1
                    var mapIndex = lastLevel + 1
                    if mapIndex >= maps.endIndex {
                        mapIndex = 0
                    }
                    scene.map = maps[mapIndex]
//                    lastLevel = mapNames[mapIndex]
                    lastLevel = mapIndex
                    
                } else {
                    scene.map = maps[lastLevel]
                }
                if runningTutorial {
                    scene.runningTutorial = true
                    scene.map = maps[0]
                    if currentSpeechBubble != nil {
                        currentSpeechBubble?.textLabel.removeFromSuperview()
                        currentSpeechBubble?.speechBubble?.removeFromParent()
                        currentSpeechBubble = nil
                    }
                }
//                scene.map = level
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene, transition: .fade(with: UIColor.black, duration: 1))
                
            }
        }
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
        //        moneyLabel.center = CGPoint(x: (self.frame.maxX - moneyLabel.bounds.width/2) - 5 ,y: moneyLabel.bounds.height/2)
        label.center = CGPoint(x: label.bounds.width/2, y: label.bounds.height/2)
        print(label.font.fontName)
        
        print(label.font.fontName)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        //        label.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        trap.descriptionLabel = label
        view!.addSubview(label)
        
    }
    override func willMove(from view: SKView) {
//        view.presentScene(nil)
        for child in children {
            child.removeFromParent()
        }
    }
}
