module CodebreakerAp
  class BaseEntity
    include Validation

    attr_reader :errors, :validated

    def initialize
      @validated = false
      @errors = []
    end

    def valid?
      @errors.clear
      validate
      @errors.compact!
      @validated = true if @errors.empty?
    end

    private

    def validate; end
  end
end
