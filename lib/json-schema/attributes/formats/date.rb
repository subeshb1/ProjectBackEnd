require 'json-schema/attribute'

module JSON
  class Schema
    class DateFormat < FormatAttribute
      REGEXP = /\A\d{4}-\d{2}-\d{2}\z/

      def self.validate(current_schema, data, fragments, processor, validator, options = {})
        if data.is_a?(String)
          schema = current_schema.schema
          error_message = if schema['invalidMessage'].present?
            schema['invalidMessage']
          else
            "The property '#{build_fragment(fragments)}' must be a date in the format of YYYY-MM-DD"
          end
          if REGEXP.match(data)
            begin
              Date.parse(data)
            rescue ArgumentError => e
              raise e unless e.message == 'invalid date'
              validation_error(processor, error_message, fragments, current_schema, self, options[:record_errors])
            end
          else
            validation_error(processor, error_message, fragments, current_schema, self, options[:record_errors])
          end
        end
      end
    end
  end
end
