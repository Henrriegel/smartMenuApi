module Api
    module Sessions
        class UsersController < ApplicationController

            # Log in post
            def create
                user = User.find_sole_by(["email = ?", login_params[:email]]) rescue nil
                if user
                    if user['password'] == login_params[:password]
                        render json: {
                            errorMessage: "",
                            data: user
                        }, status: :ok
                    else
                        render json: {
                            errorMessage: "Incorrect password",
                            data: ""
                        }, status: :unprocessable_entity
                    end
                else
                    render json: {
                        errorMessage: "User not found",
                        data: ""
                    }, status: :unprocessable_entity
                end
                
            end

            private
                def login_params
                    params.permit(:email, :password)
                end
        end
    end
end