//
//  CalendarHeaderView.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 25/02/25.
//

import SwiftUI
import SwiftData

struct CalendarHeaderView: View {
    @State private var monthDate = Date.now
    @State private var years: [Int] = []
    @State private var selectedMonth = Date.now.monthInt
    @State private var selectedYear = Date.now.yearInt
    @State private var workouts: [Workout] = []
    @State private var activities: [Activity] = []
    @State private var selectedActivity: Activity?
    
    let months = Date.fullMonthNames
    
    var body: some View {
        NavigationStack {
            NavBar(title: .calendar)
            ScrollView {
                VStack {
                    activityPickerMenu()
                    monthNavigation()
                    CalendarView(
                        date: monthDate,
                        selectedActivity: selectedActivity,
                        workouts: selectedActivity?.workouts ?? []
                    )
                }
            }
        }
        .onAppear {
            let currentYear = Calendar.current.component(.year, from: Date())
            years = [currentYear]
            fetchActivities()
            if selectedActivity == nil, let firstActivity = activities.first {
                selectedActivity = firstActivity
            }
        }
        .onChange(of: selectedYear) {
            updateDate()
        }
        .onChange(of: selectedMonth) {
            updateDate()
        }
    }
    
    @ViewBuilder
    private func activityPickerMenu() -> some View {
        Menu {
            Picker("picker", selection: $selectedActivity) {
                ForEach(activities) { activity in
                    Text(activity.name).tag(activity as Activity?)
                }
            }
            .labelsHidden()
            .pickerStyle(InlinePickerStyle())
        } label: {
            HStack {
                Rectangle()
                    .foregroundColor(Color(.systemBackground))
                    .frame(height: 40)
                Image(systemName: "chevron.down")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.bluePrimary)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
            }
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.bluePrimary, lineWidth: 2)
            )
            .overlay(
                Text("\(selectedActivity?.name ?? "")")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.bluePrimary)
            )
            .padding(EdgeInsets(top: 16, leading: 32, bottom: 0, trailing: 32))
        }
    }
    
    @ViewBuilder
    private func monthNavigation() -> some View {
        HStack(spacing: 8) {
            Button(action: decrementMonth) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.bluePrimary)
            }
            Spacer()
            monthMenu()
            Spacer()
            Button(action: incrementMonth) {
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.bluePrimary)
            }
        }
        .padding(EdgeInsets(top: 16, leading: 40, bottom: 8, trailing: 40))
    }
    
    @ViewBuilder
    private func monthMenu() -> some View {
        Menu {
            ForEach(months.indices, id: \.self) { index in
                Button(action: {
                    selectedMonth = index + 1
                    updateDate()
                }) {
                    Text("\(months[index]) \(String(selectedYear))")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.bluePrimary)
                }
            }
        } label: {
            Text("\(months[selectedMonth - 1]) \(String(selectedYear))")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.bluePrimary)
                .padding()
        }
    }
    
    func fetchActivities() {
        activities = MockActivityService.shared.getPreviewActivities()
        workouts = activities.flatMap { $0.workouts }
    }
    
    func updateDate() {
        monthDate = Calendar.current.date(from: DateComponents(year: selectedYear, month: selectedMonth, day: 1))!
    }
    
    func incrementMonth() {
        if selectedMonth == 12 {
            selectedMonth = 1
//            selectedYear += 1
        } else {
            selectedMonth += 1
        }
        updateDate()
    }
    
    func decrementMonth() {
        if selectedMonth == 1 {
            selectedMonth = 12
//            selectedYear -= 1
        } else {
            selectedMonth -= 1
        }
        updateDate()
    }
}

#Preview {
    CalendarHeaderView()
}
