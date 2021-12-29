//
//  Genius.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 12/26/21.
//

import Foundation

struct Genius: Identifiable {
    
    let id = UUID()
    let name: String
    let major: String
    let year: Int
    let photoName: String
    let position: String
    let myDescription: String
    let roleDescription: String
    let awards: [(name: String, year: Int)]
    let experience: [(name: String, year: Int)]
    let linkOne: (name:String, url: String)
    let linkTwo: (name:String, url: String)
    
}

func getAllGenius() -> [Genius] {
    
    var theCrazyOnes: [Genius] = [Genius]()
    
    theCrazyOnes.append(Genius(
        name: "Shengyuan Lu",
        major: "B.S. Computer Science",
        year: 2024,
        photoName: "Shengyuan",
        position: "iOS Tech Lead",
        myDescription: "There's a certain kind of person who doesn't take NO for an answer - for example, a Stanford reject like me. I am here to write my legend: Why can't software engineers can be super stars too?",
        roleDescription: "iOS Tech Lead: Responsible for everything you can see in this app, plus some marketing / legal stuff.",
        awards: [(name: "Apple WWDC Scholar", year: 2021), (name: "3X International Hackathon Wins", year: 2021), (name: "2X Design Competition Wins", year: 2020)],
        experience: [(name: "Summer Intern @ Zoom as Freshmen", year: 2021), (name: "3X iOS Apps on App Store", year: 2021), (name: "GitHub Campus Expert", year: 2021), (name: "Content Creator @ YouTube & Bilibili", year: 2021)],
        linkOne: (name: "LinkedIn", url: "https://www.linkedin.com/in/shengyuan-lu/"),
        linkTwo: (name: "YouTube", url: "https://www.youtube.com/c/ShengyuanLu/videos")
    ))
    
    return theCrazyOnes
}

func getSampleGenius() -> Genius {
    
    return Genius(
        name: "Shengyuan Lu",
        major: "B.S. Computer Science",
        year: 2024,
        photoName: "Shengyuan",
        position: "iOS Tech Lead",
        myDescription: "There's a certain kind of person who doesn't take NO for an answer - for example, a Stanford reject like me. I am here to write my legend: Why can't software engineers can be super stars too?",
        roleDescription: "iOS Tech Lead: Responsible for everything you can see in this app, plus some marketing / legal stuff.",
        awards: [(name: "Apple WWDC Scholar", year: 2021), (name: "3X International Hackathon Wins", year: 2021), (name: "2X Design Competition Wins", year: 2020)],
        experience: [(name: "Summer Intern @ Zoom as Freshmen", year: 2021), (name: "3X iOS Apps on App Store", year: 2021), (name: "GitHub Campus Expert", year: 2021), (name: "Content Creator @ YouTube & Bilibili", year: 2021)],
        linkOne: (name: "LinkedIn", url: "https://www.linkedin.com/in/shengyuan-lu/"),
        linkTwo: (name: "YouTube", url: "https://www.youtube.com/c/ShengyuanLu/videos")
    )
    
}
