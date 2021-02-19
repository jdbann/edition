module System
  module DomIdHelper
    delegate :dom_id, to: ActionView::RecordIdentifier
  end
end
