class AdvertsController < ApplicationController

  before_filter :member_required, except: [:show]

  before_filter :set_advert, except: [:show]

  # GET /adverts
  # GET /adverts.json
  def index
    @adverts = @advert_class.all
  end

  # GET /adverts/1
  # GET /adverts/1.json
  def show
    @advert = Advert.find(params[:id])
    @lead = @advert.leads.new

    redirect_to :root if !@advert.approved? and !owner_of?(@advert)

  end

  # GET /adverts/new
  # GET /adverts/new.json
  def new
    @advert = @advert_class.new
  end

  # GET /adverts/1/edit
  def edit
    @advert = @advert_class.find(params[:id])
  end

  # POST /adverts
  # POST /adverts.json
  def create
    @advert = @advert_class.new(params[:advert])

    respond_to do |format|
      if @advert.save
        format.html { redirect_to @advert, notice: 'Advert was successfully created.' }
        format.json { render json: @advert, status: :created, location: @advert }
      else
        format.html { render action: "new" }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /adverts/1
  # PUT /adverts/1.json
  def update
    @advert = @advert_class.find(params[:id])

    respond_to do |format|
      if @advert.update_attributes(params[:advert])
        format.html { redirect_to @advert, notice: 'Advert was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adverts/1
  # DELETE /adverts/1.json
  def destroy
    @advert = @advert_class.find(params[:id])
    @advert.destroy

    respond_to do |format|
      format.html { redirect_to adverts_url }
      format.json { head :no_content }
    end
  end

  private

  def set_advert
    if admin?
      @advert_class = Advert
    else
      @advert_class = current_user.adverts
    end
  end

end
