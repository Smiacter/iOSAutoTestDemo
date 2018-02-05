import Quick
import Nimble
import KIF
@testable import Demo

/// Quick使用

class DemoSpec: QuickSpec {
    override func spec() {
//        var loginVC: ViewController!
//
//        beforeEach {
//            let story = UIStoryboard(name: "Main", bundle: nil)
//            loginVC = story.instantiateViewController(withIdentifier: "LoginControllerID") as! ViewController
//            print(loginVC.description)
//        }
//
//        describe("Test Login") {
//            beforeEach {
//                // 保证VC加载
//                let _ = loginVC.view
//            }
//
//            it("login params valide", closure: {
//                let nameTextField = self.tester().waitForView(withAccessibilityLabel: "UserName") as! UITextField
//                let pwdTextField = self.tester().waitForView(withAccessibilityLabel: "Password") as! UITextField
//                self.tester().enterText("User", intoViewWithAccessibilityLabel: "UserName")
//                self.tester().enterText("123456", intoViewWithAccessibilityLabel: "Password")
//                let isValide = loginVC.isValideLogin(name: nameTextField.text!, password: pwdTextField.text!)
//                expect(isValide).to(beTrue())
//
//                self.tester().tapView(withAccessibilityLabel: "login")
//            })
//        }
//
//        describe("Tab1 Scene1") {
//
//            beforeEach {
//                // 等待某个View出现，也可以通过该函数得到该View的实例
//                self.tester().waitForView(withAccessibilityLabel: "Scene1")
//            }
//
//            it("Input something[UI]", closure: {
//                self.tester().waitForView(withAccessibilityLabel: "InputTextField")
//                // 输入文字
//                self.tester().enterText("Hello KIF", intoViewWithAccessibilityLabel: "InputTextField")
//                // TODO: 如何确定键盘弹出的done按钮的accessibilityLabel？
//                self.tester().tapView(withAccessibilityLabel: "Scene1View")
//                // 得到View实例
//                let textfield = self.tester().waitForView(withAccessibilityLabel: "InputTextField") as! UITextField
//
//                expect(textfield.text?.isEmpty).to(beFalse())
//            })
//        }
    }
}
