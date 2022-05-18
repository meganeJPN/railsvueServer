module Api
    module V1
      class HealthCheckController < ApplicationController
        def index
            head:ok
            response.set_header('test', 'harukabe OK')
        end
      end
    end
  end