require 'active_model_serializers'

module DataTables
  module ActiveModelSerializers
    class Adapter < ::ActiveModelSerializers::Adapter::Json
      extend ActiveSupport::Autoload
      autoload :Pagination
      autoload :Meta

      def serializable_hash(options = nil)
        options = serialization_options(options)

        serialized_hash = {
          data: ::ActiveModelSerializers::Adapter::Attributes.new(serializer, instance_options).serializable_hash(options)
        }
        serialized_hash[meta_key] = meta unless meta.blank?
        serialized_hash.merge!(pagination) unless pagination.blank?

        self.class.transform_key_casing!(serialized_hash, instance_options)
      end

      def meta_key
        instance_options.fetch(:meta_key, 'meta'.freeze)
      end

      protected

      def pagination
        Pagination.new(serializer).as_h
      end

      def meta
        {
          sql: serializer.object.to_sql
        }.merge(instance_options.fetch(:meta, {}))
        # }.merge(Meta.new(@serializer))
      end
    end
  end
end
