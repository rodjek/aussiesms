aussiesms
=========

Send text messages with AussieSMS (http://www.aussiesms.com.au).

Setting up
----------

    require 'aussiesms'
    AussieSMS.id = "<aussiesms id>"
    AussieSMS.password = "<password>"

Sending a message
-----------------

    AussieSMS.send "Message Text", :to => "<phone number>"

The phone number should be in international format (same as your AussieSMS ID).
For example, if you wanted to send a message to 0412345678 in Australia (61),
the number would be "61412345678".

You can optionally set the sender ID of the message as well.  The sender ID 
can either be a phone number in international format or an 11 character 
alphanumeric string.

You can set the sender ID either on a per-message basis:

    AussieSMS.send "Message Text", :to => "<phone number>", :from => "<sender id>"

or you can set a default sender ID for all messages:

    AussieSMS.from = "<sender id>"

Checking your balance
---------------------

    >> AussieSMS.balance
    => 5

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

Copyright (c) 2010 rodjek. See LICENSE for details.
