//
//  MainTabBarController.swift
//  FavoriteItemsApp
//
//  Created by Инара Алмагамбетова on 14.11.2024.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        // Создаем контроллеры для табов
        let moviesVC = MoviesTableViewController()
        let booksVC = BooksTableViewController()
        let musicVC = MusicTableViewController()
        
        // Устанавливаем названия и иконки для табов
        moviesVC.tabBarItem = UITabBarItem(title: "Фильмы", image: UIImage(systemName: "film"), tag: 0)
        booksVC.tabBarItem = UITabBarItem(title: "Книги", image: UIImage(systemName: "book"), tag: 1)
        musicVC.tabBarItem = UITabBarItem(title: "Музыка", image: UIImage(systemName: "music.note"), tag: 2)
        
        // Вкладываем каждый контроллер в NavigationController
        let moviesNav = UINavigationController(rootViewController: moviesVC)
        let booksNav = UINavigationController(rootViewController: booksVC)
        let musicNav = UINavigationController(rootViewController: musicVC)
        
        // Добавляем навигационные контроллеры в Tab Bar
        viewControllers = [moviesNav, booksNav, musicNav]
    }
}
