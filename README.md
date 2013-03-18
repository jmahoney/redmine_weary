#redmine_weary - a ruby client for the Redmine REST API

This is a fairly simple wrapper for the [Redmine REST API][redmine]. 
My main reasons for developing it were to create a [fancy dashboard][dashing] 
for my [employer's][3months] internal bug tracker and to have a play with 
[weary][Weary], a nifty framework/DSL for working with RESTful APIs. Yes,
I know I could have used ActiveResource, but where's the fun in that?

**Current status:** the bug dashboard works and I probably won't update this unless I need to add 
more functionality to the dashboard. Weary is a great little DSL, though.

##How to use

You probably shouldn't. This gem doesn't support much of the Redmine API. lUse ActiveResource instead. 
But if you must, the following code sets up the gem:

```
require 'redmine_weary'
RedmineWeary.configure do |config|
  config.endpoint = 'http://example.com'
  config.api_key = 'MYAPIKEY'
end
require 'redmine_weary/client'
```

After that you can do stuff with issues. e.g. get a count of all the issues

```
RedmineWeary::Issue.count
```

##Thanks

Many thanks to the developers of Redmine and to [Mark Wunsch][mwunsch] for developing Weary 
and providing solid code from which I could blatantly steal.

[redmine]:http://www.redmine.org/projects/redmine/wiki/Rest_api
[dashing]:http://shopify.github.com/dashing/
[3months]:http://www.3months.com
[weary]:https://github.com/mwunsch/weary
[mwunsch]:https://github.com/mwunsch

[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/jmahoney/redmine_weary)
