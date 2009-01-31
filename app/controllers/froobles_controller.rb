class FrooblesController < ApplicationController
  # GET /froobles
  # GET /froobles.xml
  def index
    @froobles = Frooble.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @froobles }
    end
  end

  # GET /froobles/1
  # GET /froobles/1.xml
  def show
    @frooble = Frooble.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @frooble }
    end
  end

  # GET /froobles/new
  # GET /froobles/new.xml
  def new
    @frooble = Frooble.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @frooble }
    end
  end

  # GET /froobles/1/edit
  def edit
    @frooble = Frooble.find(params[:id])
  end

  # POST /froobles
  # POST /froobles.xml
  def create
    @frooble = Frooble.new(params[:frooble])

    respond_to do |format|
      if @frooble.save
        flash[:notice] = 'Frooble was successfully created.'
        format.html { redirect_to(@frooble) }
        format.xml  { render :xml => @frooble, :status => :created, :location => @frooble }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @frooble.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /froobles/1
  # PUT /froobles/1.xml
  def update
    @frooble = Frooble.find(params[:id])

    respond_to do |format|
      if @frooble.update_attributes(params[:frooble])
        flash[:notice] = 'Frooble was successfully updated.'
        format.html { redirect_to(@frooble) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @frooble.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /froobles/1
  # DELETE /froobles/1.xml
  def destroy
    @frooble = Frooble.find(params[:id])
    @frooble.destroy

    respond_to do |format|
      format.html { redirect_to(froobles_url) }
      format.xml  { head :ok }
    end
  end
end
