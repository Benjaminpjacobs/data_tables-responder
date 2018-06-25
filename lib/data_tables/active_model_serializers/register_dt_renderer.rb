# In controllers, use `render dt: model` rather than `render json: model, adapter: :dt`.
#
# For example, in a controller action, we can:
# respond_to do |format|
#   format.dt { render dt: model }
# end
#
# or
#
# render dt: model
#
# No wrapper format needed as it does not apply (i.e. no `wrap_parameters format: [dt]`)
module DataTables
  module ActiveModelSerializers
    MEDIA_TYPE = 'application/json'.freeze
    HEADERS = {
      response: { 'CONTENT_TYPE'.freeze => MEDIA_TYPE },
      request:  { 'ACCEPT'.freeze => MEDIA_TYPE }
    }.freeze

    def self.install
      # actionpack/lib/action_dispatch/http/mime_types.rb
      Mime::Type.register_alias MEDIA_TYPE, :dt, %w( text/plain text/x-json application/jsonrequest application/dt application/datatable )

      # if Rails::VERSION::MAJOR >= 5
      #   ActionDispatch::Request.parameter_parsers[:dt] = parser
      # else
      #   ActionDispatch::ParamsParser::DEFAULT_PARSERS[Mime[:dt]] = parser
      # end

      ::ActionController::Renderers.add :dt do |json, options|
        json = serialize_dt(json, options).to_json(options) unless json.is_a?(String)
        self.content_type ||= Mime[:dt]
        self.response_body = json
      end
    end

    module ControllerSupport
      def serialize_dt(resource, options)
        options[:adapter] = :dt
        options.fetch(:serialization_context) do
          options[:serialization_context] = ::ActiveModelSerializers::SerializationContext.new(request)
        end
        # Magic happens here
        resource = DataTables::Responder.respond(resource, request.params)
        get_serializer(resource, options)
      end
    end
  end
end

