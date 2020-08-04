class RecipesController < ApplicationController
    before_action :authenticate_user!
    def index
        #if @user == current_user
            @recipes = current_user.recipes.all
        #else
            #@recipes = Recipe.all
        #end
    end

    def new
       @recipe = Recipe.new(params[:user_id])
    end
 
    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.user_id = current_user.id
        if @recipe.valid?
            @recipe.save
            redirect_to recipe_path(@recipe)
        else
            flash[:errors] = "Could not save recipe. Try again."
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        @recipe = Recipe.find_by(id: params[:id])
    end
       
    def edit
        @recipe = Recipe.find(params[:id])
    end
   
    def update
        @recipe = Recipe.find(params[:id])
        if @recipe.update_attributes(recipe_params)
            redirect_to recipes_path(@recipe)
            flash[:notice] = 'post was updated.'
        else
            render :edit
        end
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        redirect_to recipes_path(@recipe)
    end

    private
    def recipe_params
        params.require(:recipe).permit(:ingredients, :name, :instructions, :cook_time, :user_id)
    end
end
