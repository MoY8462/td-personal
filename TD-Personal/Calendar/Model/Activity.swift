//
//  Activity.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 23/01/25.
//

import Foundation
import UIKit
import SwiftData

@Model class Activity {
    var name: String
    @Relationship(deleteRule: .cascade)
    var icon: ActivitySymbol.RawValue
    var hexColor: String
    var workouts: [Workout] = []
    init(name: String, icon: ActivitySymbol = .mixedCardio, hexColor: String = "FF0000") {
        self.name = name
        self.icon = icon.rawValue
        self.hexColor = hexColor
    }
}

extension Activity {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(
            for: Activity.self,
            configurations: ModelConfiguration(
                isStoredInMemoryOnly: true
            )
        )
        var sampleActivities: [Activity] {
            [
                Activity(name: "Jogging", icon: .run, hexColor: "B33234"),
                Activity(name: "Swimming", icon: .poolSwim, hexColor: "6F223D"),
                Activity(name: "Biking", icon: .outdoorCycle, hexColor: "38571A"),
                Activity(name: "Elliptical", icon: .elliptical, hexColor: "FF3B30"),
            ]
        }
        
        let sampleComments =  [
            "Energized and alive!",
            "Sweaty but satisfied.",
            "On top of the world!",
            "Exhausted but accomplished.",
            "Muscles are singing!",
            "Feeling the burn in a good way.",
            "Empowered and strong.",
            "Ready to conquer the day.",
            "A good kind of soreness.",
            "Proud of the effort.",
            "Revitalized and refreshed.",
            "Endorphins pumping!",
            "Like a fitness superhero!",
            "Beaming with post-workout glow.",
            "Unstoppable and determined.",
            "Tired but triumphant.",
            "Fuelled with positive vibes.",
            "In love with the post-workout high.",
            "Feeling the progress.",
            "Champion mode activated!"
        ]

        sampleActivities.forEach { activity in
            container.mainContext.insert(activity)
            let randomNumber = Int.random(in: 15...50)
            for _ in 1...randomNumber {
                let randomComment = sampleComments[Int.random(in: 0..<sampleComments.count)]
                let newWorkOut = Workout(date: Date.now.randomDateWithinLastThreeMonths, comment: randomComment)
                activity.workouts.append(newWorkOut)
            }
        }
        return container
    }

}

@Model
class Workout {
    var date: Date
    var activity: Activity?
    var comment: String
    
    init(date: Date, comment: String = "") {
        self.date = date
        self.comment = comment
    }
}

enum ActivitySymbol: String, CaseIterable {
    case mixedCardio = "figure.mixed.cardio"
    case two = "figure.2"
    case walk = "figure.walk"
    case walkDeparture = "figure.walk.departure"
    case walkMotion = "figure.walk.motion"
    case walkMotionTriangleBadgeExclamationMark = "figure.walk.motion.trianglebadge.exclamationmark"
    case wave = "figure.wave"
    case fall = "figure.fall"
    case run = "figure.run"
    case runSquareStack = "figure.run.square.stack"
    case runSquareStackFill = "figure.run.square.stack.fill"
    case roll = "figure.roll"
    case rollRunningPace = "figure.roll.runningpace"
    case americanFootball = "figure.american.football"
    case archery = "figure.archery"
    case australianFootball = "figure.australian.football"
    case badminton = "figure.badminton"
    case barre = "figure.barre"
    case baseball = "figure.baseball"
    case basketball = "figure.basketball"
    case bowling = "figure.bowling"
    case boxing = "figure.boxing"
    case climbing = "figure.climbing"
    case cooldown = "figure.cooldown"
    case coreTraining = "figure.core.training"
    case cricket = "figure.cricket"
    case skiingCrossCountry = "figure.skiing.crosscountry"
    case crossTraining = "figure.cross.training"
    case curling = "figure.curling"
    case dance = "figure.dance"
    case discSports = "figure.disc.sports"
    case skiingDownhill = "figure.skiing.downhill"
    case elliptical = "figure.elliptical"
    case equestrianSports = "figure.equestrian.sports"
    case fencing = "figure.fencing"
    case fishing = "figure.fishing"
    case flexibility = "figure.flexibility"
    case strengthTrainingFunctional = "figure.strengthtraining.functional"
    case golf = "figure.golf"
    case gymnastics = "figure.gymnastics"
    case handCycling = "figure.hand.cycling"
    case handball = "figure.handball"
    case highIntensityIntervalTraining = "figure.highintensity.intervaltraining"
    case hiking = "figure.hiking"
    case hockey = "figure.hockey"
    case hunting = "figure.hunting"
    case indoorCycle = "figure.indoor.cycle"
    case jumprope = "figure.jumprope"
    case kickboxing = "figure.kickboxing"
    case lacrosse = "figure.lacrosse"
    case martialArts = "figure.martial.arts"
    case mindAndBody = "figure.mind.and.body"
    case openWaterSwim = "figure.open.water.swim"
    case outdoorCycle = "figure.outdoor.cycle"
    case oar2Crossed = "oar.2.crossed"
    case pickleball = "figure.pickleball"
    case pilates = "figure.pilates"
    case play = "figure.play"
    case poolSwim = "figure.pool.swim"
    case racquetball = "figure.racquetball"
    case rolling = "figure.rolling"
    case rower = "figure.rower"
    case rugby = "figure.rugby"
    case sailing = "figure.sailing"
    case skating = "figure.skating"
    case snowboarding = "figure.snowboarding"
    case soccer = "figure.soccer"
    case socialDance = "figure.socialdance"
    case softball = "figure.softball"
    case squash = "figure.squash"
    case stairStepper = "figure.stair.stepper"
    case stairs = "figure.stairs"
    case stepTraining = "figure.step.training"
    case surfing = "figure.surfing"
    case tableTennis = "figure.table.tennis"
    case taichi = "figure.taichi"
    case tennis = "figure.tennis"
    case trackAndField = "figure.track.and.field"
    case strengthTrainingTraditional = "figure.strengthtraining.traditional"
    case volleyball = "figure.volleyball"
    case waterFitness = "figure.water.fitness"
    case waterpolo = "figure.waterpolo"
    case wrestling = "figure.wrestling"
    case yoga = "figure.yoga"
}
