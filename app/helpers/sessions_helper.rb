module SessionsHelper

    def log_in(user)
        session[:user_id] = user.id
        session.delete(:user_preid)
    end

    def pre_log_in(user)
        session[:user_preid] = user.id
    end

    def current_user
        @cuurent_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
