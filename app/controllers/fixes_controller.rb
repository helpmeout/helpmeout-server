class FixesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  # GET /fixes
  # GET /fixes.xml
  def index
    @fixes = Fix.scoped(:include => :fix_files)
    if params[:backtrace].present?
      @fixes = @fixes.where('backtrace LIKE ?', params[:backtrace])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fixes, :include => :fix_files }
    end
  end

  # GET /fixes/1
  # GET /fixes/1.xml
  def show
    @fix = Fix.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fix }
    end
  end

  # GET /fixes/new
  # GET /fixes/new.xml
  def new
    @fix = Fix.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fix }
    end
  end

  # GET /fixes/1/edit
  def edit
    @fix = Fix.find(params[:id])
  end

  # POST /fixes
  # POST /fixes.xml
  def create
    @fix = Fix.new(params[:fix])

    respond_to do |format|
      if @fix.save
        format.html { redirect_to(@fix, :notice => 'Fix was successfully created.') }
        format.xml  { render :xml => @fix, :status => :created, :location => @fix }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fix.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fixes/1
  # PUT /fixes/1.xml
  def update
    @fix = Fix.find(params[:id])

    respond_to do |format|
      if @fix.update_attributes(params[:fix])
        format.html { redirect_to(@fix, :notice => 'Fix was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fix.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fixes/1
  # DELETE /fixes/1.xml
  def destroy
    @fix = Fix.find(params[:id])
    @fix.destroy

    respond_to do |format|
      format.html { redirect_to(fixes_url) }
      format.xml  { head :ok }
    end
  end
end
