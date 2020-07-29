class RecipesController < ApplicationController
    before_action :authenticate_user!
    def index
        if !user_signed_in?
            @recipes = Recipe.all.sort_by{ |h| h.name }
         else
             @user = current_user
             @recipes = current_user.recipes
             render :show
         end
    end

    def show
        if params[:user_id]
            @user = User.find(params[:id])
            @recipe = Recipe.find(params[:id])
            @name = Recipe.name
            @ingredients = Recipe.ingredient
            @instructions = Recipe.instruction
            @cook_time = Recipe.cook_time
        else
            redirect_to recipes_path
        end
    end
       

    def new
       @recipe = Recipe.new
    end
   
    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.user_id = current_user.id
        if @recipe.valid?
            @recipe.save
            current_user.recipes << @recipe
            redirect_to recipe_path(current_user.id)
        else
            flash[:errors] = "Could not save recipe. Try again."
            render :new
        end
    end

    def edit
        @recipe = Recipe.find_by(id: params[:id])
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
