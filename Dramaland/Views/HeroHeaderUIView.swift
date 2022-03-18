

import UIKit

class HeroHeaderUIView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(with model: TitleViewModel) {
           guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
               return
           }
            
           heroImageView.sd_setImage(with: url, completed: nil)
       }
    
   
    // buttons -----------------------------------
    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderColor = UIColor.systemPink.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 4
        button.titleLabel?.minimumScaleFactor = 0.5
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderColor = UIColor.systemPink.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 4
        button.titleLabel?.minimumScaleFactor = 0.02
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    // background -----------------------------------
    private lazy var heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "heroImage")
        return imageView
    }()
    
    private func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }

    
    // setup -----------------------------------
    
    func setupViews(){
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
//        addSubview(buttonsStackView)

    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([

            self.playButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            self.playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            self.playButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3 - 10),
            
            
            self.downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            self.downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            self.downloadButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3 - 10),


        ])

    }

    
    
}
