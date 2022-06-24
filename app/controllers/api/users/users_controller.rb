module Api
    module Users
        class UsersController < ApplicationController
            # Read all
            def index
                users = User.order('id');
                render json: {
                    errorMessage: "",
                    data: users
                }, status: :ok
            end

            # Read one user with id
            def show
                user = User.find(params[:id]) rescue nil
                if user
                    render json: {
                        errorMessage: "",
                        data: user
                    }, status: :ok
                else
                    render json: {
                        errorMessage: "User not found",
                        data: ""
                    }, status: :unprocessable_entity
                end
            end

            # Create new user
            def create
                user = User.new(user_params)
                if user.save
                    render json: {
                        errorMessage: "",
                        data: user
                    }, status: :ok
                else
                    render json: {
                        errorMessage: user.errors,
                        data: ""
                    }, status: :unprocessable_entity
                end
            end

            # Delete user by id
            def destroy
                user = User.find(params[:id])
                if user.destroy
                    render json: {
                        errorMessage: "",
                        data: user
                    }, status: :ok
                else
                    render json: {
                        errorMessage: user.errors,
                        data: ""
                    }, status: :unprocessable_entity
                end
            end

            # Update user
            def update
                user = User.find(params[:id]) rescue nil
                if user
                    if user.update(user_params)
                        render json: {
                            errorMessage: "",
                            data: user
                        }, status: :ok
                    else
                        render json: {
                            errorMessage: user.errors,
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

            # Parameters needed for the creation - same as Model data required
            private
            def user_params
                params.permit(:name, :cellphone, :email, :password, :role)
            end
        end
    end
end