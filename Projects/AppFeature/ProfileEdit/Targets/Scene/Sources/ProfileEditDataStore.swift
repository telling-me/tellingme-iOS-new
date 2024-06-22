//
//  ProfileEditDataStore.swift
//  ProfileEditScene
//
//  Created by Woody Lee on 6/22/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import Foundation

public final class ProfileEditDataStore {
    var editingProfile: EditingProfile?

    public init(editingProfile: EditingProfile? = nil) {
        self.editingProfile = editingProfile
    }
}
