require 'rails/railtie'
require 'quick_count/railtie'
require 'data_tables/active_model_serializers/register_dt_renderer'

module DataTables
  module Responder
    class Railtie < ::Rails::Railtie
      initializer 'data_tables-responder.action_controller', after: 'active_model_serializers.action_controller' do

        ::ActiveModelSerializers::Adapter.register(:dt, DataTables::ActiveModelSerializers::Adapter)

        ::ActiveSupport.on_load(:action_controller) do
          DataTables::ActiveModelSerializers.install
          include DataTables::ActiveModelSerializers::ControllerSupport
        end

        ::ActiveSupport.on_load(:active_record) do
          if defined?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
            ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.include DataTables::DatabaseStatements::PostgreSQL
          end

          if defined?(ActiveRecord::ConnectionAdapters::Mysql2Adapter)
            ActiveRecord::ConnectionAdapters::Mysql2Adapter.include DataTables::DatabaseStatements::MySQL
          end
        end
      end
    end
  end
end
