module UnsavedRecords
  module Support
    module ActiveRecord
      def initialize(*)
        object = super
        # UnsavedRecords::Pool.push(object)
      end

      module ClassMethods
        def allocate(*)
          object = super
          UnsavedRecords::Pool.push(object)
          object
        end

        def new(*args)
          # binding.pry
          super
        end
      end

      def self.prepended(klass)
        klass.singleton_class.prepend(ClassMethods)
      end
    end
  end
end
