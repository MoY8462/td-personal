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
    @State private var days: [Date] = []
    let selectedActivity: Activity?
    @Query private var workouts: [Workout]
    @State private var counts = [Int : Int]()
    
    init(date: Date, selectedActivity: Activity?) {
        self.date = date
        self.selectedActivity = selectedActivity
        let endOfMonthAdjustment = Calendar.current.date(byAdding: .day, value: 1, to: date.endOfMonth)!
        let predicate = #Predicate<Workout> {$0.date >= date.startOfMonth && $0.date < endOfMonthAdjustment}
        _workouts = Query(filter: predicate, sort: \Workout.date)
    }

    var body: some View {
        NavigationStack {
            
                
                VStack {
                    HStack {
                        ForEach(daysOfWeek.indices, id: \.self) { index in
                        Text(daysOfWeek[index])
                                .fontWeight(.black)
                                .foregroundStyle(.blue)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    LazyVGrid(columns: columns) {
                        ForEach(days, id: \.self) { day in
                            if day.monthInt != date.monthInt {
                                Text("")
                            } else {
                                Text(day.formatted(.dateTime.day()))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.secondary)
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .background(
                                        Circle()
                                            .foregroundStyle(
                                                Date.now.startOfDay == day.startOfDay
                                                ? .red.opacity(counts[day.dayInt] != nil ? 0.8 : 0.3)
                                                :  .blue.opacity(counts[day.dayInt] != nil ? 0.8 : 0.3)
                                            )
                                    )
                                    .overlay(alignment: .bottomTrailing) {
                                        if let count = counts[day.dayInt] {
                                            Image(systemName: count <= 50 ? "\(count).circle.fill" : "plus.circle.fill")
                                                .foregroundColor(.secondary)
                                                .imageScale(.medium)
                                                .background (
                                                    Color(.systemBackground)
                                                        .clipShape(.circle)
                                                )
                                                .offset(x: 5, y: 5)
                                        }
                                    }
                            }
                    }
                }
                .padding()
                .onAppear {
                    days = date.calendarDisplayDays
                    setupCounts()
                }
                .onChange(of: date) {
                    days = date.calendarDisplayDays
                    setupCounts()
                }
                .onChange(of: selectedActivity) {
                    setupCounts()
                }
            }
        }
    }

    func setupCounts() {
        var filteredWorkouts = workouts
        if let selectedActivity {
            filteredWorkouts = workouts.filter {$0.activity == selectedActivity}
        }
        let mappedItems = filteredWorkouts.map{($0.date.dayInt, 1)}
        counts = Dictionary(mappedItems, uniquingKeysWith: +)
    }
}

struct CalendarHeaderView: View {
    @State private var monthDate = Date.now
    @State private var years: [Int] = []
    @State private var selectedMonth = Date.now.monthInt
    @State private var selectedYear = Date.now.yearInt
    @Query private var workouts: [Workout]
    @Query(sort: \Activity.name) private var activities: [Activity]
    @State private var selectedActivity: Activity?
    
    let months = Date.fullMonthNames
    var body: some View {
        NavigationStack {
            NavBar(title: .calendar)
            ScrollView {
                VStack {
                    Picker("", selection: $selectedActivity) {
                        Text("All").tag(nil as Activity?)
                        ForEach(activities) { activity in
                            Text(activity.name).tag(activity as Activity?)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    HStack {
                        Picker("", selection: $selectedYear) {
                            ForEach(years, id:\.self) { year in
                                Text(String(year))
                            }
                        }
                        Picker("", selection: $selectedMonth) {
                            ForEach(months.indices, id: \.self) { index in
                                Text(months[index]).tag(index + 1)
                            }
                        }
                    }
                    .buttonStyle(.bordered)
                    CalendarView(date: monthDate, selectedActivity: selectedActivity)
                    Spacer()
                }
            }
        }
        .onAppear {
            years = Array(Set(workouts.map {$0.date.yearInt}.sorted()))
        }
        .onChange(of: selectedYear) {
            updateDate()
        }
        .onChange(of: selectedMonth) {
            updateDate()
        }
    }
    
    func updateDate() {
        monthDate = Calendar.current.date(from: DateComponents(year: selectedYear, month: selectedMonth, day: 1))!
    }
}

#Preview {
    CalendarHeaderView()
        .modelContainer(Activity.preview)
}
