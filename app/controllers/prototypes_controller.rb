class PrototypesController < ApplicationController
    before_action :authenticate_user!  ,except: [:index, :show] #ログインしていない場合、ログインページにリダイレクト showとindexを除いて
    before_action :move_to_index, except: [:index, :show, :new,:create]
    before_action :set_prototype, only:[:edit,:show]
  def index
    @prototypes = Prototype.all
  end 

  def new
    @prototype = Prototype.new
  end
  
  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
   # @prototype = Prototype.find(params[:id])
    @comment =  Comment.new
    @comments = @prototype.comments
  end

  def edit 
   # @prototype = Prototype.find(params[:id])
   end

  def update
    @prototype =Prototype.find(params[:id]) 
     if @prototype.update(prototype_params) 
       redirect_to  prototype_path(@prototype)
       else
        render :edit
      
     end
    end

    def destroy
      @prototype = Prototype.find(params[:id]) 
      @prototype.destroy 
      redirect_to root_path 
    end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
    
  end
  def prototype_params  
    params.require(:prototype).permit(:image,:title,:catch_copy,:concept, ).merge(user_id: current_user.id) 
  end

  def move_to_index
    @prototype = Prototype.find(params[:id])
    unless user_signed_in? && @prototype.user == current_user
      redirect_to action: :index
    end
  end
end
