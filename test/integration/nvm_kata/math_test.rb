# frozen_string_literal: true

require 'test_helper'

module NvmKata
  class MathControllerTest < ActionDispatch::IntegrationTest
    test '1 + 1 == 2' do
      get '/api/v1/1/add/1'
      assert_response :success
      body = JSON.parse(response.body)
      assert_equal(2.0, body['result'])
    end

    # Validate what happens when you pass in junk
    test '1 + abc == Error' do
      get '/api/v1/1/add/abc'
      assert_response :bad_request
    end

    test 'abc + 1 == Error' do
      get '/api/v1/abc/add/1'
      assert_response :bad_request
    end

    # End junk validation

    # Validate that the API sort of does addition
    # This is very crude and only hadnles positive integers
    test 'N + M == (N+M)' do
      a = Array.new(10) { rand(1...1000) }
      b = Array.new(10) { rand(1...1000) }

      (0..9).each do |i|
        get "/api/v1/#{a[i]}/add/#{b[i]}"
        assert_response :success
        body = JSON.parse(response.body)
        assert_equal((a[i] + b[i]).to_f, body['result'])
      end
    end

    # Validate that the sub does as it sort of should
    test '2 - 1  == 1' do
      get '/api/v1/2/sub/1'
      assert_response :success
      body = JSON.parse(response.body)
      assert_equal(1.0, body['result'])
    end

    test '5 - 2 == 3' do
      get '/api/v1/5/sub/2'
      assert_response :success
      body = JSON.parse(response.body)
      assert_equal(3.0, body['result'])
    end

    test "15 * 23 == #{15 * 23}" do
      get '/api/v1/15/mul/23'
      assert_response :success
      body = JSON.parse(response.body)
      assert_equal((15 * 23).to_f, body['result'])
    end

    test "1234 / 234 == #{1234 / 234}" do
      get '/api/v1/1234/div/234'
      assert_response :success
      body = JSON.parse(response.body)
      assert_equal((1234.0 / 234.0), body['result'])
    end

    test '69!' do
      get '/api/v1/69/fact'
      assert_response :success
      body = JSON.parse(response.body)
      res = '171122452428141311372468338881272839092270544'\
        '893520369393648040923257279754140647424000000000000000'.to_i
      assert_equal(res, body['result'])
    end

    test '5!' do
      get '/api/v1/5/fact'
      assert_response :success
      body = JSON.parse(response.body)
      assert_equal(120, body['result'])
    end

    test '0.1234!' do
      get '/api/v1/0.1234/fact'
      assert_response :bad_request
    end
  end
end
