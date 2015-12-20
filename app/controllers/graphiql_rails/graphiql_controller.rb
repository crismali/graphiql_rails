module GraphiqlRails
  class GraphiqlController < GraphiqlRails::ApplicationController
    def graphiql
      render layout: false
    end
  end
end
