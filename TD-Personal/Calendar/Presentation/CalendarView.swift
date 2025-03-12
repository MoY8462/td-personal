//
//  CalendarView.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 13/01/25.
//
import SwiftUI
import SwiftData

struct CalendarView: View {
    let date: Date
    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    @State private var days: [DayInfo] = []
    @State private var daysInfo: [DayInfo] = []
    @State var showBottomInfo: Bool = false
    var selectedActivity: Activity?
    var workouts: [Workout]
    @State private var counts = [Int : Int]()
    
    init(date: Date, selectedActivity: Activity?, workouts: [Workout]) {
        self.date = date
        self.selectedActivity = selectedActivity
        self.workouts = workouts
    }

    var body: some View {
        NavigationStack {
                VStack {
                    HStack {
                        ForEach(daysOfWeek.indices, id: \.self) { index in
                        Text(daysOfWeek[index])
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.bluePrimary)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.horizontal)
                    LazyVGrid(columns: columns) {
                        ForEach(days) { dayInfo in
                            if dayInfo.date.monthInt != date.monthInt {
                                Text("")
                            } else {
                                Text(dayInfo.date.formatted(.dateTime.day()))
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .background(
                                        Circle()
                                            .foregroundStyle(
                                                Date.now.startOfDay == dayInfo.date.startOfDay
                                                ? Color.greenPrimary.opacity(counts[dayInfo.date.dayInt] != nil ? 0.8 : 0.8)
                                                : Color.bluePrimary.opacity(counts[dayInfo.date.dayInt] != nil ? 0.8 : 0.3)
                                            )
                                    )
//                                    .onTapGesture {
////                                        if(counts[dayInfo.date.dayInt]) {
//                                        showBottomInfo.toggle()
////                                            print(dayInfo)
////                                        }
//                                    }
//                                    .sheet(
//                                        isPresented: $showBottomInfo,
//                                        content: {
//                                            InfoMessageDayView(
//                                                title: dayInfo.title ?? "No existe información a mostrar",
//                                                contentInfo: dayInfo.message ?? "No existe información a mostrar",
//                                                showBottomInfo: $showBottomInfo
//                                            )
//                                            .presentationDetents([.fraction(0.2)])
//                                    })
//                                    .overlay(alignment: .bottomTrailing) {
//                                        if let count = counts[day.dayInt] {
//                                            Image(systemName: count <= 50 ? "\(count).circle.fill" : "plus.circle.fill")
//                                                .foregroundColor(.secondary)
//                                                .imageScale(.medium)
//                                                .background (
//                                                    Color(.systemBackground)
//                                                        .clipShape(.circle)
//                                                )
//                                                .offset(x: 5, y: 5)
//                                        }
//                                    }
                            }
                        }
                    }
                    .padding()
                    .onAppear {
                        days = date.calendarDisplayDays.map { DayInfo(date: $0, title: nil, message: nil) }
                        setupCounts()
                    }
                    .onChange(of: date) {
                        days = date.calendarDisplayDays.map { DayInfo(date: $0, title: nil, message: nil) }
                        setupCounts()
                    }
                    .onChange(of: selectedActivity) {
                        setupCounts()
                    }
                    
                    VStack(alignment: .leading) {
                        ForEach(daysInfo.filter { $0.date.monthInt == date.monthInt }) { dayInfo in
                            if counts[dayInfo.date.dayInt] != nil {
                                DayComponentView(dayInfo: dayInfo)
                            }
                        }
                    }
                    .padding()
            }
             .padding(.vertical)
        }
    }
    func setupCounts() {
        var uniqueItems = [Int: Int]()
        var dayInfos = [DayInfo]()
        for workout in workouts {
            let dayInt = workout.date.dayInt
            if workout.date.monthInt == date.monthInt {
                if uniqueItems[dayInt] == nil {
                    uniqueItems[dayInt] = 1
                } else {
                    uniqueItems[dayInt]! += 1
                }
            }
            let dayInfo = DayInfo(date: workout.date, title: workout.titleDate, message: workout.messageDate)
            dayInfos.append(dayInfo)
        }
        counts = uniqueItems
        daysInfo = dayInfos
    }
}

class DayInfo: Identifiable {
    var id = UUID()
    var date: Date
    var title: String?
    var message: String?
    
    init(date: Date, title: String? = nil, message: String? = nil) {
        self.date = date
        self.title = title
        self.message = message
    }
}
