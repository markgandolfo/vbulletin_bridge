# Vbulletin Bridge

Simple model based bridge to access the database of a vbulletin install
It comes with basic "auth" algorithm to handle username/password authentication. 

## Installation

Add this line to your application's Gemfile:

    gem 'vbulletin_bridge'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vbulletin_bridge

## Usage

The Vbulletin namespace contains ActiveRecord models corresponding to Vbulletin database tables.

So far these include:

  Vbulletin::Avatar
  Vbulletin::ImageCategory  
  Vbulletin::InfractionGroup
  Vbulletin::Pm
  Vbulletin::PmText
  Vbulletin::Post
  Vbulletin::Session
  Vbulletin::Setting
  Vbulletin::Style
  Vbulletin::SubscribeThread
  Vbulletin::Thread
  Vbulletin::User
  Vbulletin::UserGroup

More models will follow as development progresses.

Vbulletin models inherit from ActiveRecord::Base so all the standard methods are available:

  Vbulletin::User.all
  Vbulletin::User.count
  Vbulletin::User.find_by_email('joe@example.com')

A number of Vbulletin database associations have been mapped, with more to follow:
  
  user = Vbulletin::User.first
  user.primary_user_group # returns Vbulletin::UserGroup instance
  user.last_post # returns Vbulletin::Post instance
  
User authentication:

  User.authenticate('MyUsername', 'MyPassword')

(Note: Vbulletin uses javascript to send password as MD5 hash when logging in, User#authenticate currently does not support this and expects plain text passwords)

## To-do

 * Continue mapping Vbulletin tables and associations to ActiveRecord.
 * Add further convenience methods to allow easy cross-over between Rails and Vbulletin.

## Credits:

Ported from Niall Mullally's vbulletin bridge


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
