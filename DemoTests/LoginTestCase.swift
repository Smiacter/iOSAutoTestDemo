//
//  LoginTestCase.swift
//  DemoTests
//
//  Created by Smiacter on 2017/12/5.
//  Copyright © 2017年 Jinyi. All rights reserved.
//
//  KIF使用

import UIKit
import XCTest
import KIF

/// KIF时OC写的，Swift无法直接使用其关键方法tester、system(通过宏定义)，参照GitHub README，通过extension实现
extension XCTestCase {
    
    func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }
    
    func system(file : String = #file, _ line : Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}

class LoginTestCase: KIFTestCase {
    /// 所有测试进行前调用，可以做一些必要或者共有的初始化操作
    override func beforeAll() {

    }

    /// 测试点击登陆后进入其他View
    func test00Login() {
        let nameTextField = tester().waitForView(withAccessibilityLabel: "UserName") as! UITextField
        let pwdTextField = tester().waitForView(withAccessibilityLabel: "Password") as! UITextField
        tester().enterText("User", intoViewWithAccessibilityLabel: "UserName")
        tester().enterText("123456", intoViewWithAccessibilityLabel: "Password")
        // 点击
        tester().tapView(withAccessibilityLabel: "login")
        XCTAssertTrue(!nameTextField.text!.isEmpty, "User name can't be nil")
        XCTAssertTrue(!pwdTextField.text!.isEmpty, "Password can't be nil")

        // 等待某个View出现，也可以通过该函数得到该View的实例
        tester().waitForView(withAccessibilityLabel: "Scene1")
    }

    /// 测试切换不同的View
    func test01TabButtons() {
        tester().tapView(withAccessibilityLabel: "Tab2")
        tester().waitForView(withAccessibilityLabel: "Scene2")

        tester().tapView(withAccessibilityLabel: "Tab3")
        tester().waitForView(withAccessibilityLabel: "Scene3")
    }

    /// 测试输入
    func test02Input() {
        tester().tapView(withAccessibilityLabel: "Tab1")
        tester().waitForView(withAccessibilityLabel: "InputTextField")
        // 输入文字
        tester().enterText("Hello KIF", intoViewWithAccessibilityLabel: "InputTextField")

        // TODO: 如何确定键盘弹出的done按钮的accessibilityLabel？
        tester().tapView(withAccessibilityLabel: "Scene1View")

        // 得到View实例
        let textfield = tester().waitForView(withAccessibilityLabel: "InputTextField") as! UITextField
        // 判断是否相等
        XCTAssertEqual(textfield.text, "Hello KIF")

        // 清除当前文字重新输入新的
        tester().clearText(fromAndThenEnterText: "Test Geometry", intoViewWithAccessibilityLabel: "InputTextField")
        tester().tapView(withAccessibilityLabel: "Scene1View")
    }

    /// 有的时候无法确定accessibilityLabel或者是自定义的空间没有accessibilityLabel，可以使用Geometry计算位置进行
    func test03Geometry() {
        tester().wait(forTimeInterval: 2)

        let stepper = tester().waitForView(withAccessibilityLabel: "stepper") as! UIStepper
        let stepCenter = stepper.window?.convert(stepper.center, from: stepper.superview)
        // 算出-和+的位置
        var minusButton = stepCenter
        minusButton?.x -= stepper.frame.width / 4
        var plusButton = stepCenter
        plusButton?.x += stepper.frame.width / 4

        for _ in 0 ..< 10 {
            tester().wait(forTimeInterval: 1)
            tester().tapScreen(at: minusButton!)
        }

        // 延时1秒
        tester().wait(forTimeInterval: 1)
        tester().tapScreen(at: plusButton!)
        tester().wait(forTimeInterval: 1)
        tester().tapScreen(at: plusButton!)
        tester().wait(forTimeInterval: 1)

        // 设置超时时间（默认为10秒）
        KIFUITestActor.setDefaultTimeout(60)

        tester().tapView(withAccessibilityLabel: "Tab2")

        KIFUITestActor.setDefaultTimeout(10)
    }
//
//    /// 左滑删除Cell
////    func test04Swipe() {
////        // 左滑删除Cell
////        tester().swipeView(withAccessibilityLabel: "secton 0 row 0", in: .left)
////        // TODO: 如何确定左滑Cell后的delete accessibilityLabel
////        tester().tapView(withAccessibilityLabel: "delete")
////    }
//
//    /// 测试点击TableView row
////    func test05TableView() {
////        // 点击tableView的指定行
////        tester().tapRow(at: IndexPath, inTableViewWithAccessibilityIdentifier: "AccessibilityIdentifier")
////
////        // 如果上面点击tableView的某行，tableView所在的VC会消息，则需要调用waitForAbsenceOfView，保证当前VC消失了再坐其他操作
////        tester().waitForAbsenceOfView(withAccessibilityLabel: "AccessibilityLabel")
////    }
}

