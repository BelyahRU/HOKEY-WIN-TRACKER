
import Foundation
import UIKit

extension TableViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        tableView.teamsCollectionView.dataSource = self
        tableView.teamsCollectionView.delegate = self
        tableView.teamsCollectionView.register(TeamCell.self, forCellWithReuseIdentifier: TeamCell.identifier)
        tableView.teamsCollectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.identifier)
                
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? leadingTeams.count : outsiderTeams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamCell.identifier, for: indexPath) as! TeamCell
        
        let teamName = indexPath.section == 0 ? leadingTeams[indexPath.item] : outsiderTeams[indexPath.item]
        
        cell.configure(with: teamName, section: indexPath.section)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.identifier, for: indexPath) as! SectionHeaderView
        
        let sectionTitle = indexPath.section == 0 ? "teams leading the championship" : "outsiders"
        let sectionColor = indexPath.section == 0 ? Resources.Colors.leadersTextColor
        : Resources.Colors.outsidersTextColor
        
        headerView.configure(with: sectionTitle, textColor: sectionColor)
        return headerView
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = TeamProfileViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}
