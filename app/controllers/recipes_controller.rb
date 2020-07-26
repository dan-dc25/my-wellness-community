class RecipesController < ApplicationController
    def index
        if !params[:user_id]
            @recipes = Recipe.all
        else
            @recipes = @user.recipes
        end
    end

    def show
        @recipe = Recipe.find_by(id: params[:id])
        if @recipe
            @user = User.find(@recipe.user_id)
        else
            redirect_to user_recipes_path(user_id)
        end
    end

    def new
        if params[:user_id] && !User.exists?(params[:user_id])
            redirect_to users_path, alert: "User not found"
        else
            @recipe = Recipe.new(user_id: params[:user_id])
        end
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.user_id = @user.id
        if @recipe.valid?
            @recipe.save
            current_user.recipes << @recipe
            redirect_to user_recipe_path(user_id, recipe_id)
        else
            render :new
        end
    end

    def edit
        @user = User.find(params[:user_id])
        @recipe = Recipe.find(params[:id])
    end

    def update
        @recipe = Recipe.find(params[:id])
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        redirect_to user_recipes-path(user_id)
    end

    private
    def recipe_params
        params.require(:recipe).permit(:name, :ingredients, :instructions, :cook_time, :user_id)
    end
end
