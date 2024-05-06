//
//  ViewModel.swift
//  Notes
//
//  Created by Jair Amaro  on 05/05/24.
//

import Foundation
import Observation

@Observable
class ViewModel {
    var notes: [Note]
    
    init(notes: [Note] = []) {
        self.notes = notes
    }
    
    func createNoteWith(title: String, tetx: String) {
        let note: Note = .init(title: title, text: tetx, createdAt: .now)
        self.notes.append(note)
    }
    
    func updateNoteWith(id: UUID, newTitle: String, newText: String?) {
        if let index = notes.firstIndex(where: { $0.id == id }) {
            let updateNote: Note = .init(title: newTitle, text: newText, createdAt: self.notes[index].createdAt)
            self.notes[index] = updateNote
        }
    }
    
    func removeNoteWith(id: UUID) {
        notes.removeAll(where: { $0.id == id })
    }
}
