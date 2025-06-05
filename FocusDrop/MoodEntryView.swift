//
//  MoodEntryView.swift
//  FocusDrop
//
//  Created by Wan Lin Yang on 2025/6/5.
//

import SwiftUI

struct MoodEntryView: View {
    @State private var selectedMood: String? = nil
    @State private var noteText: String = ""
    @State private var didExercise: Bool = false
    @State private var didMeditate: Bool = false


    let moods = ["😀", "🙂", "😐", "😞", "😡"]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Today's Mood")
                .font(.headline)

            HStack {
                ForEach(moods, id: \.self) { mood in
                    Text(mood)
                        .font(.largeTitle)
                        .padding()
                        .background(selectedMood == mood ? Color.blue.opacity(0.2) : Color.clear)
                        .cornerRadius(8)
                        .onTapGesture {
                            selectedMood = mood
                        }
                }
            }

            TextEditor(text: $noteText)
                .frame(height: 100)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.3)))

            Button(action: {
                print("Mood: \(selectedMood ?? "None")")
                print("Note: \(noteText)")
                print("Exercise: \(didExercise)")
                print("Meditation: \(didMeditate)")
            }) {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

        }
        .padding()
        // 加在 Save 按鈕下面
        VStack(alignment: .leading, spacing: 8) {
            Text("Today's Habits")
                .font(.headline)
                .padding(.top)

            Toggle("Exercise", isOn: $didExercise)
            Toggle("Meditation", isOn: $didMeditate)
        }

    }
}
