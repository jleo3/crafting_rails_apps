module MailForm
  class Base
    include ActiveModel::AttributeMethods
    include ActiveModel::Conversion
    extend ActiveModel::Naming
    extend ActiveModel::Translation
    include ActiveModel::Validations
    include MailForm::Validators
    extend ActiveModel::Callbacks

    define_model_callbacks :deliver

    class_attribute :_attributes
    self._attributes = []

    attribute_method_prefix 'clear_'
    attribute_method_suffix '?'

    def initialize(attributes = {})
      attributes.each do |attr, value|
        self.send("#{attr}=", value)
      end unless attributes.blank?
    end

    def self.attributes(*names)
      attr_accessor *names
      define_attribute_methods names

      self._attributes += names
    end

    def deliver
      if valid?
        _run_deliver_callbacks do
          MailForm::Notifier.contact(self).deliver
        end
      else
        false
      end
    end

    def attributes
      self._attributes.inject({}) do |hash, attr|
        hash[attr.to_s] = send(attr)
        hash
      end
    end
    
    def persisted?
      false
    end

    protected
    def clear_attribute(attribute)
      send("#{attribute}=", nil)
    end

    def attribute?(attribute)
      send(attribute).present?
    end
  end
end
