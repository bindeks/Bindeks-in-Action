//
//  Team.swift
//  Bindeks
//
//  Created by volodymyrkhmil on 1/31/17.
//  Copyright © 2017 BBBSamples. All rights reserved.
//

import UIKit

protocol TeamViewDelegate: class {
    func teamView(view: TeamView, didSelect companyMember: CompanyMember)
}

class TeamView: BBBXIBView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: Constants
    
    private struct Constants {
        struct Intervals {
            static let imagesChanging: TimeInterval = 1
        }
    }
    
    //MARK: IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    //MARK: Properties
    
    var companyMembers: [CompanyMember]? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    weak var delegate: TeamViewDelegate?
    
    //MARK: UITableViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.companyMembers?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.bbb_dequeueReusableCell(type: TeamMemberCell.self, indexPath: indexPath) ?? UICollectionViewCell()
    }
    
    //MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? TeamMemberCell {
            //TODO: add safe object
            let companyMember = self.companyMembers?[indexPath.row]
            self.fill(cell: cell, with: companyMember)
            cell.start(with: Constants.Intervals.imagesChanging)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? TeamMemberCell {
            cell.clear()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let companyMember = self.companyMembers?[indexPath.row] {
            self.delegate?.teamView(view: self, didSelect: companyMember)
        }
    }
    
    //MARK: Private.Methods
    
    private func fill(cell: TeamMemberCell, with companyMember: CompanyMember?) {
        cell.bind(with: companyMember)
        cell.images = [companyMember?.topImage, companyMember?.botImage]
    }
}

