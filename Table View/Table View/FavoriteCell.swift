import UIKit

class FavoriteCell: UITableViewCell {
    
    static let identifier = "FavoriteCell"
    
    
    
    // MARK: - UI Elements
    let coverImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let reviewLabel = UILabel()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
      
        selectionStyle = .none
        backgroundColor = .black
        
      
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.clipsToBounds = true
        coverImageView.layer.cornerRadius = 8
        coverImageView.backgroundColor = .lightGray
        contentView.addSubview(coverImageView)
        
 
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 1
        titleLabel.lineBreakMode = .byTruncatingTail
        contentView.addSubview(titleLabel)
        
        subtitleLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        subtitleLabel.textColor = .gray
        subtitleLabel.numberOfLines = 1
        subtitleLabel.lineBreakMode = .byTruncatingTail
        contentView.addSubview(subtitleLabel)
        
        reviewLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        reviewLabel.textColor = .darkGray
        reviewLabel.numberOfLines = 0
        reviewLabel.lineBreakMode = .byWordWrapping
        contentView.addSubview(reviewLabel)
    }
    
    // MARK: - Setup Constraints (Auto Layout)
    private func setupConstraints() {
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Image View constraints
        NSLayoutConstraint.activate([
            coverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            coverImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            coverImageView.widthAnchor.constraint(equalToConstant: 70),
            coverImageView.heightAnchor.constraint(equalToConstant: 100),
            coverImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -12)
        ])
        
        // Title Label constraints
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12)
        ])
        
        // Subtitle Label constraints
        NSLayoutConstraint.activate([
            subtitleLabel.leadingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: 12),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4)
        ])
        
        // Review Label constraints
        NSLayoutConstraint.activate([
            reviewLabel.leadingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: 12),
            reviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            reviewLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 6),
            reviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
        
        // чтобы текст не обрезался
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        subtitleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        reviewLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    // MARK: - Configure Cell
    func configure(with item: FavoriteItem) {
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        reviewLabel.text = item.review
        
        if let image = UIImage(named: item.imageName) {
            coverImageView.image = image
        } else {
            coverImageView.image = UIImage(systemName: "photo.fill")
            coverImageView.tintColor = .lightGray
        }
    }
}

