module Slug
	extend ActiveSupport::Concern
	included do
		validates :slug, slug: true, uniqueness: { case_sensitive: false }
	end
end