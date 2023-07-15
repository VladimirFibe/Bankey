import UIKit

final class AccountSummaryCell: UITableViewCell {
    
    enum AccountType: String {
        case Banking
        case CreditCard
        case Investment
        
        var balanceLabel: String {
            switch self {
            case .Banking: return "Current balance"
            case .CreditCard: return "Balance"
            case .Investment: return "Value"
            }
        }
        
        var color: UIColor {
            switch self {
            case .Banking: return .appColor
            case .CreditCard: return .systemOrange
            case .Investment: return .systemPurple
            }
        }
    }
    
    struct ViewModel {
        let accountType: AccountType
        let accountName: String
        let balance: Decimal
    }
    static let id = "AccountSummaryCell"
    static let rowHeight: CGFloat = 112
    var viewModel: ViewModel? = nil
    let typeLabel = UILabel()
    let underlineView = UIView()
    let nameLabel = UILabel()
    
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    let chevronImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension AccountSummaryCell {
    private func setupViews() {
        setupTypeLabel()
        setupUnderlineView()
        setupNameLabel()
        setupBalanceStackView()
        setupBalanceLabel()
        setupBalanceAmountLabel()
        setupChevronImageView()
    }
    
    private func setupTypeLabel() {
        contentView.addSubview(typeLabel)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = .preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2)
        ])
    }
    
    private func setupUnderlineView() {
        contentView.addSubview(underlineView)
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.backgroundColor = .appColor
        NSLayoutConstraint.activate([
            underlineView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
            underlineView.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
            underlineView.trailingAnchor.constraint(equalTo: typeLabel.trailingAnchor),
            underlineView.heightAnchor.constraint(equalToConstant: 4)
        ])
    }
    
    private func setupNameLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .preferredFont(forTextStyle: .body)
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.text = "Account name"
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 2),
            nameLabel.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
        ])
    }
    
    private func setupBalanceStackView() {
        contentView.addSubview(balanceStackView)
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 0
        
        NSLayoutConstraint.activate([
            balanceStackView.topAnchor.constraint(equalTo: typeLabel.topAnchor)
        ])
    }
    
    private func setupBalanceLabel() {
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceLabel.textAlignment = .right
        balanceLabel.text = "Some balance"
        balanceLabel.font = .preferredFont(forTextStyle: .body)
    }
    
    private func setupBalanceAmountLabel() {
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        balanceAmountLabel.textAlignment = .right
        balanceAmountLabel.attributedText = makeFormattedBalance(dollars: "926,466", cents: "23")
    }
    
    private func setupChevronImageView() {
        contentView.addSubview(chevronImageView)
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        chevronImageView.image = UIImage(systemName: "chevron.right")?.withTintColor(.appColor, renderingMode: .alwaysOriginal)
        NSLayoutConstraint.activate([
            chevronImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 2),
            chevronImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 2)
        ])
    }
    
    private func makeFormattedBalance(dollars: String, cents: String) -> NSMutableAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .callout),
            .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .footnote),
            .baselineOffset: 8]

        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSAttributedString(string: dollars, attributes: dollarAttributes)
        let centString = NSAttributedString(string: cents, attributes: centAttributes)
        
        rootString.append(dollarString)
        rootString.append(centString)
        
        return rootString
    }
}

extension AccountSummaryCell {
    func configure(with viewModel: ViewModel) {
        typeLabel.text = viewModel.accountType.rawValue
        nameLabel.text = viewModel.accountName
        underlineView.backgroundColor = viewModel.accountType.color
        balanceLabel.text = viewModel.accountType.balanceLabel
    }
}
