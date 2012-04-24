require 'blockenspiel'
require 'railsyard/backend/dsl/edit'
require 'railsyard/backend/config/base'
require 'railsyard/backend/config/edit_group'

module Railsyard
  module Backend
    module Config

      class Edit < Base

        puts "CIAO"

        def initialize(&block)
          @groups = {}
          Blockenspiel.invoke(block, Dsl::Edit.new(self)) if block_given?
        end

        def add_field_to_default_group(field_config)
          @groups[:main] ||= EditGroup.new(:main)
          @groups[:main].add_field(field_config)
        end

        def add_nested_to_default_group(field_config)
          @groups[:main] ||= EditGroup.new(:main)
          @groups[:main].add_nested(field_config)
        end

        def add_group(group_config)
          @groups[group_config.name] = group_config
        end

        def group(name)
          @groups[name.to_sym]
        end

        def groups
          @groups.values
        end

      end

    end
  end
end
