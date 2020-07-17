class ApplicationController < ActionController::Base
    def home
    end
    
    helpers do
        def logged_in?
          !!session[:user_id]
        end
    
        def current_user
          User.find_by_id(session[:user_id])
        end
    
        def require_login
          unless logged_in?
            redirect "/login"
          end
        end
      end
end
