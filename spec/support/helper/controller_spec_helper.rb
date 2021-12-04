module Helper
  module ControllerSpec
    def login_user
      before(:each) do
        @user = create(:user)
        sign_in @user
      end
    end
  end
end
