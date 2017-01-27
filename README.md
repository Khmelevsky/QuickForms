# QuickForms
![CocoaPods](https://img.shields.io/badge/platform-ios-lightgray.svg)
[![CocoaPods](https://img.shields.io/badge/pod-0.1.4-blue.svg)](https://github.com/Khmelevsky/QuickForms)
![CocoaPods](https://img.shields.io/badge/status-alpha-orange.svg)
[![CocoaPods](https://img.shields.io/badge/swift-3.0-brightgreen.svg)](https://swift.org)
[![CocoaPods](https://img.shields.io/badge/license-MIT-lightgray.svg)](https://github.com/Khmelevsky/QuickForms/blob/master/LICENSE)

# The Basics
Create form model
```swift
class Authorization: Form {
    
    let email = Field<String>()
        .add(filter: Filters.Trim())
        .add(validator: Validators.Required())
        .add(validator: Validators.Email())
    
    let password = Field<String>()
        .add(filter: Filters.Trim())
        .add(validator: Validators.Required())
    
    let code = Field<Int>()
    
    override func elements() -> [Element] {
        return super.elements() + [email, password, code]
    }
    
}
```
bind form value to UI element
```swift
class SettingsViewController: UIViewController {

    let form = Authorization()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // bind variables
        form.email.bind(to: emailTextField)
        form.password.bind(to: passwordTextField)
        form.code.bind(to: codeTextField)
    }
    
}
```

validation form and getting result
```swift
if form.isValid() {
    form.email.value()
    form.password.value()
    form.code.value(default: 3483)
} else {
    //form.errors
}
```

# Custom Filter
to do

# Custom Validator
to do

# Custom Element
to do

# Installation
### Cocoapods
QuickForms can be added to your project using [CocoaPods 0.36 or later](http://blog.cocoapods.org/Pod-Authors-Guide-to-CocoaPods-Frameworks/) by adding the following line to your `Podfile`:

```ruby
pod 'QuickForms', git: 'https://github.com/Khmelevsky/QuickForms.git'
```

## License

QuickForms is released under the MIT license. See LICENSE for details.
