require "test_helper"
require "test_helpers/system/authentication_helper"
require "test_helpers/system/dom_id_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]

  include System::AuthenticationHelper
  include System::DomIdHelper
end
