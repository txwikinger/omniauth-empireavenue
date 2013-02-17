# OmniAuth EmpireAvenue
[![Build Status](https://travis-ci.org/txwikinger/omniauth-empireavenue.png?branch=master)](https://travis-ci.org/txwikinger/omniauth-empireavenue)

`OmniAuth::Strategies::EmpireAvenue` is an OmniAuth strategy for authenticating to
empireavenue.com with OAuth2. Read detailed information about the empireavenue.com
implementation of OAuth2
[here](https://apidocs.empireavenue.com/v1/oauth2)

## Installing

Add to your `Gemfile`:

```ruby
    gem 'omniauth-empireavenue'
```

Then `bundle install`.

## Usage

To get started you will need to register an OAuth Consumer in your
empireavenue.com account
[here](http://www.empireavenue.com/profile/developer)

Here's a quick example, adding the middleware to a Rails app in
`config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :empireavenue, ENV['CLIENT_KEY'], ENV['CLIENT_SECRET']
end
```
You can then implement your authentication as usual with OmniAuth as
shown in the excellent [Railscast
241](http://railscasts.com/episodes/241-simple-omniauth)

Do to cross domain issues the authentication hash is not constructed in this
version. 

##Authentication Hash

Here's an example *Authentication Hash* available in
`request.env['omniauth.auth']`:

```ruby
```

## License

Copyright (c) 2013 by Ralph Janke         

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
