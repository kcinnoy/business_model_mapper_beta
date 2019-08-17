module FormValidations
    extend ActiveSupport::Concern
  
    class_methods do
      def nested_present(model, attribute)
        errors.add(model, " #{attribute} not present") unless model.(attribute).present?
      end
    end
  end