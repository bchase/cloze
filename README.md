# Cloze

A Ruby cloze deletion module

GitHub: [bchase/cloze](https://github.com/bchase/cloze)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cloze', :git => 'git://github.com/bchase/cloze.git'
```

And then execute:

```ruby
$ bundle
```

## Usage

Simply include `Cloze::Deletion` in `String` or a `String` subclass

```ruby
class String
  include Cloze::Deletion
end
```

and then use the `.cloze_delete` instance method to perform cloze deletions

```ruby
"foo".cloze_delete(:each) 
# => ['#oo','f#o','fo#']

"foo".cloze_delete(:each, :all) 
# => ['#oo','f#o','fo#','###']

"巻き込む".cloze_delete(:kanji) 
# => ['#き込む','巻き#む']


# using a different cloze deletion character...

"foo".cloze_delete(:each, with: '?')
# => ['?oo','f?o','fo?']
```

It's also possible to permanently change the cloze deletion character:

```ruby
Cloze::Deletion.default_deletion_character = '?'

"foo".cloze_delete(:each)
# => ['?oo','f?o','fo?']
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write specs
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
