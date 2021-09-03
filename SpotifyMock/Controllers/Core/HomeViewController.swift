//
//  ViewController.swift
//  SpotifyMock
//
//  Created by Cesar Alcantara on 8/26/21.
//

import UIKit

enum BrowseSectionType {
    case newReleases // 1
    case featuredPlaylists // 2
    case recommendedTracks // 3
}

class HomeViewController: UIViewController {
    
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
        return createSectionLayout(section: sectionIndex)
    })
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.tintColor = .label
        spinner.hidesWhenStopped = true
        return spinner
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        // adding gear icon on nav bar to get to settings UI
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gear"),
            style: .done, target: self,
            action: #selector(didTapSettings)
        )
        // configure collection view
        configureCollectionView()
        // order of adding the spinner is important
        view.addSubview(spinner)
        // fetching api data
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    // MARK: - Configure the Collection View
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
    }
    
    // MARK: - API Call
    private func fetchData() {
        // New Releases
        // Featured Playlist
        // Recommended Tracks
        
        
        APICaller.shared.getRecommendationsGenres { result in
            switch result {
            case .success(let model):
                let genres = model.genres
                var seeds = Set<String>()
                while seeds.count < 5 {
                    if let random = genres.randomElement() {
                        seeds.insert(random)
                    }
                }
                APICaller.shared.getRecommendations(genres: seeds) { _ in
                    
                }
            case .failure(let error):
                break
            }
            }
        }
//        APICaller.shared.getAllNewReleases { result in
//            switch result {
//            case .success(let model):
//                print(model)
//                break
//            case .failure(let error):
//                print(error.localizedDescription)
//                break
//            }
//        }
    
    // MARK: - Settings Handler
    @objc func didTapSettings() {
        let vc = SettingsViewController()
        vc.title = "Settings"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - Extensions

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Data Source Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        if indexPath.section == 0 {
            cell.backgroundColor = .systemGreen
        } else if indexPath.section == 1 {
            cell.backgroundColor = .red
        } else if indexPath.section == 2 {
            cell.backgroundColor = .blue
        }
        return cell
    }
    
    // MARK: - Delegate Functions
    
    // MARK: - Section Layout
    static func createSectionLayout(section: Int) -> NSCollectionLayoutSection {
        switch section {
        case 0:
            // item
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            //item padding
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            // group -> Vertical Group Inside a Horizontal Group
            let verticalGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(390)
                ),
                subitem: item,
                count: 3
            )
            
            // notes: FractionalWidth .9 lets the bleed of the other groups
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.9),
                    heightDimension: .absolute(390)
                ),
                subitem: verticalGroup,
                count: 1
            )
            
            // section
            let section = NSCollectionLayoutSection(group: horizontalGroup)
            // pages each of the horizontal groups
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        case 1:
            // item
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(200),
                    heightDimension: .absolute(200)
                )
            )
            //item padding
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            // group -> Vertical Group Inside a Horizontal Group
            let verticalGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(200),
                    heightDimension: .absolute(400)
                ),
                subitem: item,
                count: 2
            )
            
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(200),
                    heightDimension: .absolute(400)
                ),
                subitem: verticalGroup,
                count: 1
            )
            
            // section
            let section = NSCollectionLayoutSection(group: horizontalGroup)
            // flows through like a webpage scroll
            section.orthogonalScrollingBehavior = .continuous
            return section
        case 2:
            // item
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalWidth(1.0)
                )
            )
            //item padding
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            // notes: FractionalWidth .9 lets the bleed of the other groups
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(80)
                ),
                subitem: item,
                count: 1
            )
            
            // section
            let section = NSCollectionLayoutSection(group: group)
            return section
        default:
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(390)
                ),
                subitem: item,
                count: 1
            )
            
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
    }
    
}





