

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
    
   
    // buttons -----------------------------------
    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderColor = UIColor.systemPink.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 4
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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
//
//    private lazy var buttonsStackView: UIStackView = {
//        let stackview = UIStackView(arrangedSubviews: [playButton, downloadButton])
//        stackview.axis = .horizontal
//        stackview.alignment = .fill
//        stackview.distribution = .fill
//        stackview.contentMode = .scaleAspectFill
//        stackview.spacing = 32
//        stackview.alignment = .center
//        stackview.backgroundColor = .green
//
//        return stackview
//    }()
    
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

            self.playButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 70),
                        self.playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
                        self.playButton.widthAnchor.constraint(equalToConstant: 120),
                        
                        self.downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
                        self.downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
                        self.downloadButton.widthAnchor.constraint(equalToConstant: 120),

        ])

    }

    
    
}
