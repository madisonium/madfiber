require 'spec_helper'

describe PinsController do

  describe 'POST /pins' do
    def do_post
      post :create, {:name => 'bob', :zip => '53715'}
    end
    it 'creates a pin' do
      lambda do
        do_post
      end.should change(Pin).by(1)
    end

    it 'redirects to welcome#hi' do
      do_post
      response.should redirect_to(root_path)
    end
  end
end
