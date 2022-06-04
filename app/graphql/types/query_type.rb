# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :profiles, resolver: Resolvers::ProfilesResolver, authenticate: true
    field :profile, resolver: Resolvers::ProfileResolver, authenticate: true
  end
end
