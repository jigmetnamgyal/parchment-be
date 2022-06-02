# frozen_string_literal: true

module Graphql
  module ExecutionErrorResponder
    extend ActiveSupport::Concern

    included do
      def execution_error(message: nil, status: :unprocessable_entity, code: 422)
        GraphQL::ExecutionError.new(message, options: { status: status, code: code })
      end
    end
  end
end
