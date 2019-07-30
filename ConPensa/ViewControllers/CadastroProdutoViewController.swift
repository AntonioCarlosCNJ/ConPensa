//
//  CadastroProdutoViewController.swift
//  ConPensa
//
//  Created by Antonio Carlos on 08/07/19.
//  Copyright © 2019 Filipe Lopes. All rights reserved.
//

import UIKit

class CadastroProdutoViewController: UIPageViewController{
    
    @IBOutlet weak var productNameTextField: UITextField!
    
    @IBOutlet weak var productDescriptionTextView: UITextView!
    
    var cadastro: Cadastro?
    
    lazy var orderedViewController: [UIViewController] = {
        return [self.newViewController(viewController: "cadastroImagem"),
                self.newViewController(viewController: "cadastroNome"),
                self.newViewController(viewController: "cadastroDescricao"),
                self.newViewController(viewController: "cadastroQuantidade"),
                self.newViewController(viewController: "cadastroCategoria")]
    }()
    
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        if let firstViewController = orderedViewController.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        self.delegate = self
        configurePageControl()
        configureNavBar()
//        productDescriptionTextView.delegate = self
    }

    @IBAction func buttonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func desingTextView(){
        productDescriptionTextView.text = "Descrição do produto..."
        productDescriptionTextView.textColor = .lightGray
        productDescriptionTextView.font = UIFont(name: "SF Text Pro", size: 13.0)
        productDescriptionTextView.returnKeyType = .done
        
        productDescriptionTextView.layer.borderColor = UIColor.gray.cgColor
        productDescriptionTextView.layer.borderWidth = 2.3
        productDescriptionTextView.layer.cornerRadius = 5
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 150, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = orderedViewController.count
        pageControl.currentPage = 0
        pageControl.tintColor = .black
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPageIndicatorTintColor = .lightGray
        self.view.addSubview(pageControl)
    }
    
    func configureNavBar(){
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 30, width: self.view.frame.width, height: 50.0))
        self.view.addSubview(navBar)
        
        navBar.setItems([UINavigationItem(title: "Teste")], animated: true)
    }
    
    func newViewController(viewController: String) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
}

extension CadastroProdutoViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Descrição do produto..." {
            textView.text = ""
            textView.textColor = .black
            textView.font = UIFont(name: "SF Text Pro", size: 18.0)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Descrição do produto..."
            textView.textColor = .lightGray
            textView.font = UIFont(name: "verdana", size: 13.0)
        }
    }
}

extension CadastroProdutoViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewController.count > previousIndex else {
            return nil
        }
        
        return orderedViewController[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard orderedViewController.count != nextIndex else {
            return nil
        }
        
        guard orderedViewController.count > nextIndex else {
            return nil
        }
        
        return orderedViewController[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewController.firstIndex(of: pageContentViewController)!
    }
}
