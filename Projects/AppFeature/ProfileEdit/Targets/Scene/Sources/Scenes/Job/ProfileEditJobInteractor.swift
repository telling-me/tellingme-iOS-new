//
//  ProfileEditJobInteractor.swift
//  ProfileEdit
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Combine
import Foundation

import AppCore_Entity
import SharedKit

protocol ProfileEditJobBusinessLogic {
    func loadIfNeeded()
    func storeJob(selectedJob: ProfileEditJob.Job, etc: String?)
}

protocol ProfileEditJobDataStore: AnyObject {}

final class ProfileEditJobInteractor: ProfileEditJobBusinessLogic, ProfileEditJobDataStore {
    private let presenter: ProfileEditJobPresentationLogic
    private let worker: ProfileEditJobWorkerProtocol
    private let externalDataStore: ProfileEditDataStore

    private var etc: String?

    init(
        presenter: any ProfileEditJobPresentationLogic,
        worker: any ProfileEditJobWorkerProtocol,
        externalDataStore: ProfileEditDataStore
    ) {
        self.presenter = presenter
        self.worker = worker
        self.externalDataStore = externalDataStore
    }
}

// MARK: Feature

extension ProfileEditJobInteractor {
    func loadIfNeeded() {
        let profile = externalDataStore.editingProfile?.profileInfo
        presenter.presentJob(job: profile?.job)
    }

    func storeJob(selectedJob: ProfileEditJob.Job, etc: String?) {
        var job: EditingProfile.Job?

        switch selectedJob {
        case .중고등학생:
            job = .중고등학생
        case .대학생:
            job = .대학생
        case .취업준비생:
            job = .취업준비생
        case .직장인:
            job = .직장인
        case .주부:
            job = .주부
        case .기타:
            if let etc {
                job = .기타(etc)
            }
        }

        externalDataStore.editingProfile?.profileInfo.job = job
    }
}
