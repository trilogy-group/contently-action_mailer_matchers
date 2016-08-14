# ActionMailerMatchers

ActionMailerMatchers provides RSpec matchers to test common ActionMailer functionality.


## Installation

Add this line to your application's Gemfile:

```ruby
group :test do
  gem 'action_mailer_matchers', '~> 1.0'
end
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install action_mailer_matchers

Include ActionMailerMatchers in your RSpec config

```ruby
RSpec.configure do |config|
  config.include ActionMailerMatchers
end
```

## Usage

ActionMailer allows you to send emails in your Rails application, ActionMailerMatchers provides you with RSpec one-liners that help you to test this functionality. 

It is typical to test that an email has been delivered by doing the following: 

```ruby
expect { some_action.execute }
 .to change { ActionMailer::Base.deliveries.count }.by(1)
```

However, this does not specify what email was sent and to where. ActionMailerMatchers solves this problem by providing the `have_received_email` matcher, which ensures that the passed email address or user (which must respond `.email`) was the email's "to" address. You may also use the optional subject and body arguments to check that content matches the email you were expecting to send.

```ruby
expect(some_user).to have_received_email(subject: "My great subject")
expect("address@email.com").to have_received_email(body: "Wonderful email body")
```

You can also test that someone has not received an email.

```ruby
expect(some_user).not_to have_received_email
```

## Contributing

1. Fork it ( https://github.com/contently/action_mailer_matchers/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
