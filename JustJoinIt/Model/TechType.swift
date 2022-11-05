//
//  TechType.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 06/11/2022.
//

import Foundation

class TechType {
    let techName: String
    let imageName: String
    
    init(_ tech: TechEnum) {
        var techName = ""
        var imageName = ""
        switch tech {
        case .JS:
            techName = "JS"
            imageName = "desktopcomputer"
        case .HTML:
            techName = "HTML"
            imageName = "globe.europe.africa.fill"
        case .PHP:
            techName = "PHP"
            imageName = "newspaper"
        case .Ruby:
            techName = "Ruby"
            imageName = "diamond"
        case .Python:
            techName = "Python"
            imageName = "scribble"
        case .Java:
            techName = "Java"
            imageName = "cup.and.saucer.fill"
        case .Net:
            techName = ".Net"
            imageName = "smallcircle.filled.circle.fill"
        case .Scala:
            techName = "Scala"
            imageName = "s.circle.fill"
        case .C:
            techName = "C"
            imageName = "c.circle.fill"
        case .Mobile:
            techName = "Mobile"
            imageName = "iphone.homebutton"
        case .Testing:
            techName = "Testing"
            imageName = "magnifyingglass"
        case .DevOps:
            techName = "DevOps"
            imageName = "arrow.triangle.2.circlepath"
        case .Admin:
            techName = "Admin"
            imageName = "gearshape.2.fill"
        case .UXUI:
            techName = "UX/UI"
            imageName = "paintpalette.fill"
        case .PM:
            techName = "PM"
            imageName = "brain.head.profile"
        case .Game:
            techName = "Game"
            imageName = "gamecontroller.fill"
        case .Analytics:
            techName = "Analytics"
            imageName = "chart.line.uptrend.xyaxis"
        case .Security:
            techName = "Security"
            imageName = "checkerboard.shield"
        case .Data:
            techName = "Data"
            imageName = "server.rack"
        case .GO:
            techName = "GO"
            imageName = "g.circle.fill"
        case .Support:
            techName = "Support"
            imageName = "questionmark"
        case .ERP:
            techName = "ERP"
            imageName = "hexagon"
        case .Architecture:
            techName = "Architecture"
            imageName = "building.columns"
        case .Other:
            techName = "Other"
            imageName = "folder"
        case .All:
            techName = "All"
            imageName = "eyes.inverse"
        }
        self.techName = techName
        self.imageName = imageName
    }
}

extension TechType {
    static func allValues() -> [TechType] {
        var array = [TechType]()
        let techEnums = TechEnum.allItems
        techEnums.forEach { techEnum in
            array.append(TechType(techEnum))
        }
        return array
    }
}
