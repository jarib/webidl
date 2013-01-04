webidl
======

This gem provides a pure-ruby parser and code generator for Web IDL, an interface description language for interfaces intended to be implemented in web browsers.

[![Build Status](https://secure.travis-ci.org/jarib/webidl.png)](http://travis-ci.org/jarib/webidl)

Problems
--------

The code generation could be improved a lot - a lot of the data in the IDL is just ignored. I don't need anything more at the moment, but it should be easy to complete it if anyone needs to.

The parser rules for ExtendedAttribute are not exactly like the grammar from the Web IDL spec, since I ran into infinite recursion issues and don't have the Treetop-fu to figure them out.
So far this hasn't led to any problems; the parser does parse the IDLs parts of the current HTML5 spec just fine.

Development tips
----------------

While working on the grammar, delete the compiled parser (lib/webidl/parser/idl.rb) and make sure you do not have the webidl gem installed. When finished, compile the parser with `rake parser:compile`.

See also
--------

* http://dev.w3.org/2006/webapi/WebIDL/
* http://dev.w3.org/2006/webapi/WebIDL/#idl-grammar
* http://dev.w3.org/html5/spec/Overview.html

Note on Patches/Pull Requests
-----------------------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

Copyright
---------

Copyright (c) 2009-2013 Jari Bakken. See LICENSE for details.
