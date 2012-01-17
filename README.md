accessor
========

The accessor gem is for giving you easy syntax sugar for getters, setters, and accessors.


usage
-----

Sure, you can use `attr_accessor`, `attr_reader`, and `attr_writer` but the `attr` gang can't do this!:

  - Chain together setters: `person.name("Kurtis").email("me+accessor@kurtisrainboltgreene.name").age(24)`
  - Define new accessors, getters, and setters on instances: `person.accessor!(:secret_token)`
  - Do both: `person.accessor(:api_token, :dashboard_token).api_token(generated_token).dashboard_token`

Here's an example:

``` ruby
require 'accessor'

class Person
  accessor :name, :email
  writer :password
  reader :encrypted_password

  def encrypt_password!
    @encrypted_password = Base64::strict_encode64(@password)
  end

end

contact = Person.new
contact.name "Kurtis Rainbolt-Greene"
contact.email "me+accessor@kurtisrainboltgreene.name"
contact.email

contact.accessor!(:age).age 24
```


installing
----------

**Requirements**

1. Ruby MRI 1.9+
2. RubyGems 1.6+

Like any other gem, all you have to do is either use:

``` bash
$ gem install accessor
```

Or add it to your `Gemfile`:

``` ruby
source :rubygems

gem "accessor", "1.1.0"
```

That's all you have to do.

**Testing**

To make sure you did everything right do the following:

``` ruby
ruby -e "p require 'accessor'"
true
```


issues & documentation
----------------------

* [Documentation](http://krainboltgreene.github.com/accessor/documentation)
* [Issues](https://github.com/krainboltgreene/accessor/issues)

We welcome any pull requests or commits that improve `accessor`.


changelog
---------

  - 1.0.2: Adding helpful README and gemspec details
  - 1.0.0: Initial release


contributing
------------

* **Fork** the repository
* **Clone the repository** locally, or **edit via Github**
* Create a **new branch** using the [Git Flow Standard](http://yakiloo.com/getting-started-git-flow/) conventions
* Commit **often** and **when important**
* **DO NOT CHANGE** ANY OF THESE (without making a new branch for *that* change):
  * `*.gemspec`
  * `Rakefile`
  * `.rvmrc`
  * `.gitignore`
  * Any part of the git history
* **Write tests** specifically for the changes you've made, if no test exist
* **Push** your feature or hotfix branch to Github.
* Make a **Pull Request**


Credits
-------

  - Myself!...So far.

License
-------

Copyright (c) 2012 Kurtis Rainbolt-Greene

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.