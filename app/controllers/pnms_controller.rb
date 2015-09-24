class PnmsController < ApplicationController
  before_action :set_pnm, only: [:show, :edit, :update, :destroy, :upvote, :downvote, :like]

  # GET /pnms
  # GET /pnms.json
  def index
    if user_signed in?
      if current_user.admin?
        @pnms = Pnm.all
        # ah-ha! here is where we show them what we want to show them 
      
      else
        redirect_to static_path(1)
      end
    end
  end

  # GET /pnms/1
  # GET /pnms/1.json
  def show
  end

  # GET /pnms/new
  def new
    @pnm = Pnm.new
  end

  # GET /pnms/1/edit
  def edit
  end

  # POST /pnms
  # POST /pnms.json
  def create
    @pnm = Pnm.new(pnm_params)

    respond_to do |format|
      if @pnm.save
        format.html { redirect_to @pnm, notice: 'Pnm was successfully created.' }
        format.json { render :show, status: :created, location: @pnm }
      else
        format.html { render :new }
        format.json { render json: @pnm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pnms/1
  # PATCH/PUT /pnms/1.json
  def update
    respond_to do |format|
      if @pnm.update(pnm_params)
        format.html { redirect_to @pnm, notice: 'Pnm was successfully updated.' }
        format.json { render :show, status: :ok, location: @pnm }
      else
        format.html { render :edit }
        format.json { render json: @pnm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pnms/1
  # DELETE /pnms/1.json
  def destroy
    @pnm.destroy
    respond_to do |format|
      format.html { redirect_to pnms_url, notice: 'Pnm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
      @pnm.liked_by current_user
      redirect_to pnms_path
    end

  def upvote
      @pnm.upvote_from current_user
      @pnm.update_attributes(:ups => @pnm.get_upvotes.size)
      @pnm.update_attributes(:downs => @pnm.get_downvotes.size)
      # redirect_to pnms_path
      respond_to do |format|
        format.html { redirect_to @pnm, notice: '*vote of /kappa/ registered *' }
        format.json { render :show }
      end

    end

     def downvote
      @pnm.downvote_from current_user
      @pnm.update_attributes(:downs => @pnm.get_downvotes.size)
      @pnm.update_attributes(:ups => @pnm.get_upvotes.size)
      # redirect_to pnms_path
      respond_to do |format|
        format.html { redirect_to @pnm, notice: '*vote of /gamma/ registered *' }
        format.json { render :show }
      end
    end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pnm
      @pnm = Pnm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pnm_params
      params.require(:pnm).permit(:name, :ups, :downs)
    end
end
