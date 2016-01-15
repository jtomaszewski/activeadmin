require 'active_admin/filters/humanized'

module ActiveAdmin
  module Filters

    class Active
      attr_accessor :filters, :scope

      def initialize(resource_class, params)
        @resource_class, @params = resource_class, params
        @scope = humanize_scope
        @filters = build_filters
      end

      private

      def build_filters
        if params = @params[:q]
          params = params.to_unsafe_h if params.respond_to?(:to_unsafe_h)
          params.map { |param| Humanized.new(param) }
        else
          []
        end
      end

      def humanize_scope
        scope = @params['scope']
        scope ? scope.humanize : "All"
      end
    end

  end
end
