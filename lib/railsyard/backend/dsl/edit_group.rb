require 'blockenspiel'

module Railsyard
  module Backend
    module Dsl

      class EditGroup < Base
        def field(*args, &block)
          require 'railsyard/backend/config/edit_field'
          config.add_field Config::EditField.new(*args, &block)
        end
        def nested(*args, &block)
          require 'railsyard/backend/config/nested_edit'
          config.add_nested Config::NestedEdit.new(*args, &block)
        end
      end

    end
  end
end
