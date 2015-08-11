# DeliverHQ

Rubygem wrapper for [deliverHQ](http://www.deliverhq.com/) API.

[![Build Status](https://travis-ci.org/datacentred/deliverhq.svg)](https://travis-ci.org/datacentred/deliverhq) [![Coverage Status](https://coveralls.io/repos/datacentred/deliverhq/badge.svg?branch=master&service=github)](https://coveralls.io/github/datacentred/deliverhq?branch=master)

## Installing

```
gem install deliverhq
```

or

(in Gemfile or .gemspec)
```ruby
gem 'deliverhq'
```

then

```ruby
require 'deliverhq'
```

## Usage

### Authentication

Set your API ID and key using the two environment variables, `DELIVERHQ_ID` and `DELIVERHQ_KEY`. This can be found in the "Setup" section of your DeliverHQ account.

### Sending E-Mail

```ruby
Deliverhq::send(from: 'you@yourdomain.com', to: 'recipient@theirdomain.com', subject: 'Hello!', plain_body: 'This is a test.')
#=> #<Deliverhq::Message:0x007fc79...
```

### Domains

```ruby
# Retrieve all domains associated with your account
Deliverhq::Domain.all
#=> [#<Deliverhq::Domain:0x007fc79c1..]

# Create a new domain
domain = Deliverhq::Domain.create(name: 'test.com')
#=> #<Deliverhq::Domain:0x007fc79c134a78 @id=7970, @account_id=506, @name="test.com", @verification_token="punqv7acjm", @verified_at=nil>

# And remove it
domain.destroy
#=> true
```

### Mailboxes

```ruby
# Retrieve all mailboxes associated with your account
Deliverhq::Mailbox.all
#=> [#<Deliverhq::Mailbox:0x007fc79c2...

# Create a new mailbox
mailbox = Deliverhq::Mailbox.create(name: 'Incoming Support',
        check_spam: 0,
        destination_address: 'http://app.sirportly.com/modules/deliver2/accept',
        destination_type: 'http',
        domain_id: 6707,
        encoding:'post',
        format: 'full',
        reply_stripping: false,
        partial_address: 'support')

# And remove it
mailbox.destroy
#=> true
```

### Messages

```ruby
# Retrieve messages by page
page = 1
Deliverhq::Message.all(page)
#=> [#<Deliverhq::Message:0x007f88e29...
page = 2
Deliverhq::Message.all(page)
#=> [#<Deliverhq::Message:0x008ef62a9...
page = 999
Deliverhq::Message.all(page)
#=> []

# Show individual message
Deliverhq::Message.find(226945)
#=> #<Deliverhq::Message:0x007f88e2998a28 @id=222697445, @envelope_to ...
```

### Handling Errors

If the API reports an error, the gem will raise the message as an exception of type `Deliverhq::RequestError`. e.g.

```ruby
domain = Deliverhq::Domain.create(name: 'test.com')
#=> #<Deliverhq::Domain:0x007fc79c134a78 @id=7970, @account_id=506, @name="test.com", @verification_token="punqv7acjm", @verified_at=nil>

domain.destroy
#=> true

# Try to remove it after it's been removed
domain.destroy
#=> Deliverhq::RequestError: Server responded with 404: {"error":"Not Found"}
```

## Further Reading

You can learn more about the DeliverHQ API here: [http://deliver.apidoc.io/](http://deliver.apidoc.io/).
