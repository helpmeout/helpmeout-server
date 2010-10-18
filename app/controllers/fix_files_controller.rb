class FixFilesController < ApplicationController
  # GET /fix_files
  # GET /fix_files.xml
  def index
    @fix_files = FixFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fix_files }
    end
  end

  # GET /fix_files/1
  # GET /fix_files/1.xml
  def show
    @fix_file = FixFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fix_file }
    end
  end

  # GET /fix_files/new
  # GET /fix_files/new.xml
  def new
    @fix_file = FixFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fix_file }
    end
  end

  # GET /fix_files/1/edit
  def edit
    @fix_file = FixFile.find(params[:id])
  end

  # POST /fix_files
  # POST /fix_files.xml
  def create
    @fix_file = FixFile.new(params[:fix_file])

    respond_to do |format|
      if @fix_file.save
        format.html { redirect_to(@fix_file, :notice => 'Fix file was successfully created.') }
        format.xml  { render :xml => @fix_file, :status => :created, :location => @fix_file }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fix_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fix_files/1
  # PUT /fix_files/1.xml
  def update
    @fix_file = FixFile.find(params[:id])

    respond_to do |format|
      if @fix_file.update_attributes(params[:fix_file])
        format.html { redirect_to(@fix_file, :notice => 'Fix file was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fix_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fix_files/1
  # DELETE /fix_files/1.xml
  def destroy
    @fix_file = FixFile.find(params[:id])
    @fix_file.destroy

    respond_to do |format|
      format.html { redirect_to(fix_files_url) }
      format.xml  { head :ok }
    end
  end
end
