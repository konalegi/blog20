class ValidationService
  include ActiveModel
  def self.create
    asf_form = {}
    Dir[Rails.root.join("app/types/*.rb")].each do |file|
      require file
      class_name = File.basename(file, ".rb").classify.to_sym
      asf_form[class_name] = {}
      class_object = Kernel.const_get(class_name)
      class_object.attribute_set.each { |attribute| asf_form[class_name][attribute.name] ={validations: {} } }
      class_object.validators.each do |validator|
        if validator.class == Validations::FormatValidator
          insert_format_validator validator, asf_form[class_name]
        else
          insert_validation validator, asf_form[class_name]
        end
      end
    end
    asf_form
  end

  def self.insert_format_validator(validator, fields)
    validator.attributes.each do |attribute|
      validator_name = validator.class.to_s.demodulize.underscore.to_sym
      fields[attribute][:validations][validator_name] = {  value: validator.options[:with].inspect.gsub('/',''),
                                                           message_t: I18n.t(validator.options[:message]) }
    end
  end

  def self.insert_validation(validator, fields)
    validator.attributes.each do |attribute|
      validator_name = validator.class.to_s.demodulize.underscore.to_sym
      fields[attribute][:validations][validator_name] = {}

      if validator.options.empty?
        fields[attribute][:validations][validator_name][:value] = true
      else
        fields[attribute][:validations][validator_name][:value] = validator.options
        if validator.options[:message].present?
          fields[attribute][:validations][validator_name][:message_t] = I18n.t validator.options[:message]
        end
      end

    end
  end


end