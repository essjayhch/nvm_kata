# frozen_string_literal: true

# Kata Module
module NvmKata
  # Math Controller
  class MathController < ApplicationController
    before_action :coerce_params
    def add
      @res = NvmKata::Math.new(primitive: @a) + @b
      render json: { status: :ok, result: @res }
    rescue NvmKata::Math::Error
      error('+')
    end

    def sub
      @res = NvmKata::Math.new(primitive: @a) - @b
      render json: { status: :ok, result: @res }
    rescue NvmKata::Math::Error
      error('-')
    end

    def mul
      @res = NvmKata::Math.new(primitive: @a) * @b
      render json: { status: :ok, result: @res }
    rescue NvmKata::Math::Error
      error('*')
    end

    def divide
      @res = NvmKata::Math.new(primitive: @a) / @b
      render json: { status: :ok, result: @res }
    rescue NvmKata::Math::Error
      error('/')
    end

    def fact
      @res = NvmKata::Math.new(primitive: @a.to_i).!
      render json: { status: :ok, result: @res }
    rescue NvmKata::Math::Error => e
      error('!', e)
    end

    private

    def coerce_params
      @a = Float(params[:a])
      @b = Float(params[:b]) if params[:b]
    rescue StandardError
      render json: {
        status: :invalid_query,
        request_params: {
          primitive: params[:a],
          operand: params[:b]
        }, error: 'Invalid request_parmas: Not coercible to float'
      }, status: 400
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
