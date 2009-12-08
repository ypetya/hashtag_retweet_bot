# client.rb contains the classes, methods and extends <tt>Twitter4R</tt> 
# features to define client calls to the Twitter REST API.
# 
# See:
# * <tt>Twitter::Client</tt>

# Used to query or post to the Twitter REST API to simplify code.
class Twitter::Client
  include Twitter::ClassUtilMixin
end

require('lib/twitter/client/base')
require('lib/twitter/client/timeline')
require('lib/twitter/client/status')
require('lib/twitter/client/friendship')
require('lib/twitter/client/messaging')
require('lib/twitter/client/user')
require('lib/twitter/client/auth')
require('lib/twitter/client/favorites')
require('lib/twitter/client/blocks')
require('lib/twitter/client/account')
require('lib/twitter/client/graph')
require('lib/twitter/client/profile')
require('lib/twitter/client/search')
