# frozen_string_literal: true

# Kata Module
module NvmKata
  # Math Controller
  class MathController < ApplicationController
    before_action :coerce_params

    def add
      handle_it(:+)
    end

    def sub
      handle_it(:-)
    end

    def mul
      handle_it(:*)
    end

    def divide
      handle_it(:/)
    end

    def fact
      render json: { status: :ok, result: @a.send(:!) }
    rescue NvmKata::Math::Error => e
      error('!', e)
    end

    private

    def handle_it(operand)
      render json: { status: :ok, result: @a.send(operand, @b) }
    rescue NvmKata::Math::Error => e
      error(operand, e)
    end

    def coerce_params
      @a = NvmKata::Math.new(primitive: Float(params[:a]))
      @b = Float(params[:b]) if params[:b]
    rescue StandardError => e
      error('coerce', "Invalid params : Not coercible to float #{e}")
    end

    def error(operator, message = 'invalid parameters')
      render json: {
        status: :invalid_query,
        request_params: {
          primitive: params[:a],
          operator: operator,
          operand: params[:b]
        }, error: message
      }, status: 400
    end
  end
end
