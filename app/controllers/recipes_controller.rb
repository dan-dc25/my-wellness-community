class RecipesController < ApplicationController
    def index
        @recipes = current_user.recipes
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.valid?
            @recipe.save
            current_user.recipes << @recipe
            redirect_to user_recipe_path(@recipe.user_id, current_user.id)
        else
            render :new
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

end
