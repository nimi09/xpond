# == Schema Information
#
# Table name: ndbs
#
#  id         :integer          not null, primary key
#  lat        :float
#  lon        :float
#  elevation  :integer
#  frq        :integer
#  range      :integer
#  identifier :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'spec_helper'

describe Ndb do
  pending "add some examples to (or delete) #{__FILE__}"
end
