class CabalMember < ActiveRecord::Base
  default_scope order('position ASC')
end
