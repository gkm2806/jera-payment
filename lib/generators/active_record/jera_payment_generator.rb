require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class JeraPaymentGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      
    end
  end
end