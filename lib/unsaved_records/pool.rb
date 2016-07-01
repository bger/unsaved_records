module UnsavedRecords
  module Pool
    extend self

    def each_unsaved(&block)
      tracked_data.select { |object| object.changed? }.each(&block)
    end

    def push(value)
      tracked_data << value
    end

    def tracked_data
      @tracked_data ||= []
    end

    def clear
      @tracked_data = []
    end
  end
end
