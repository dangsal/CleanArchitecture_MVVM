//
//  NewsView.swift
//  CleanArchitecture_MVVM
//
//  Created by 이성호 on 2023/09/24.
//

import UIKit

final class NewsView: UIView, BaseViewType {
    
    // MARK: - ui component
    
    // MARK: - property
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.baseInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
}

extension NewsView {
    func setupLayout() {
        
    }
    
    func configureUI() {
        
    }
}
