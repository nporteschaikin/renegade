module Items
	module Relationship
		extend ActiveSupport::Concern
		included do; has_one :item, as: :object; end
	end
end