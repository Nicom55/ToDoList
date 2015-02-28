class HomesController < ApplicationController

   def index
     @lists = List.all.order("updated_at DESC")
   end
  
end