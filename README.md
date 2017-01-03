# QuickForms
![CocoaPods](https://img.shields.io/badge/platform-ios-lightgray.svg)
[![CocoaPods](https://img.shields.io/badge/pod-0.1.4-blue.svg)](https://github.com/Khmelevsky/QuickForms)
![CocoaPods](https://img.shields.io/badge/status-alpha-orange.svg)
[![CocoaPods](https://img.shields.io/badge/license-MIT-lightgray.svg)](https://github.com/Khmelevsky/QuickForms/blob/master/LICENSE)

# The Basics
Create form model
```swift
class AuthForm: ConfiguratorModel {
    
    var email = Variable<String>()
        .add(filter: Filters.Trim())
        .add(validator: Validators.Required())
        .add(validator: Validators.Email())
    
    var password = Variable<String>()
        .add(filter: Filters.Trim())
        .add(validator: Validators.Required())
    
    var code = Variable<Int>()
        .add(filter: Filters.Trim())
    
    override func variables() -> [VariableElement] {
        return [email, password, code]
    }
    
}
```

bind form value to UI element
```swift
let form = Configurator<AuthForm>().configure { myForm in
    myForm.email.bindTo(element: emailTextField.toElement())
    myForm.password.bindTo(element: passwordTextField.toElement())
    myForm.code.bindTo(element: codeTextField.toElement())
}
```

validation form and getting result
```swift
if form.isValid() {
    form.email.result() // return value
    form.password.result() // return value
    form.code.result(default: 3483) // return value or default if value == nil
} else {
    // get form errors
    form.errors
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
