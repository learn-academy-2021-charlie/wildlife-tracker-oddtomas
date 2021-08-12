class SightingsController < ApplicationController

        def index
            sightings = Sighting.all
            render json: sightings
            end
    
        def show
            sighting = Sighting.find(params[:id])
            render json: sighting
        end
    
        def create 
           
            sighting = Sighting.create(sighting_param)
            if sighting.valid?
                render json: sighting
            else
                render json: sighting.errors
            end
    
    
        end
    
    
        def update
            sighting = Sighting.find(params[:id])
            
            if sighting.update(sighting_param)
                render json: sighting
            else
                render json: sighting.errors
            end
        end
           
    
        def destroy
            sighting = Sighting.find(params[:id]).delete
            render json: 'deleted'
        end
        
        private
            def sighting_param
                params.require(:sighting).permit(:date, :latitude, :longitude)
            end
    
    
end
