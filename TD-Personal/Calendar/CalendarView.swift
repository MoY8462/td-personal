//
//  CalendarView.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 13/01/25.
//
import SwiftUI

struct CalendarView: View {
    @ObservedObject var calendarRouter = CalendarRouter()
    @State private var selectedDates:Set<DateComponents> = []
    @State private var finalDates:String = ""
    @State private var showBottomSheet:Bool = false
    @State private var selectedDate:DateComponents?

    var body: some View {
        NavigationStack {
            NavBar(title: .calendar)
            ScrollView {
                VStack {
                    ZStack {
                        //                        DatePicker("Select Date", selection: $selectedDate, in: sixMonthsAgo..., displayedComponents: .date)
                        //                            .datePickerStyle(GraphicalDatePickerStyle())
                        //                            .padding()
                        MultiDatePicker("Select Date", selection: $selectedDates, in: sixMonthsAgo...)
                            .onChange(of: selectedDates) { newDates in
                                if let date = newDates.first {
                                    selectedDate = date
                                    showBottomSheet = true
                                }
                            }
                        .onAppear {
                            simulateDateConsumption()
                        }
                    
                        // Overlay to highlight important dates
                    }
                    Text(finalDates)

//                    Button(action: {
//                        getDatesFormatted()
//                    }) {
//                        Text("Aceptar")
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(8)
//                    }
                }
                .sheet(isPresented: $showBottomSheet) {
                    if let selectedDate = selectedDate, let date = Calendar.current.date(from: selectedDate) {
                        VStack {
                            Text("Selected Date")
                                .font(.headline)
                            Text("\(date, formatter: dateFormatter)")
                                .font(.title)
                            Button("Close") {
                                showBottomSheet = false
                            }
                            .padding()
                        }
                        .padding()
                    }
                }
            }
        }
    }

    private var sixMonthsAgo: Date {
        Calendar.current.date(byAdding: .month, value: -6, to: Date())!
    }
    
    func getDatesFormatted() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YY"
        
        let dates = selectedDates
            .compactMap { Calendar.current.date(from: $0) }
            .map { formatter.string(from: $0) }
        finalDates = dates.joined(separator: "\n")
    }
    
    private func simulateDateConsumption() {
        let calendar = Calendar.current
        let today = Date()
        let randomDates = (1...10).map { _ in
            calendar.date(byAdding: .day, value: Int.random(in: -180...0), to: today)!
        }
        selectedDates = Set(randomDates.map { calendar.dateComponents([.year, .month, .day], from: $0) })
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
}



