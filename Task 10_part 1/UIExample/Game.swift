//
//  Game.swift
//  10-Classes
//
//  Created by asadulin viktor on 14/10/2019.
//  Copyright © 2019 Asadulinz Software. All rights reserved.
//

import Foundation

enum Direction {
    case left, right, up, down
}

class Player {
    var x = 2
    var y = 2
    
    
}

class Box {
    var xBox = 5
    var yBox = 5
}

class Room {
    var width = 10
    var height = 10
}

class Target {
    var xTarget = 9
    var yTarget = 9
}

class Game {
    var room: Room = Room()
    var player = Player()
    var box = Box()
    var target = Target()
    
    func roomToString()->String {
        var area: String = ""
        for y in 0..<room.height {
            for x in 0..<room.width {
                var cell = "\u{2B1C}"
                if player.x == x && player.y == y {
                    cell = "\u{26F9}"
                }
                else if box.xBox == x && box.yBox == y {
                    cell = "\u{1F961}"
                }
                else if target.xTarget == x && target.yTarget == y {
                    cell = "\u{2299}"
                }
                area.append(cell)
            }
            area.append("\n")
        }
        
        return area
        //Swift.print(area)
    }
    
    func move(to direction: Direction) {
        switch direction {
        case .left:
            if player.x > 0{
              if player.x == box.xBox + 1, player.y == box.yBox {
                    player.x -= 1
                    box.xBox -= 1
            } else {
                player.x -= 1
        
            }
        }
            
        case .right:
            if player.x < room.width-1{
                if player.x == box.xBox - 1, player.y == box.yBox {
                player.x += 1
                box.xBox += 1
            }
                else {
                player.x += 1
            }
    }
            
        case .up:
            if player.y > 0 {
                if player.y == box.yBox + 1, box.yBox != 0, box.xBox == player.x {
                    player.y -= 1
                    box.yBox -= 1
                    
                }
                else if box.yBox == player.y-1, box.yBox == 0, box.xBox == player.x {
                    player.y = player.y
                }
                else {
                    player.y -= 1
                }
            }
            
        case .down:
            if player.y < room.height-1 {
                if player.y == box.yBox - 1, box.yBox != room.height-1, box.xBox == player.x {
                    player.y += 1
                    box.yBox += 1
            
                }
                else if box.yBox == player.y+1, box.yBox == room.height-1, box.xBox == player.x {
                    player.y = player.y
                }
                else {
                    player.y += 1
                }
            }

        }

    }

    func checkTarget (targetX: Int, boxX: Int, targetY: Int, boxY: Int) -> Bool{
        if target.xTarget == box.xBox && target.yTarget == box.yBox {
            return true
        }   else {
            return false
        }
    
    }
}




