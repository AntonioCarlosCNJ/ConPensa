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
    
    var currentIndex: Int = 0
    
    var pageControl = UIPageControl()
    
    var navBar = UINavigationBar()
    
    var nextButton: UIButton?
    var backButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        dataSource = self
        if let firstViewController = orderedViewController.first{
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        delegate = self
        configurePageControl()
        configureNavBar()
        configureNextButton()
        configureBackButton()
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
        pageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: 50.0, height: 44.0))
        pageControl.numberOfPages = orderedViewController.count
        pageControl.currentPage = 0
        pageControl.tintColor = .black
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPageIndicatorTintColor = .black
    }
    
    func configureNavBar(){
        navBar = UINavigationBar(frame: CGRect(x: 0, y: 32.0, width: view.frame.width, height: 44.0))
        self.view.addSubview(navBar)
        
        navBar.backgroundColor = .red
        
        
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(self.cancelButtonPressed))
        let item = UINavigationItem(title: "Cadastro de Produto")
        
        item.titleView = pageControl
        
        item.leftBarButtonItem = cancelButton
        
        navBar.setItems([item], animated: true)
    }
    
    func configureNextButton(){
        nextButton = UIButton(frame: CGRect(x: self.view.frame.width/2, y: self.view.frame.height/2, width: 100.0, height: 30.0))
        
        nextButton?.setTitle("Próximo", for: .normal)
        nextButton?.backgroundColor = .white
        nextButton?.setTitleColor(.black, for: .normal)
        nextButton?.addTarget(self, action: #selector(self.goToNextPage), for: .touchUpInside)
        
        self.view.addSubview(nextButton!)
    }
    
    func configureBackButton(){
        backButton = UIButton(frame: CGRect(x: self.view.frame.width/2 - 150.0, y: self.view.frame.height/2, width: 100.0, height: 30.0))
        
        backButton?.setTitle("Anterior", for: .normal)
        backButton?.backgroundColor = .white
        backButton?.setTitleColor(.black, for: .normal)
        backButton?.addTarget(self, action: #selector(self.goToBackPage), for: .touchUpInside)
        
        self.view.addSubview(backButton!)
    }
    
    @objc func goToNextPage(){
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex){
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: {completed in self.delegate?.pageViewController?(self, didFinishAnimating: true, previousViewControllers: [], transitionCompleted: true)})
        }
        if currentIndex > 4{
            currentIndex = 4
        }
    }
    
    @objc func goToBackPage(){
        currentIndex -= 1
        if let backViewController = contentViewController(at: currentIndex){
            setViewControllers([backViewController], direction: .reverse, animated: true, completion: {completed in self.delegate?.pageViewController?(self, didFinishAnimating: true, previousViewControllers: [], transitionCompleted: true)})
        }
        if currentIndex < 0{
            currentIndex = 0
        }
    }
    
    func contentViewController(at index: Int) -> UIViewController?{
        if index < 0 || index >= orderedViewController.count{
            return nil
        }
        
        switch index {
        case 0:
            return orderedViewController[index] as? FirstViewController
        case 1:
            return orderedViewController[index] as? SecondViewController
        case 2:
            return orderedViewController[index]
        case 3:
            return orderedViewController[index]
        case 4:
            return orderedViewController[index]
        default:
            return nil
        }
    }
    
    @objc func cancelButtonPressed(){
        dismiss(animated: true, completion: nil)
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
        
        let previousIndex = currentIndex - 1
        
        return contentViewController(at: previousIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let nextIndex = currentIndex + 1
        
        return contentViewController(at: nextIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllerIndex = orderedViewController.firstIndex(of: pageViewController.viewControllers![0]) else {
            return
        }
        
        currentIndex = viewControllerIndex
        self.pageControl.currentPage = currentIndex
    }
}
