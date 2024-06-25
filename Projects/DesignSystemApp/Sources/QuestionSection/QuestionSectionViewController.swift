import AppCore_DesignSystem
import UIKit
import SnapKit

final class QuestionSectionViewController: UIViewController, UICollectionViewDelegate {
    private typealias DataSource = UICollectionViewDiffableDataSource<Int, Content>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Content>
    
    struct Content: Hashable {
        let id: Int
        let content: QuestionSectionView.Content
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        static func ==(lhs: Content, rhs: Content) -> Bool {
            return lhs.id == rhs.id
        }
    }
    
    private let testQuestions: [Content] = [
        .init(id: 1, content: .init(question: "소속된 집단에서 내가 주로 맡는 역할은?", subQuestion: "그 역할이 나의 성향을 반영할 수 있어요.")),
        .init(id: 2, content: .init(question: "지금까지의 나의 인생을 두 단계로\n나눈다면 어느 시점에 구분선을 둘 건가요?", subQuestion: "스스로 크게 변화한 시점을 떠올려봐요.")),
        .init(id: 3, content: .init(question: "스트레스에 대처하는 나만의 전략은?", subQuestion: "그 전략을 세우고 실천하기 위해\n필요한 것들을 정리해봐요.")),
        .init(id: 4, content: .init(question: "소속된 집단에서 내가 주로 맡는 역할은?", subQuestion: "그 역할이 나의 성향을 반영할 수 있어요.")),
        .init(id: 5, content: .init(question: "지금까지의 나의 인생을 두 단계로\n나눈다면 어느 시점에 구분선을 둘 건가요?", subQuestion: "스스로 크게 변화한 시점을 떠올려봐요.")),
        .init(id: 6, content: .init(question: "스트레스에 대처하는 나만의 전략은?", subQuestion: "그 전략을 세우고 실천하기 위해\n필요한 것들을 정리해봐요."))
    ]
    
    private let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private lazy var dataSource = makeDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        applySnapshot()
    }
    
    private func configureCollectionView() {
        collectionView.do {
            $0.delegate = self
            $0.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
            $0.register(ButtonCell.self, forCellWithReuseIdentifier: ButtonCell.identifier)
            
            view.addSubview($0)
            $0.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
            
            let layout = UICollectionViewFlowLayout()
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
            $0.collectionViewLayout = layout
        }
    }
    
    private func makeDataSource() -> DataSource {
        return DataSource(collectionView: collectionView) { collectionView, indexPath, item in
            if indexPath.item < 3 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as! Cell
                cell.configure(content: item)
                return cell
            } else {
                let buttonCell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCell.identifier, for: indexPath) as! ButtonCell
                buttonCell.configure(content: item)
                return buttonCell
            }
        }
    }
    
    private func applySnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(testQuestions, toSection: 0)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension QuestionSectionViewController {
    final class Cell: UICollectionViewCell {
        static let identifier = "QuestionSectionCell"
        
        private let questionSectionView: QuestionSectionView = QuestionSectionView(hasButton: false)
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupUI() {
            addSubview(questionSectionView)
            questionSectionView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
        
        func configure(content: Content) {
            questionSectionView.configure(with: content.content)
        }
    }
    
    final class ButtonCell: UICollectionViewCell {
        static let identifier = "ButtonQuestionSectionCell"
        
        private let questionSectionView: QuestionSectionView = QuestionSectionView(hasButton: true)
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupUI() {
            addSubview(questionSectionView)
            questionSectionView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
        
        func configure(content: Content) {
            questionSectionView.configure(with: content.content)
        }
    }
}

extension QuestionSectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item < 3 {
            return CGSize(width: collectionView.bounds.width - 40, height: 142)
        } else {
            return CGSize(width: collectionView.bounds.width - 40, height: 208)
        }
    }
}

