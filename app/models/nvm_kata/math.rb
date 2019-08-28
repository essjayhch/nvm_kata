# frozen_string_literal: true

module NvmKata
  # Math Model
  class Math
    include ::ActiveModel::Model

    attr_accessor :primitive
    validates :primitive, presence: true
    validates :primitive, numericality: true

    def +(other)
      Rails.logger.info('+')
      primitive + other
    rescue StandardError => e
      raise Error, e
    end

    def -(other)
      Rails.logger.info('-')
      primitive - other
    rescue StandardError => e
      raise Error, e
    end

    def *(other)
      Rails.logger.info('x')
      primitive *  other
    rescue StandardError => e
      raise Error, e
    end

    def /(other)
      Rails.logger.info('/')
      primitive / other
    rescue StandardError => e
      raise Error, e
    end

    def !
      tmp = primitive.to_i
      unless tmp == primitive && primitive.positive?
        raise Error, 'Invalid factorial (Must be positive integer)'
      end

      (1..primitive).inject(:*) || 1
    end

    class Error < StandardError
    end
  end
end
