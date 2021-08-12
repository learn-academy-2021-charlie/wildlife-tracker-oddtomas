class AnimalsController < ApplicationController

    def index
        animals = Animal.all
        render json: animals
        end

    def show
        animal = Animal.find(params[:id])
        sighting = animal.as_json(include: :sightings)  #shows animal and the  sighting , as_json , include #associated table item.
        # sighting = animal include:sightings
        render json: sighting

    end

    def create 
       
        animal = Animal.create(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end


    end


    def update
        animal = Animal.find(params[:id])
        
        if animal.update(animal_params)
            render json: animal
        else
            render json: animal.errors
        end
    end
       

    def destroy
        animal = Animal.find(params[:id]).delete
        render json: 'deleted'
    end
    
    private
        def animal_params
            params.require(:animal).permit(:common, :latin, :kingdom)
        end
end
