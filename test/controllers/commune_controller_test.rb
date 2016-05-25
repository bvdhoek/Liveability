require 'test_helper'
require_relative '../../app/controllers/communes_controller'

describe CommunesController do
  it 'gets index' do
    get :index
    assert_response :success
  end
end
