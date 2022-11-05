//
//  TechEnum.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 06/11/2022.
//

import Foundation

enum TechEnum {
    case JS //= "desktopcomputer"
    case HTML //= "globe.europe.africa.fill"
    case PHP //= "newspaper"
    case Ruby// = "diamond"
    case Python// = "scribble"
    case Java //= "cup.and.saucer.fill"
    case Net //= "smallcircle.filled.circle.fill"
    case Scala// = "s.circle.fill"
    case C //= "c.circle.fill"
    case Mobile// = "iphone.homebutton"
    case Testing// = "magnifyingglass"
    case DevOps// = "arrow.triangle.2.circlepath"
    case Admin //= "gearshape.2.fill"
    case UXUI //= "paintpalette.fill"
    case PM //= "brain.head.profile"
    case Game //= "gamecontroller.fill"
    case Analytics// = "chart.line.uptrend.xyaxis"
    case Security// = "checkerboard.shield"
    case Data //= "server.rack"
    case GO //= "g.circle.fill"
    case Support //= "questionmark"
    case ERP //= "hexagon"
    case Architecture //= "building.columns"
    case Other //= "folder"
    case All  // = "eyes.inverse"
}

extension TechEnum {
  static let allItems: [TechEnum] = [
    .All, .JS, .HTML, .PHP, .Ruby, .Python, .Java, .Net, .Scala, .C, .Mobile, .Testing, .DevOps, .Admin, .UXUI, .PM, .Game, .Analytics, .Security, .Data, .GO, .Support, .ERP, .Architecture, .Other
  ]
}
