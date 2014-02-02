# rus_bank

[![Gem Version](https://badge.fury.io/rb/rus_bank.png)](http://badge.fury.io/rb/rus_bank)

Руби-интерфейс к API Банка России.

Установка:

    $ gem install rus_bank

Либо добавить в gemfile:

    gem 'rus_bank'

Пример использования:

    require 'rus_bank'
    bank = RusBank.new
    bank.BicToIntCode(:your_bic)

Описание доступных методов тут - http://rubydoc.info/gems/rus_bank/RusBank

Можно вызывать не реализованные в геме методы, например, в случае добавления нового на cbr.ru:

    require 'rus_bank'
    bank = RusBank.new
    bank.operations             # Список доступных для вызова методов.
    bank.call(:method, :params) # где :method - нужный метод, :params - хеш передаваемых методу параметров.

Надо сказать, что при каждом вызове метода гема 'дергается' внешний сервис. Это не лучший подход с точки зрения производительности,
траффика и вообще ЦБ просит так не поступать. Было бы логичным иметь локальную базу для кеширования получаемой информации и
обращаться к внешнему сервису только по мере необходимости.

Гем, реализующий данную функцию для Rails - https://github.com/wildDAlex/rus_bank_rails


## Copyright

Copyright (c) 2013 Denis Aleksandrov. See LICENSE.txt for
further details.

