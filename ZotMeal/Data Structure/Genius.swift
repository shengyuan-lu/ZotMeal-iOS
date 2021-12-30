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
    let awards: [AwardExperience]
    let experience: [AwardExperience]
    let linkOne: (name: String, url: String)
    let linkTwo: (name: String, url: String)
    
}

func getAllGenius() -> [Genius] {
    
    var theCrazyOnes: [Genius] = [Genius]()
    
    theCrazyOnes.append(Genius(
        name: "Shengyuan Lu",
        major: "B.S. Computer Science",
        year: 2024,
        photoName: "Shengyuan",
        position: "iOS Tech Lead",
        myDescription: "A Stanford reject who doesn't take NO for an answer. I am here to write my legend: Why can't software engineers can be super stars?",
        roleDescription: "Responsible for everything you can see in this app, plus some marketing / legal stuff.",
        awards: [AwardExperience(name: "Apple WWDC Scholar", year: 2021), AwardExperience(name: "3X International Hackathon Wins", year: 2021), AwardExperience(name: "2X Design Competition Wins", year: 2020)],
        experience: [AwardExperience(name: "Summer Intern @ Zoom", year: 2021), AwardExperience(name: "3X iOS Apps on App Store", year: 2021), AwardExperience(name: "GitHub Campus Expert", year: 2021)],
        linkOne: (name: "LinkedIn", url: "https://www.linkedin.com/in/shengyuan-lu/"),
        linkTwo: (name: "YouTube", url: "https://www.youtube.com/c/ShengyuanLu/videos")
    ))
    
    theCrazyOnes.append(Genius(
        name: "Eric Pedley",
        major: "B.S. Computer Science",
        year: 2025,
        photoName: "Eric",
        position: "Backend Tech Lead",
        myDescription: "I'm interested in web development and machine learning. Outside of programming, I'm part of the UCI triathlon club and also enjoy playing video games.",
        roleDescription: "Worked on web-scraping dining website and devops.",
        awards: [],
        experience: [AwardExperience(name: "Eagle Scout (2020)", year: 2020)],
        linkOne: (name: "GitHub", url: "https://github.com/EricPedley"),
        linkTwo: (name: "LinkedIn", url: "https://www.linkedin.com/in/ericpedley/")
    ))
    
    theCrazyOnes.append(Genius(
        name: "Brian Vo",
        major: "B.S. CSE",
        year: 2024,
        photoName: "Brian",
        position: "Backend SDE",
        myDescription: "I'm an aspiring full stack developer.",
        roleDescription: "I worked on the Python backend logic to deliver the (hopefully) correct information to users of the Zotmeal app.",
        awards: [],
        experience: [AwardExperience(name: "DFS STEM Instructor", year: 2021)],
        linkOne: (name: "GitHub", url: "https://github.com/bevm0"),
        linkTwo: (name: "LinkedIn", url: "https://www.linkedin.com/in/brian-m-vo/")
    ))
    
    theCrazyOnes.append(Genius(
        name: "Justin Yue",
        major: "B.S. Computer Science",
        year: 2024,
        photoName: "Justin",
        position: "Android Tech Lead",
        myDescription: "",
        roleDescription: "",
        awards: [],
        experience: [],
        linkOne: (name: "LinkedIn", url: ""),
        linkTwo: (name: "YouTube", url: "")
    ))
    
    theCrazyOnes.append(Genius(
        name: "Tony Liu",
        major: "B.S. CSE",
        year: 2024,
        photoName: "Tony",
        position: "Android SDE",
        myDescription: "I am into web and mobile development, and I like editing videos and playing basketball in my free time.",
        roleDescription: "Implemented UI as well as various functionalities in the ZotMeal Android app; tested and improved on all aspects of ZotMeal app, including stability, performance, accessibility, growth, and retention.",
        awards: [AwardExperience(name: "USNCO Silver", year: 2019), AwardExperience(name: "COMC Silver", year: 2019), AwardExperience(name: "Euclid Math Distinction", year: 2018), AwardExperience(name: "AMC 12 Honor Roll", year: 2018)],
        experience: [AwardExperience(name: "Calit 2 Research", year: 2021), AwardExperience(name: "Graphic Design Intern", year: 2021)],
        linkOne: (name: "LinkedIn", url: "https://www.linkedin.com/in/tonyliu02/"),
        linkTwo: (name: "GitHub", url: "https://github.com/tonyliu02")
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
        awards: [AwardExperience(name: "Apple WWDC Scholar", year: 2021), AwardExperience(name: "3X International Hackathon Wins", year: 2021), AwardExperience(name: "2X Design Competition Wins", year: 2020)],
        experience: [AwardExperience(name: "Summer Intern @ Zoom", year: 2021), AwardExperience(name: "3X iOS Apps on App Store", year: 2021), AwardExperience(name: "GitHub Campus Expert", year: 2021)],
        linkOne: (name: "LinkedIn", url: "https://www.linkedin.com/in/shengyuan-lu/"),
        linkTwo: (name: "YouTube", url: "https://www.youtube.com/c/ShengyuanLu/videos")
    )
    
}
