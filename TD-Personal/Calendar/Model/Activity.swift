//
//  Activity.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 23/01/25.
//

import Foundation
import UIKit

class Activity: Identifiable, Equatable, Hashable {
    var id = UUID()
    var name: String
    var hexColor: String
    var workouts: [Workout] = []
    
    init(name: String, hexColor: String = "FF0000") {
        self.name = name
        self.hexColor = hexColor
    }
    
    static func == (lhs: Activity, rhs: Activity) -> Bool {
        return lhs.name == rhs.name && lhs.hexColor == rhs.hexColor && lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(hexColor)
        hasher.combine(id)
    }
}

class Workout {
    var date: Date
    var titleDate: String
    var messageDate: String
    var activity: Activity?
    
    init(date: Date, titleDate: String, messageDate: String) {
        self.date = date
        self.titleDate = titleDate
        self.messageDate = messageDate
    }
}

class MockActivityService {
    static let shared = MockActivityService()
    
    private init() {}
    
    func getPreviewActivities() -> [Activity] {
        // Definir actividades de muestra
        let escolar = Activity(name: "Escolar", hexColor: "B33234")
        let pagos = Activity(name: "Pagos", hexColor: "6F223D")
        let diasAsueto = Activity(name: "Días de asueto", hexColor: "6F223D")
        
        // Definir entrenamientos de muestra para cada actividad
        let escolarWorkouts = [
            Workout(
                date: Date.now.addingTimeInterval(-86400 * 1),
                titleDate: "Día examen",
                messageDate: "Día de prueba 1"
            ), // 1 día atrás
            Workout(
                date: Date.now.addingTimeInterval(-86400 * 2),
                titleDate: "Día extraordinarios",
                messageDate: "Día de prueba 2"
            ), // 2 días atrás
            Workout(
                date: Date.now.addingTimeInterval(-86400 * 3),
                titleDate: "Día finales",
                messageDate: "Día de prueba 3"
            )  // 3 días atrás
        ]
        
        // Asignar entrenamientos a las actividades
        escolar.workouts.append(contentsOf: escolarWorkouts)
        
        // Obtener y agregar días de pago
        let paydays = getPaydayDates(for: Calendar.current.component(.year, from: Date()))
        for payday in paydays {
            let paydayWorkout = Workout(
                date: payday,
                titleDate: "Día de pago",
                messageDate: "Dia que cae deposito"
            )
            pagos.workouts.append(paydayWorkout)
        }
        
        // Obtener y agregar días festivos
        let holidays = getMexicanHolidays(for: Calendar.current.component(.year, from: Date()))
        diasAsueto.workouts.append(contentsOf: holidays)
        
        return [escolar, pagos, diasAsueto]
    }
    
    private func getPaydayDates(for year: Int) -> [Date] {
        var paydays = [Date]()
        let calendar = Calendar.current
        
        for month in 1...12 {
            // 15th of the month
            if let fifteenth = calendar.date(from: DateComponents(year: year, month: month, day: 15)) {
                paydays.append(adjustForWeekend(date: fifteenth))
            }
            
            // Last day of the month
            if let range = calendar.range(of: .day, in: .month, for: calendar.date(from: DateComponents(year: year, month: month))!) {
                if let lastDay = calendar.date(from: DateComponents(year: year, month: month, day: range.count)) {
                    paydays.append(adjustForWeekend(date: lastDay))
                }
            }
        }
        
        return paydays
    }
    
    private func adjustForWeekend(date: Date) -> Date {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)
        
        if weekday == 7 { // Saturday
            return calendar.date(byAdding: .day, value: -1, to: date)!
        } else if weekday == 1 { // Sunday
            return calendar.date(byAdding: .day, value: -2, to: date)!
        }
        
        return date
    }
    
    private func getMexicanHolidays(for year: Int) -> [Workout] {
        var holidays = [Date]()
        var workout = [Workout]()
        let calendar = Calendar.current
        
        // Año Nuevo
        if let newYear = calendar.date(from: DateComponents(year: year, month: 1, day: 1)) {
            workout.append(Workout(date: newYear, titleDate: "Año nuevo", messageDate: "Feliz año nuevo"))
        }
        
        // Día de la Constitución (primer lunes de febrero)
        if let constitutionDay = calendar.date(from: DateComponents(year: year, month: 2, weekday: 2, weekdayOrdinal: 1)) {
            holidays.append(constitutionDay)
            workout.append(Workout(date: constitutionDay, titleDate: "Día de la Constitución", messageDate: "Día de la Constitución"))
        }
        
        // Natalicio de Benito Juárez (tercer lunes de marzo)
        if let benitoJuarezDay = calendar.date(from: DateComponents(year: year, month: 3, weekday: 2, weekdayOrdinal: 3)) {
            holidays.append(benitoJuarezDay)
            workout.append(Workout(date: benitoJuarezDay, titleDate: "Natalicio de Benito Juárez", messageDate: "Natalicio de Benito Juárez"))
        }
        
        // Día del Trabajo
        if let laborDay = calendar.date(from: DateComponents(year: year, month: 5, day: 1)) {
            holidays.append(laborDay)
            workout.append(Workout(date: laborDay, titleDate: "Día del Trabajo", messageDate: "Día del Trabajo"))
        }
        
        // Día de la Independencia
        if let independenceDay = calendar.date(from: DateComponents(year: year, month: 9, day: 16)) {
            holidays.append(independenceDay)
            workout.append(Workout(date: independenceDay, titleDate: "Día de la Independencia", messageDate: "Día de la Independencia"))
        }
        
        // Día de la Revolución (tercer lunes de noviembre)
        if let revolutionDay = calendar.date(from: DateComponents(year: year, month: 11, weekday: 2, weekdayOrdinal: 3)) {
            holidays.append(revolutionDay)
            workout.append(Workout(date: revolutionDay, titleDate: "Día de la Revolución", messageDate: "Día de la Revolución"))
        }
        
        // Navidad
        if let christmasDay = calendar.date(from: DateComponents(year: year, month: 12, day: 25)) {
            holidays.append(christmasDay)
            workout.append(Workout(date: christmasDay, titleDate: "Navidad", messageDate: "Navidad"))
        }
        
        return workout
    }
}
